# Prompt Formula — Restaurant Owner

## Template คำถาม context

```
ประเภทร้าน: <ตามสั่ง / คาเฟ่ / fine dining / street / ก๋วยเตี๋ยว>
ขนาด: <ที่นั่ง> ที่ + <ตารางเมตร> ตร.ม.
Location: <ย่าน> + <traffic ลูกค้า>
รายได้/วัน: ฿<ตัวเลข> เฉลี่ย/บิล ฿<ตัวเลข>
ทีม: ครัว <จำนวน> + บริการ <จำนวน>
Pain ใหญ่ที่สุด: <1 ประโยค>
```

## Menu Engineering Prompt

```
จัด menu engineering สำหรับร้าน <ประเภท>:
- List ทุกเมนูพร้อม: ราคา, ต้นทุน, qty/วัน, margin
- จัดเข้า 4 ช่อง: Star / Plowhorse / Puzzle / Dog
- แต่ละช่องมี action concrete:
  * Star → โปรโมท + วาง position
  * Plowhorse → ลด portion / เปลี่ยน supplier
  * Puzzle → rebrand / staff push
  * Dog → ตัด / seasonal
- Top 5 menu ที่ควรลบ + Top 5 menu ที่ควรเพิ่ม
```

## Pricing Strategy Prompt

```
ตั้งราคา menu สำหรับร้าน <ประเภท>:
- สูตร: ราคา = ต้นทุน ÷ Food Cost % เป้าหมาย (28-32%)
- Anchor กับร้านข้างเคียง 3 ร้าน (ราคาเฉลี่ย)
- Psychological pricing (89, 99, 129)
- Bundle/set 10-15% discount เพิ่ม basket
- Output: ตารางราคาใหม่ + เหตุผลแต่ละตัว
```

## Food Cost Audit Prompt

```
Audit food cost ร้าน <ประเภท>:
- Current food cost % vs target 28-32%
- Top 10 ingredient ที่ใช้เยอะ + ราคาขึ้น
- Yield test 3 ingredient หลัก
- Waste log 7 วัน
- 5 action ลด food cost ภายใน 30 วัน
```

## Marketing Playbook Prompt

```
ทำ marketing playbook 30 วัน:
- Walk-in: ป้าย + Google Maps reviews
- LINE OA: 4-6 broadcasts/เดือน
- Delivery: GrabFood / FoodPanda / LineMan setup
- Social: 12 posts + 4 reels/เดือน
- Tactic เร่งยอด: เมนูสัปดาห์, set อาหาร 2 ที่, influencer 5 คน
- Budget allocation 30/40/20/10
```

## Daily Operations SOP Prompt

```
เขียน SOP รายวัน:
- Open (1 ชม. ก่อนเปิด): prep, mise en place, cash drawer, deep clean check
- Service (mid-shift): order flow, cleanliness, cash control
- Close (1 ชม. หลังปิด): inventory count, deep clean, cash reconcile, prep tomorrow
- Weekly: deep clean kitchen, supplier order, payroll
```

## Tips

- **Food cost ต้องเช็คทุกสัปดาห์** ไม่ใช่ทุกเดือน — เห็นปัญหาช้าไป
- **Menu > 30 รายการ** = ครัวพัง, food cost พุ่ง — กล้าตัด
- **Delivery = +35-40% จากหน้าร้าน** หลังหัก commission 30-32%
- **No-show booking** ใช้ deposit หรือ overbook 10-15%
- **Staff training 30 นาที/วัน** ก่อนเปิดร้าน — ลด mistake 50%
