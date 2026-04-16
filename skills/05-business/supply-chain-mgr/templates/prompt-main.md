# Prompt Formula — Supply Chain Manager

## Template คำถาม context

```
ธุรกิจ: <ผลิต / ค้าปลีก / ออนไลน์ / ส่งออก>
จำนวน SKU: <ตัวเลข>
มูลค่า inventory: <บาท>
Turnover ปัจจุบัน: <ครั้ง/ปี>
Supplier: <จำนวน + ในประเทศ/นอก>
Lead time: <วัน — ในประเทศ vs ต่างประเทศ>
Demand pattern: <stable / seasonal / spike>
Cash flow: <stable / tight>
ปัญหาใหญ่: <stock-out / stock-out + dead stock / supplier ไม่ stable>
```

## ABC Analysis Recipe

```
List 100+ SKU พร้อมข้อมูล:
- ราคา/หน่วย
- ปริมาณใช้/ปี
- Annual usage value (price × qty)

จัด:
- Class A: ~10-20% SKU = 70-80% มูลค่า → นับสัปดาห์, EOQ ละเอียด
- Class B: ~30% SKU = 15-25% มูลค่า → นับเดือน
- Class C: ~50-70% SKU = 5-10% มูลค่า → นับ 6 เดือน
```

## EOQ Recipe

```
EOQ = √(2 × D × S / H)
- D = annual demand (units)
- S = ordering cost/order (รวม admin, transport)
- H = holding cost/unit/ปี (20-25% ของ unit cost)

Output:
- EOQ optimal quantity
- จำนวน order/ปี
- Total annual cost (ordering + holding)
- เปรียบเทียบกับ MOQ supplier
```

## Safety Stock Recipe

```
Service level desired: 90% / 95% / 99%
Z-score: 1.28 / 1.65 / 2.33

Safety Stock = Z × σLT × √LT
ROP = (Avg demand × Avg LT) + Safety Stock

แสดง trade-off:
- ↑ Service level → ↑ inventory cost
- 99% vs 95% เพิ่ม inventory ~40%
```

## Demand Forecast Recipe

```
Method 1 — SMA (3-month):
F(t) = (D(t-1) + D(t-2) + D(t-3)) / 3

Method 2 — Exponential Smoothing:
F(t) = α × D(t-1) + (1-α) × F(t-1)
α = 0.2 (smooth) / 0.5 (responsive)

Method 3 — Seasonal:
Forecast = Trend × Seasonal Index
- คำนวณ seasonal index จาก 2-3 ปีย้อนหลัง

Output: forecast 3-12 months + MAPE
```

## Supplier Scorecard Recipe

```
QCDFS framework, weight:
- Quality 30%
- Cost 25%
- Delivery 20%
- Flexibility 15%
- Service 10%

แต่ละ supplier ให้คะแนน 1-5 แต่ละ KPI
→ Weighted total → ranking

Action:
- > 4: Strategic
- 3-4: Approved
- 2-3: Watch list
- < 2: Phase out
```

## 3PL Selection Recipe

```
Volume estimate: X order/เดือน
Avg shipment weight: X kg
Coverage: BKK / Greater BKK / ทั่วประเทศ / ต่างประเทศ
Type: B2C / B2B / refrigerated / hazardous

เปรียบเทียบ 3-5 ค่าย:
- Pricing per shipment
- COD fee + remittance time
- API integration with platform
- Damage/loss rate
- Customer service SLA
```

## Tips

- ทุก calculation มีสมมติฐานชัด
- คำนึง cash flow — inventory คือ cash ค้าง
- Class A ให้เวลา 80% ในการ optimize, Class C minimal effort
- Supplier ≥ 2 ราย/category (อย่า single source)
