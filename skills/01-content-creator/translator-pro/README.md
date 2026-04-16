# Translator Pro

> AI นักแปลที่ **ได้ใจความ + ปรับท้องถิ่น** ไม่ใช่แปลคำต่อคำ รองรับ subtitle, email, เอกสารธุรกิจ

## ⚡ ใช้ยังไง

```
/translator-pro
```

## 🎯 ทำอะไรได้บ้าง

- ✅ แปล Thai ↔ English (ปรับ tone + localization)
- ✅ Subtitle (.srt format พร้อม timing + 42 char/line)
- ✅ Email / จดหมายธุรกิจ (ปรับ register)
- ✅ เอกสารธุรกิจ (contract, proposal, report)
- ✅ Landing page / Website (พร้อม localization notes)
- ✅ Transcreation (tagline, slogan — เขียนใหม่เก็บ intent)
- ✅ Translator notes — อธิบายทางเลือกที่ทำ

## 💡 Use cases

- Agency รับงานแปล
- Startup ทำ localization website
- YouTuber ทำ subtitle EN
- นักเขียนแปลหนังสือ/บทความ
- HR บริษัทข้ามชาติ

## 📦 ไฟล์ใน skill นี้

```
translator-pro/
├── SKILL.md                  # ไฟล์หลัก (Claude อ่าน)
├── README.md                 # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md        # translation recipes + common pitfalls
│   └── output-template.md    # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md     # ตัวอย่างแปล landing page EN→TH
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — แปล landing page SaaS อังกฤษ → ไทย พร้อม localization notes

## 🎓 Tips

- บอก **purpose** ให้ชัด (formal / casual / marketing) → tone แม่น
- ระบุ **target audience** (ประเทศ, อายุ, industry) → localization แม่น
- มีคำศัพท์เฉพาะ → ให้ glossary ตั้งแต่ต้น
- ใช้คู่กับ `/copywriter-pro` สำหรับ transcreation headline

## 🔗 Skills ที่ใช้คู่กัน

- `/copywriter-pro` — transcreation tagline / headline
- `/blogger-pro` — สร้าง version ภาษาเดิมก่อนแปล
- `/youtuber-pro` — script EN แล้วแปลเป็น subtitle
- `/podcaster-pro` — transcript podcast + แปล
