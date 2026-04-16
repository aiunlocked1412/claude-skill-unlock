# Async Communicator

> AI ช่วยทีม remote/hybrid สื่อสาร doc-first — RFC, Decision Doc, Status Update, async meeting

## ⚡ ใช้ยังไง

```
/async-communicator
```

## 🎯 ทำอะไรได้บ้าง

- ✅ RFC (Request for Comments) — proposal สำหรับ tech/process decision
- ✅ Decision Doc — บันทึกการตัดสินใจ + reversibility
- ✅ Status Update format (TL;DR / Done / Doing / Blocked)
- ✅ Async Meeting Alternative (5 patterns)
- ✅ Async Culture Setup (10 norms)
- ✅ PRD (Product Requirements Doc)
- ✅ Tech Spec / Design Doc template

## 💡 Use cases

- Remote-first startup (Slack + Notion + Loom)
- Hybrid team ที่อยากลด meeting fatigue
- Distributed team ข้าม time zone
- Engineering team ที่ต้อง decision technical
- Product team ที่ต้องการ PRD + tech spec
- Leadership ต้องการ doc-first culture

## 📦 ไฟล์ใน skill นี้

```
async-communicator/
├── SKILL.md                          # ไฟล์หลัก
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula + RFC patterns
│   └── output-template.md            # โครงสร้าง doc
└── examples/
    └── example-output.md             # ตัวอย่าง: RFC PostgreSQL → MongoDB
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — RFC เปลี่ยน database จาก PostgreSQL → MongoDB

## 🎓 Tips

- **TL;DR ก่อน** — เขียน TL;DR เสร็จก่อน body
- **Comment-driven** — share doc → comment → revise → decide
- ใช้คู่กับ `/notion-builder` → workspace สำหรับเก็บ RFC
- ใช้คู่กับ `/meeting-notetaker` → ถ้าต้องประชุมจริง

## 🔗 Skills ที่ใช้คู่กัน

- `/notion-builder` — RFC database + decision log
- `/meeting-notetaker` — เมื่อ async ไม่พอ
- `/project-manager-pro` — RAID log + status report
- `/email-manager` — SLA email response time
