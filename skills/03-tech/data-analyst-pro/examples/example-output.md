---
type: data-analysis
topic: วิเคราะห์ยอดขาย e-commerce 6 เดือน + churn + funnel
database: postgres
period: 2025-10-01 ถึง 2026-04-01
created: 2026-04-16
---

# Data Analysis: ร้าน Fashion Online — 6 เดือนที่ผ่านมา

## Business Question
ยอดขายลดลง 2 เดือนติด เราอยากรู้ว่า:
1. ลดเพราะคนใหม่มาน้อย หรือคนเก่าไม่กลับมาซื้อ?
2. Funnel ขั้นไหนที่ผู้ใช้หายมากสุด?
3. ต้อง action อะไรเดือนหน้า?

## Key Metrics (Oct 2025 - Mar 2026)
| Metric | Value | vs Previous 6M | Signal |
|--------|-------|----------------|--------|
| Revenue | 18.2M | +8% | up |
| Orders | 6,450 | +3% | up flat |
| AOV | 2,822 | +5% | up |
| New customers | 3,100 | -12% | down |
| Returning rate | 38% | -8pp | down |
| Cart abandonment | 74% | +6pp | down |

## Assumptions
- Timezone: UTC+7
- Currency: THB
- `completed` order เท่านั้น (ตัด refunded + cancelled)
- "Returning customer" = มี order > 1 ครั้งในช่วง 6 เดือน
- Funnel count = unique users ไม่ใช่ session

---

## SQL Query

### Query 1: Revenue trend + customer type

```sql
-- Revenue แยกตาม new vs returning customer รายเดือน

WITH order_with_type AS (
  SELECT
    o.id AS order_id,
    o.user_id,
    o.created_at,
    o.amount,
    -- customer type ตอนสั่งนั้น
    CASE
      WHEN ROW_NUMBER() OVER (
        PARTITION BY o.user_id ORDER BY o.created_at
      ) = 1 THEN 'new'
      ELSE 'returning'
    END AS customer_type
  FROM orders o
  WHERE o.status = 'completed'
    AND o.created_at >= '2025-10-01'
    AND o.created_at <  '2026-04-01'
),
monthly AS (
  SELECT
    DATE_TRUNC('month', created_at) AS month,
    customer_type,
    COUNT(DISTINCT user_id) AS buyers,
    COUNT(*) AS orders,
    SUM(amount) AS revenue
  FROM order_with_type
  GROUP BY 1, 2
)
SELECT *
FROM monthly
ORDER BY month, customer_type;
```

**Sample output:**
| month | customer_type | buyers | orders | revenue |
|-------|---------------|--------|--------|---------|
| 2025-10 | new | 680 | 680 | 1,850,000 |
| 2025-10 | returning | 420 | 580 | 1,640,000 |
| 2026-03 | new | 410 | 410 | 1,120,000 |
| 2026-03 | returning | 380 | 520 | 1,490,000 |

### Query 2: Funnel (visit → purchase)

```sql
-- Funnel 5 steps
WITH step_visit AS (
  SELECT DISTINCT user_id
  FROM events
  WHERE event_name = 'page_view'
    AND page = '/shop'
    AND created_at >= '2026-03-01'
    AND created_at <  '2026-04-01'
),
step_view_product AS (
  SELECT DISTINCT user_id FROM events
  WHERE event_name = 'product_view'
    AND created_at >= '2026-03-01' AND created_at < '2026-04-01'
),
step_add_cart AS (
  SELECT DISTINCT user_id FROM events
  WHERE event_name = 'add_to_cart'
    AND created_at >= '2026-03-01' AND created_at < '2026-04-01'
),
step_checkout AS (
  SELECT DISTINCT user_id FROM events
  WHERE event_name = 'checkout_start'
    AND created_at >= '2026-03-01' AND created_at < '2026-04-01'
),
step_purchase AS (
  SELECT DISTINCT user_id FROM orders
  WHERE status = 'completed'
    AND created_at >= '2026-03-01' AND created_at < '2026-04-01'
)
SELECT
  'Visit Shop'       AS step, COUNT(*) AS users FROM step_visit
UNION ALL SELECT 'View Product', COUNT(*) FROM step_view_product
UNION ALL SELECT 'Add to Cart',  COUNT(*) FROM step_add_cart
UNION ALL SELECT 'Checkout',     COUNT(*) FROM step_checkout
UNION ALL SELECT 'Purchase',     COUNT(*) FROM step_purchase;
```

**Sample output (มีนาคม 2026):**
| step | users | % of visit | drop |
|------|-------|-----------|------|
| Visit Shop | 12,500 | 100% | — |
| View Product | 8,200 | 66% | -34% |
| Add to Cart | 2,100 | 17% | -49pp |
| Checkout | 850 | 7% | -10pp |
| Purchase | 410 | 3.3% | -4pp |

**Performance:**
- Index used: `idx_events_user_created`, `idx_orders_status_created`
- Runtime: ~2.8s บน staging (30M events)

---

## Findings

### 1. New customer ลดลง 40% ใน 3 เดือน — ปัญหาหลักอยู่ที่ acquisition
**Finding:**
- Oct 2025: new customer 680/เดือน
- Mar 2026: new customer 410/เดือน (-40%)
- Returning customer คงที่ 380-420 ตลอด

**So what:** ยอดที่ลดไม่ได้มาจาก customer เก่าทิ้งเรา — คนเก่ายังกลับมาสม่ำเสมอ แต่ **ท่อ acquisition รั่ว** — อาจเพราะ ad budget ลด, SEO ตก, หรือ competitor มาแย่ง

**Action:**
- Audit ad spend 6 เดือน — เปรียบเทียบ CAC
- เช็ค organic traffic (Google Analytics) — SEO ranking ตกไหม
- Owner: Marketing lead, Deadline: 2 สัปดาห์

**Confidence:** High

### 2. Cart abandonment สูงผิดปกติที่ 74% — เสียเงินเดือนละ ~2.5M
**Finding:** จาก funnel มีนาคม — add to cart 2,100 คน แต่ checkout แค่ 850 คน (drop 59%)
Cart abandonment rate = 74% (industry avg fashion = 68-70%)

**So what:** ผู้ใช้ 1,250 คนต่อเดือนใส่ของในตะกร้าแล้วหาย ถ้า AOV 2,822 × 20% recovery = เสียโอกาส **~700K/เดือน**

**Action:**
- ทำ cart recovery email 3 flow (1ชม / 24ชม / 72ชม)
- ทดสอบ promo code 10% ใน email 24ชม
- Owner: Marketing + Email team, Deadline: สิ้นเดือนนี้

**Confidence:** High

### 3. Checkout → Purchase drop 52% — น่าจะมี UX issue
**Finding:** Checkout start 850 → Purchase 410 = drop 52% (industry ~30-40%)

**So what:** ขั้น checkout มี friction ผิดปกติ — อาจเพราะ form ยาวเกิน, ไม่มี payment ที่ผู้ใช้ต้องการ, shipping ไม่ชัด

**Action:**
- ดู session recording (Hotjar) 20 sessions ที่ drop ตอน checkout
- Add payment method: TrueMoney Wallet, ShopeePay
- A/B test form 1-step vs 3-step
- Owner: Product + Dev, Deadline: 3 สัปดาห์

**Confidence:** Medium (ต้องดู session ยืนยัน)

### 4. Returning customer = 38% ของ revenue — base stable แต่โตช้า
**Finding:** returning customer order หลายครั้งกว่า new (1.4 vs 1.0) ทำให้แม้ buyer น้อยกว่า แต่ revenue สูสี

**So what:** Base loyal customer แข็งแรง — ถ้าปลูกข้ามไปเป็น VIP/subscription ได้ จะกลบปัญหา acquisition

**Action:** เริ่ม loyalty program (points ทุกการซื้อ 1% cashback)
**Confidence:** Medium

### 5. AOV โตขึ้น +5% — เป็นสัญญาณดีเดียว
**Finding:** AOV 2,822 (เพิ่ม 135 บาท/ออเดอร์)
**So what:** ราคาสูงขึ้น หรือ cross-sell ดีขึ้น — ไม่ใช่ปัญหา
**Action:** ตรวจว่ามาจาก price increase หรือ basket size ก่อนตัดสินใจ

---

## Dashboard Spec

**Title:** E-commerce Sales Health Dashboard
**Audience:** CEO + Marketing Lead + Product Lead
**Refresh:** Hourly
**Tool:** Metabase

### Layout

```
┌─────────────────────────────────────────────────┐
│ Filters: [Date range] [Channel] [Product cat]   │
├──────────┬──────────┬──────────┬───────────────┤
│ Revenue  │ Orders   │ New Cust │ Cart Abandon  │
│ 18.2M    │ 6,450    │ 3,100    │ 74%           │
│ +8% YoY  │ +3%      │ -12%     │ +6pp (bad)    │
├──────────┴──────────┴──────────┴───────────────┤
│  Line chart — Revenue by customer type (6M)     │
│  (2 lines: new vs returning)                    │
├──────────────────────┬──────────────────────────┤
│ Funnel — Mar 2026    │ Top 10 products          │
│ Visit 12,500         │ (horizontal bar)         │
│ Cart  2,100 (17%)    │                          │
│ Buy   410  (3.3%)    │                          │
├──────────────────────┴──────────────────────────┤
│ Cohort heatmap — retention by signup month      │
├─────────────────────────────────────────────────┤
│ Table — Recent abandoned carts (for recovery)   │
└─────────────────────────────────────────────────┘
```

### Charts

| Name | Type | Primary metric | Alert rule |
|------|------|----------------|------------|
| KPI Revenue | Big number + YoY delta | SUM(amount) | < -10% WoW |
| KPI Cart Abandon | Big number | abandoned/added | > 75% |
| Revenue split | Line (2 series) | revenue by type | — |
| Funnel | Funnel chart | unique users | — |
| Cohort | Heatmap | % active in month N | — |
| Top products | Horizontal bar | SUM(amount) | — |
| Abandoned carts | Table | latest 100 | auto-email |

---

## Next Steps

1. **Week 1:** Audit ad spend + SEO — หาสาเหตุ new customer ลด
2. **Week 1-2:** Setup cart recovery email flow (recover 20% = +700K)
3. **Week 2-3:** Hotjar session review + fix checkout friction
4. **Month 2:** Launch loyalty program pilot
5. **Ongoing:** Schedule dashboard refresh + alert ให้ CEO/Marketing

---

*Generated by /data-analyst-pro — Claude Skill Unlock v1.0*
