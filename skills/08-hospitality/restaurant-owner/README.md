# Restaurant Owner

> AI ที่ปรึกษาเจ้าของร้านอาหารไทย — Menu Engineering, Food Cost, Pricing, Marketing Playbook

## ⚡ ใช้ยังไง

```
/restaurant-owner
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Menu Engineering (Star / Plowhorse / Puzzle / Dog)
- ✅ Pricing Strategy (food cost % + perceived value)
- ✅ Food Cost Audit (target 28-32%)
- ✅ Labor Cost Plan (target 25-30%)
- ✅ Marketing Playbook (LINE OA, GrabFood, FoodPanda, walk-in)
- ✅ Daily Operations SOP
- ✅ Full Restaurant Plan

## 💡 Use cases

- ร้านใหม่กำลังออกแบบเมนู + ตั้งราคาครั้งแรก
- ร้านเดิมกำไรไม่ขึ้น — audit food cost / labor cost
- ขยายสาขา / เปิดสาขา 2
- ก่อนเริ่มขาย delivery (GrabFood, FoodPanda)
- เจ้าของร้านอยากลด waste + ขึ้นราคาแบบไม่เสียลูกค้า

## 📦 ไฟล์ใน skill นี้

```
restaurant-owner/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md             # ตัวอย่าง: ร้านอาหารตามสั่ง 80 ที่นั่ง
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Menu engineering ร้านอาหารตามสั่ง 80 ที่นั่ง

## 🎓 Tips

- บอก **food cost จริง** + **เมนูขายดี 5 อันดับ** → engineering แม่น
- บอก **ค่าเช่า + เงินเดือน** → audit prime cost ได้ตรง
- ใช้คู่กับ `/customer-service-pro` → CS script รับจอง + complaint
- ใช้คู่กับ `/social-media-admin` → โพสเมนูใหม่ + delivery promo

## 🔗 Skills ที่ใช้คู่กัน

- `/customer-service-pro` — CS script รับ booking + complaint
- `/social-media-admin` — โพส menu ใหม่
- `/business-consultant` — financial forecast เปิดสาขา 2
- `/accountant-pro` — งบ + ภาษี F&B
