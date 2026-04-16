# Salon Owner

> AI ที่ปรึกษาเจ้าของร้านเสริมสวยไทย — Service Menu, Pricing Tiers, Booking, Retention, Upsell

## ⚡ ใช้ยังไง

```
/salon-owner
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Service Menu Design (Core + Signature + Add-on + Package + Membership)
- ✅ Pricing Tiers (Basic / Premium / VIP)
- ✅ Booking System (LINE OA + Google Calendar + reminder)
- ✅ Retention Plan (lifecycle 30/90/120 วัน + win-back)
- ✅ Upsell Script ที่ขายได้จริง (เห็น → แนะ → ขาย)
- ✅ Stylist Commission Structure
- ✅ Full Salon Playbook

## 💡 Use cases

- เปิดร้านใหม่กำลังออกแบบ menu + ราคา
- ร้านเดิม retention ต่ำ ลูกค้าไม่กลับ
- ช่างลาออก ลูกค้าตามไป — แก้ระบบ binding
- อยากเพิ่ม upsell แต่กลัว push ลูกค้า
- ขยายจาก 3 ช่าง → 8 ช่าง

## 📦 ไฟล์ใน skill นี้

```
salon-owner/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md             # ตัวอย่าง: ร้านทำผมย่านสยาม
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Service menu + pricing + retention plan ร้านทำผม

## 🎓 Tips

- บอก **ราคาเฉลี่ย + bookings/วัน** → pricing tier ตรงตลาด
- บอก **% retention 30 วัน** → focus action ที่ใช่
- ใช้คู่กับ `/customer-service-pro` → LINE OA chatbot รับจอง
- ใช้คู่กับ `/social-media-admin` → before/after content + IG reel

## 🔗 Skills ที่ใช้คู่กัน

- `/customer-service-pro` — LINE OA flow + reminder
- `/social-media-admin` — IG content + UGC
- `/business-consultant` — ขยายสาขา + financial forecast
- `/copywriter-pro` — promo copy + LINE broadcast
