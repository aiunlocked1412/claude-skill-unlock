# Prompt Main — Data Analyst Pro

## SQL Best Practices

### Structure (CTE-based)
```sql
WITH
  -- 1. ตั้งต้น: กรอง + clean ข้อมูล
  base AS (...),
  -- 2. transform: join, calculate
  transformed AS (...),
  -- 3. aggregate: group by
  aggregated AS (...)
SELECT *
FROM aggregated
ORDER BY ...
LIMIT 100;
```

### Performance Checklist
- [ ] ใช้ index column ใน WHERE/JOIN
- [ ] เลี่ยง function บน indexed column (`WHERE DATE(created_at) = '2026-01-01'` = bad)
- [ ] LIMIT ใน exploration query
- [ ] Filter ตั้งแต่ early CTE (ไม่รอ filter ทีหลัง)
- [ ] EXPLAIN / EXPLAIN ANALYZE ก่อน deploy

### Common Pitfalls
1. **NULL != comparison**
   ```sql
   -- ผิด — จะไม่รวม NULL
   WHERE status != 'cancelled'
   -- ถูก
   WHERE (status != 'cancelled' OR status IS NULL)
   ```

2. **Timezone trap**
   ```sql
   -- timestamp_at มักเป็น UTC
   WHERE created_at >= '2026-01-01 00:00:00+07'  -- ต้องระบุ TZ
   ```

3. **Duplicate join**
   - ถ้า 1 order มี หลาย item → JOIN แล้ว SUM จะซ้ำ
   - แก้: aggregate ก่อน join

4. **COUNT vs COUNT DISTINCT**
   ```sql
   COUNT(user_id)           -- นับทุกแถว (อาจซ้ำ)
   COUNT(DISTINCT user_id)  -- นับคน unique
   ```

## Insight Framework

### รูปแบบ Finding
```
Finding: <ตัวเลขที่เห็น — ใช้เลขเปรียบเทียบ เช่น "+35% vs เดือนก่อน">
So what: <แปลความหมายเชิงธุรกิจ>
Action: <ทำอะไรต่อ — ต้อง concrete + owner + timeline>
```

### ตัวอย่าง
```
Finding: Cart abandonment rate = 72% (industry avg 68%)
So what: มีผู้ใช้ 72 ใน 100 คนที่ใส่ของในตะกร้าแล้วไม่จ่าย — เสียโอกาส 2.4M/เดือน
Action: ทำ cart recovery email flow 3 ข้อความ (1 ชม / 24 ชม / 72 ชม หลัง abandon)
        Owner: Marketing, Deadline: สิ้นเดือนนี้
```

### ประเภท Insight

| ประเภท | คำถามที่ตอบ | ตัวอย่าง |
|--------|-------------|----------|
| Trend | เพิ่ม/ลด? | revenue เติบโต 15% MoM |
| Segment | ใครเด่น? | user อายุ 25-34 = 60% revenue |
| Funnel | ใครหาย? | 80% drop ที่ checkout |
| Cohort | คนเก่า vs ใหม่? | cohort Q1 retention 45% > Q2 35% |
| Outlier | อะไรผิดปกติ? | 3 วันที่ order ≥ 10x ค่าเฉลี่ย |

## Chart Selection Guide

| คำถามธุรกิจ | Chart type | ตัวอย่าง |
|-------------|-----------|----------|
| เปลี่ยนตามเวลา? | Line | Revenue 30 วัน |
| เปรียบเทียบ category | Bar (horizontal ถ้า label ยาว) | Top 10 products |
| สัดส่วน (<6 ประเภท) | Donut | Revenue by channel |
| Distribution | Histogram | Order value bucket |
| Relationship | Scatter | Ad spend vs Revenue |
| Drop-off | Funnel | Visit → Cart → Checkout |
| Retention | Cohort heatmap | Monthly cohort retention |
| Multi-metric | Dashboard (combo) | KPI cards + trend |

## Dashboard Design Principles

1. **5-second test** — ผู้ใช้เข้าใจ KPI หลักใน 5 วิ
2. **Z-pattern layout** — คนอ่านจากซ้ายบน → ขวาบน → ซ้ายล่าง → ขวาล่าง
3. **KPI cards อยู่บนสุด** (4 ตัวหลัก ไม่เกิน)
4. **Trend chart ใหญ่ที่สุด** — ข้อมูลที่เปลี่ยนตามเวลา
5. **Filter อยู่ด้านบน** — date range, segment
6. **Drill-down** — click chart → ไปหน้า detail
7. **Color** — แดง = ลด/แย่, เขียว = เพิ่ม/ดี, น้ำเงิน = neutral
