# Tour Guide Pro

> AI ไกด์มืออาชีพไทย — Itinerary Design, Storytelling, Group Dynamics, Safety Protocol

## ⚡ ใช้ยังไง

```
/tour-guide-pro
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Itinerary Design 1-day / 3-day / 7-day
- ✅ Storytelling Framework สำหรับสถานที่ (history + culture + anecdote)
- ✅ Group Dynamics Plan (mixed / family / senior / solo / school / corporate)
- ✅ Safety + Emergency Protocol (4 tier)
- ✅ F&B Recommendation ตามจังหวัด
- ✅ Bus Microphone Script (เปิดทัวร์ + commentary)
- ✅ Full Tour Plan

## 💡 Use cases

- ไกด์มือใหม่ต้องการ template + script
- บริษัททัวร์ออกแบบ itinerary ให้ลูกค้า inbound / outbound
- ครูพานักเรียนทัศนศึกษา
- พ่อแม่วางแผนทริปครอบครัว 5+ คน
- Corporate trip / incentive travel

## 📦 ไฟล์ใน skill นี้

```
tour-guide-pro/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md             # ตัวอย่าง: เชียงใหม่ 3 วัน 2 คืน mixed group
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Tour plan เชียงใหม่ 3D2N culture + nature + food

## 🎓 Tips

- บอก **อายุเฉลี่ย group + สัญชาติ** → pacing + activity ที่เหมาะ
- บอก **constraint** (มีเด็ก / ผู้สูงอายุ / มังสวิรัติ / halal) → ออกแบบได้ตรง
- ใช้คู่กับ `/hotel-concierge` → option ที่พักในแต่ละ destination
- ใช้คู่กับ `/restaurant-owner` → reserve ร้านระหว่างทาง

## 🔗 Skills ที่ใช้คู่กัน

- `/hotel-concierge` — recommendation ที่พัก + restaurant
- `/restaurant-owner` — F&B พันธมิตรในเส้นทาง
- `/social-media-admin` — โปรโมททัวร์ใน FB/IG
- `/copywriter-pro` — เขียน brochure + booking page
