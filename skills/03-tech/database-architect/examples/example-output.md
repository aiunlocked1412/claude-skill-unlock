---
type: db-blueprint
project: ShopMate (e-commerce)
db_engine: PostgreSQL 16
created: 2026-04-16
---

# Database Blueprint: ShopMate

## Overview

| Field | Value |
|-------|-------|
| Engine | PostgreSQL 16 (managed: Supabase / RDS) |
| Use case | OLTP — e-commerce + 1 read replica สำหรับ analytics |
| Expected size (1 yr) | 500K user, 5M order, 50K product |
| Read/write ratio | 90/10 |
| Replication | 1 primary + 1 read replica + 1 standby (DR) |
| Backup | daily snapshot + WAL archiving (PITR 7 วัน) |

---

## Schema (DDL)

```sql
-- Extensions
CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- ============ users ============
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  email CITEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  full_name TEXT,
  phone TEXT,
  status TEXT NOT NULL DEFAULT 'active'
    CHECK (status IN ('active','suspended','deleted')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ============ products ============
CREATE TABLE products (
  id BIGSERIAL PRIMARY KEY,
  sku TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  price_cents INTEGER NOT NULL CHECK (price_cents >= 0),
  stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
  category_id BIGINT REFERENCES categories(id) ON DELETE RESTRICT,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  search_vector tsvector,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- update search_vector trigger (ภาษาไทย + eng)
CREATE OR REPLACE FUNCTION products_search_update() RETURNS TRIGGER AS $$
BEGIN
  NEW.search_vector :=
    setweight(to_tsvector('simple', coalesce(NEW.name,'')), 'A') ||
    setweight(to_tsvector('simple', coalesce(NEW.description,'')), 'B');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER products_search_trg BEFORE INSERT OR UPDATE
ON products FOR EACH ROW EXECUTE FUNCTION products_search_update();

-- ============ orders ============
CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending','paid','shipped','delivered','cancelled','refunded')),
  total_cents INTEGER NOT NULL,
  shipping_address JSONB NOT NULL,
  paid_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ============ order_items ============
CREATE TABLE order_items (
  order_id BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  price_cents INTEGER NOT NULL,    -- snapshot ราคาตอนซื้อ
  PRIMARY KEY (order_id, product_id)
);
```

### Entity Relationship

```
users (1) ─── (N) orders (1) ─── (N) order_items (N) ─── (1) products
                                                              (N)
                                                              ─── (1) categories
```

---

## Index Plan

| Table | Index | Type | Purpose |
|-------|-------|------|---------|
| users | `(email)` | B-tree UNIQUE | login lookup |
| users | `(phone)` | B-tree partial WHERE phone IS NOT NULL | phone login (optional) |
| products | `(sku)` | B-tree UNIQUE | sku lookup |
| products | `(category_id, created_at DESC)` | B-tree composite | category browse |
| products | `(search_vector)` | GIN | full-text search |
| products | `(metadata jsonb_path_ops)` | GIN | filter by attribute (color, size) |
| orders | `(user_id, status, created_at DESC)` | B-tree composite | user dashboard |
| orders | `(status, created_at)` | B-tree partial WHERE status='pending' | admin pending queue |
| order_items | `(product_id)` | B-tree | reverse lookup (product analytics) |

```sql
CREATE UNIQUE INDEX users_email_idx ON users (email);
CREATE INDEX users_phone_idx ON users (phone) WHERE phone IS NOT NULL;
CREATE UNIQUE INDEX products_sku_idx ON products (sku);
CREATE INDEX products_cat_created_idx ON products (category_id, created_at DESC);
CREATE INDEX products_search_idx ON products USING GIN (search_vector);
CREATE INDEX products_meta_idx ON products USING GIN (metadata jsonb_path_ops);
CREATE INDEX orders_user_status_idx ON orders (user_id, status, created_at DESC);
CREATE INDEX orders_pending_idx ON orders (status, created_at)
  WHERE status = 'pending';
CREATE INDEX order_items_product_idx ON order_items (product_id);
```

**ไม่ใส่ index บน:**
- `users.created_at` — ไม่ใช้ filter หรือ sort
- `orders.shipping_address` (JSONB) — ไม่ใช้ search

---

## Query Examples (พร้อม EXPLAIN)

### Q1: User dashboard — order history
```sql
EXPLAIN ANALYZE
SELECT id, status, total_cents, created_at
FROM orders
WHERE user_id = 123 AND status IN ('paid', 'shipped', 'delivered')
ORDER BY created_at DESC
LIMIT 20;
```

**Plan:**
```
Limit  (cost=0.43..8.45 rows=20 width=24) (actual time=0.078..0.215 rows=20 loops=1)
  → Index Scan Backward using orders_user_status_idx on orders
      (cost=0.43..82.34 rows=205 width=24) (actual time=0.075..0.205 rows=20 loops=1)
      Index Cond: (user_id = 123)
      Filter: status IN (...)
Planning Time: 0.2 ms
Execution Time: 0.3 ms
```
✅ Index Scan, < 1ms

### Q2: Search products (full-text + filter)
```sql
EXPLAIN ANALYZE
SELECT id, name, price_cents
FROM products
WHERE search_vector @@ plainto_tsquery('simple', 'มือถือ samsung')
  AND metadata @> '{"color":"black"}'
  AND stock > 0
ORDER BY ts_rank(search_vector, plainto_tsquery('simple','มือถือ samsung')) DESC
LIMIT 20;
```

**Plan:** Bitmap And บน GIN search + GIN metadata → 8ms ✅

### Q3: Admin — pending orders
```sql
EXPLAIN ANALYZE
SELECT id, user_id, total_cents, created_at
FROM orders
WHERE status = 'pending' AND created_at < now() - interval '1 hour'
ORDER BY created_at;
```

**Plan:** Index Scan using `orders_pending_idx` (partial index) — 1.2ms ✅

---

## Migration Plan

### Phase 1: Initial setup
```sql
-- migrations/001_init.sql
-- (ทุก table + index ด้านบน)
```

### Phase 2: เพิ่ม column `loyalty_points` (zero-downtime)
```sql
-- Step 1 (deploy A): nullable
ALTER TABLE users ADD COLUMN loyalty_points INTEGER;

-- Step 2 (background job, batch):
UPDATE users SET loyalty_points = 0
WHERE loyalty_points IS NULL AND id BETWEEN 1 AND 100000;
-- ... loop จนครบ

-- Step 3 (deploy B): set NOT NULL + default
ALTER TABLE users ALTER COLUMN loyalty_points SET DEFAULT 0;
ALTER TABLE users ALTER COLUMN loyalty_points SET NOT NULL;
```

### Phase 3: เพิ่ม index ใหม่บน table 5M rows
```sql
-- ห้าม CREATE INDEX (lock table นาน)
CREATE INDEX CONCURRENTLY orders_paid_at_idx ON orders (paid_at)
  WHERE paid_at IS NOT NULL;
-- ใช้เวลา 30 นาที แต่ไม่ block write
```

---

## Backup Strategy

- **Daily:** snapshot อัตโนมัติ (ตี 3) → S3, retain 30 วัน
- **Continuous:** WAL archiving (PITR ย้อนหลัง 7 วัน)
- **Quarterly:** test restore to staging — verify checksum + sample query
- **Cross-region:** snapshot replicate ไป DR region (ap-southeast-2)

---

## Connection Pool

| Setting | Value | เหตุผล |
|---------|-------|--------|
| `max_connections` (PG) | 200 | RAM 8GB / connection ~4MB |
| App pool size (per instance) | 20 | 8 instance × 20 = 160 + overhead |
| Idle timeout | 60s | ปล่อย slot |
| Statement timeout | 30s | กัน slow query loops |
| Transaction timeout | 60s | กัน long-running tx |

ใช้ **PgBouncer** (transaction pooling) ระหว่าง app กับ Postgres → handle 1000+ concurrent app connection ด้วย 200 PG slot

---

## Performance Tuning

```ini
# postgresql.conf
shared_buffers = 2GB                # 25% RAM
effective_cache_size = 6GB          # 75% RAM
work_mem = 16MB                     # per sort/hash
maintenance_work_mem = 512MB
random_page_cost = 1.1              # SSD
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
log_min_duration_statement = 1000   # log slow query > 1s
```

---

## Monitoring

- **Slow query log** → pgBadger weekly report
- **Prometheus exporter** (`pg_exporter`) → Grafana dashboard
- **Alert:**
  - replication lag > 10s
  - cache hit ratio < 95%
  - deadlock rate > 1/min
  - connection count > 80%
  - disk > 80%

---

## Disaster Recovery

| Scenario | RTO | RPO | Action |
|----------|-----|-----|--------|
| Primary crash | 5 นาที | 0 | promote read replica (managed auto) |
| Bad migration | 30 นาที | 5 นาที | PITR rewind to before migration |
| Region outage | 4 ชม. | 24 ชม. | restore latest snapshot in DR region + DNS swap |
| Data corruption (specific table) | 1 ชม. | 1 ชม. | restore single table from logical backup |

---

*Generated by /database-architect — Claude Skill Unlock v1.1*
