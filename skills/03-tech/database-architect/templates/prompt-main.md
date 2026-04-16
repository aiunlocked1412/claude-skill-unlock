# Prompt Main — Database Architect

## Schema Design Decision Matrix

### SQL vs NoSQL

| Need | SQL (Postgres) | NoSQL |
|------|----------------|-------|
| Multi-table transaction (ACID) | ✅ | Mongo limited / DynamoDB เปลี่ยน |
| Complex JOIN | ✅ | ❌ (denormalize) |
| Schema-less / flexible | JSONB column | ✅ |
| Horizontal scale infinite | Citus / read replica | ✅ |
| Time-series | TimescaleDB ext | InfluxDB |
| Vector search | pgvector | Pinecone/Weaviate |
| Geospatial | PostGIS | MongoDB 2dsphere |

**Rule:** เริ่มที่ Postgres เสมอ ยกเว้นมีเหตุผลชัด

### Normalization Level

| Form | Use case |
|------|----------|
| 3NF (default) | OLTP — write-heavy, integrity สำคัญ |
| Denormalized | OLAP — read-heavy dashboard, reporting |
| Hybrid | OLTP main + materialized view สำหรับ report |

## Index Decision Matrix

| Query pattern | Index type |
|---------------|-----------|
| `WHERE col = ?` (high cardinality) | B-tree (default) |
| `WHERE col > ? AND col < ?` | B-tree |
| `WHERE col1 = ? AND col2 = ?` | Composite B-tree (col1 first if = both) |
| `WHERE col LIKE 'prefix%'` | B-tree (left-anchored only) |
| Full-text search ภาษาไทย/eng | GIN + tsvector |
| `WHERE jsonb_col @> '{...}'` | GIN (jsonb_path_ops) |
| `WHERE tags && ARRAY[...]` | GIN |
| Geospatial (PostGIS) | GiST |
| Timestamp range, table > 100M | BRIN |

## EXPLAIN ANALYZE Cheatsheet

| Plan node | Good? | Note |
|-----------|-------|------|
| Index Only Scan | ✅✅ | best — covered index |
| Index Scan | ✅ | good — using index |
| Bitmap Index Scan | OK | OK if multiple indexes |
| Seq Scan (table > 1K rows) | ❌ | missing index |
| Nested Loop (large outer) | ❌ | missing JOIN index |
| Hash Join | ✅ | good for big sets |
| Sort (large rows) | ⚠️ | check work_mem |

**Numbers:**
- `actual time > 100ms` → tune
- `Rows Removed by Filter > 10x rows returned` → bad index
- `Buffers: read >> hit` → cache miss, warm cache

## Migration Safety Levels

| Operation | Safe online? | Strategy |
|-----------|-------------|----------|
| ADD COLUMN nullable | ✅ | direct |
| ADD COLUMN with DEFAULT | ❌ (rewrite) | add nullable → backfill → set default |
| ADD COLUMN NOT NULL | ❌ | nullable → backfill → ALTER NOT NULL |
| DROP COLUMN | ✅ | hide from app first → drop later |
| RENAME COLUMN | ❌ | add new + dual-write + cutover + drop old |
| ADD INDEX | ✅ | `CREATE INDEX CONCURRENTLY` (PG) |
| ADD CHECK CONSTRAINT | ❌ | add NOT VALID → validate later |

## DBA Tone

- วัดก่อนแก้ — EXPLAIN ANALYZE เสมอ
- เริ่ม normal ก่อน denormalize
- Backup + tested restore ก่อนทุก migration
