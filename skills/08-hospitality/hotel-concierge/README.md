# Hotel Concierge

> AI Concierge โรงแรมไทย — Recommendation, Itinerary, Request Handling, Complaint Resolution

## ⚡ ใช้ยังไง

```
/hotel-concierge
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Recommendation Matrix (food, attraction, shopping, transport, wellness)
- ✅ Itinerary 1-7 คืน ตาม guest profile
- ✅ Request Handling (taxi, restaurant booking, ตั๋ว, doctor)
- ✅ Guest Journey Script (pre-arrival → check-out → post-stay)
- ✅ Complaint Resolution 3 ระดับ
- ✅ Reply Template (email, in-app, WhatsApp)
- ✅ Full Concierge Playbook

## 💡 Use cases

- โรงแรม 3-5 ดาวอยากยกระดับ concierge service
- Boutique hotel เปิดใหม่ ต้องการ playbook
- Front desk รับ request แขกต่างชาติแล้วไม่รู้จะแนะอะไร
- Manager ทำ training script ให้ทีม
- Resort handle complaint แขก VIP

## 📦 ไฟล์ใน skill นี้

```
hotel-concierge/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md             # ตัวอย่าง: 4-star กรุงเทพ + แขกต่างชาติ 3 คืน
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Recommendation 3 คืน guest ฝรั่งเศส

## 🎓 Tips

- บอก **profile guest ละเอียด** (สัญชาติ, อายุ, interest) → recommendation ตรง
- บอก **budget per meal + per activity** → option ที่เลือกได้จริง
- ใช้คู่กับ `/customer-service-pro` → reply template สำหรับ in-app chat
- ใช้คู่กับ `/tour-guide-pro` → custom day-tour สำหรับแขก VIP

## 🔗 Skills ที่ใช้คู่กัน

- `/tour-guide-pro` — day tour + storytelling
- `/customer-service-pro` — chat / email reply
- `/restaurant-owner` — แนะนำ in-house restaurant menu
- `/business-consultant` — analyze guest segment + revenue
