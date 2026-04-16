# CRM Strategist

> AI CRM Strategist — RFM segmentation, lifecycle, churn prediction, loyalty program

## ⚡ ใช้ยังไง

```
/crm-strategist
```

## 🎯 ทำอะไรได้บ้าง

- ✅ RFM segmentation (11 standard segment: Champions → Lost)
- ✅ Customer lifecycle map (AARRR — Acquisition → Activation → Retention → Revenue → Referral)
- ✅ Churn prediction model (behavioral signals + score)
- ✅ Win-back campaign 90-day program
- ✅ Loyalty program design (tier + economics)
- ✅ LTV / CAC analysis (cohort + payback)
- ✅ Customer journey orchestration (touchpoint × stage)
- ✅ Full CRM strategy ที่ implement ได้

## 💡 Use cases

- E-commerce DTC ที่อยากเพิ่ม repeat purchase
- SaaS subscription ลด churn เพิ่ม expansion
- Retail multi-store ที่อยากใช้ loyalty
- B2B service ที่ขายซ้ำได้
- Course / membership ที่ต้องการ retention

## 📦 ไฟล์ใน skill นี้

```
crm-strategist/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md               # RFM math + AARRR + churn model
│   └── output-template.md
└── examples/
    └── example-output.md            # D2C skincare 25k customer
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Full CRM strategy สำหรับ D2C skincare brand 25,000 customer, เพิ่ม repeat 28% → 42% ใน 6 เดือน

## 🎓 Tips

- บอก **customer count + AOV + purchase frequency** ครบ → segment + LTV แม่น
- เริ่ม segment ง่ายๆ 4 segment ก่อน (Champion / Active / At-risk / Lost) — แล้ว expand
- Save Champions เป็น priority #1 — 20% ของ customer ทำ 80% ของ revenue
- Win-back ภายใน 90d ของ lapse — หลัง 180d รักษายากมาก
- LTV/CAC ratio > 3:1 = healthy, > 5:1 = under-investing in growth

## 🔗 Skills ที่ใช้คู่กัน

- `/email-marketer` — execution layer ของ CRM
- `/digital-marketer` — acquisition + retargeting
- `/copywriter-pro` — write personalized message
- `/sales-pro` — convert at-risk → save (B2B)
