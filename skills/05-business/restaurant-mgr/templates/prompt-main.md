# Prompt Formula — Restaurant Manager

## Template คำถาม context

```
ประเภทร้าน: <Casual / Fine / Cafe / Fast food / Street>
รูปแบบ: <Dine-in / Delivery / Mixed>
ที่นั่ง: <จำนวน>
Turn/วัน: <ครั้ง>
Avg check: <บาท/ลูกค้า>
รายได้/เดือน: <บาท>
ค่าเช่า/เดือน: <บาท>
จำนวนพนักงาน: <คน — ครัว/บริการ>
Food cost %: <%>
Labor cost %: <%>
ปัญหาหลัก: <margin / FC / labor / delivery cost>
```

## Food Cost Recipe

```
สำหรับ dish <name>:
1. List ingredients + qty
2. หา cost per unit (yield-adjusted)
3. Add 5% spice/condiment
4. Add plating cost
= Total cost per dish
÷ Selling price
= Dish FC %

Target FC by category:
- Star items: 25-30%
- Average: 28-32%
- Promo: up to 40%
```

## Menu Engineering Recipe

```
List menu items + ข้อมูล 30 วัน:
- Quantity sold
- Price
- Cost
- Margin = Price - Cost

จัดกลุ่ม:
- Popularity: above/below avg
- Profitability: above/below avg

= Star / Plowhorse / Puzzle / Dog

Action per category:
- Star: maintain, promote
- Plowhorse: reprice หรือ reduce cost
- Puzzle: reposition + train server upsell
- Dog: remove
```

## Labor Cost Recipe

```
LC % = wages / sales × 100

Productivity:
- Sales per labor hour = sales / total hours
- Target: > 500 บาท/ชม.

Schedule:
- Off-peak: skeleton
- Peak: full team
- Cross-training (ครัว ↔ บริการ)
```

## P&L Recipe

```
Revenue 100%
- FC 28-32%
- LC 25-30%
= Prime cost ≤ 60%

- Rent ≤ 10%
- Utilities 4-6%
- Marketing 3-5%
- Other 5-7%

= EBITDA 15-20% (good)
```

## ROI Branch Recipe

```
Investment:
- Lease + renovation
- Equipment
- Working capital (3 เดือน)
- Permit

Monthly contribution:
- Revenue forecast
- - COGS
- - Labor
- - Rent
- - Other OpEx
= Monthly net

Payback = Investment / Monthly net (เดือน)
Target ≤ 24 เดือน
```

## Delivery Recipe

```
Compare platforms:
- Commission %
- User base
- Promo support
- Cash flow (T+X days)

Strategy:
- เพิ่มราคา delivery menu 10-15%
- Push own channel (Line OA) ส่วนลด 10%
- Track per-platform margin
```

## Tips

- Prime cost (FC+LC) คือ KPI สำคัญที่สุด
- ค่าเช่าเป็น killer ถ้า > 12%
- Cash flow > P&L profit (delivery รับเงินช้า)
- Recipe costing ทุกเดือน (ราคาวัตถุดิบขึ้น)
