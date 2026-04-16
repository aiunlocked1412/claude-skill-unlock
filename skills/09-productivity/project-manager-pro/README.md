# Project Manager Pro

> AI PM ครบเครื่อง — Charter, WBS, Gantt, Sprint, Retrospective, RAID log, Stakeholder Comm

## ⚡ ใช้ยังไง

```
/project-manager-pro
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Project Charter (goal, scope, sponsor, success criteria)
- ✅ WBS — Work Breakdown Structure 3-4 ระดับ
- ✅ Gantt timeline + Critical Path
- ✅ Sprint plan + Daily standup template
- ✅ Retrospective Mad/Sad/Glad
- ✅ RAID log (Risk, Assumption, Issue, Decision)
- ✅ Stakeholder Communication Plan (Power × Interest)
- ✅ Weekly status report (1-page)

## 💡 Use cases

- เปิดร้าน/สาขาใหม่
- Migrate system / database / ERP
- Launch product / campaign
- Construction / renovation
- Event management (wedding, conference)
- Software development project (SaaS, app)

## 📦 ไฟล์ใน skill นี้

```
project-manager-pro/
├── SKILL.md                          # ไฟล์หลัก
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula + WBS recipes
│   └── output-template.md            # โครงสร้าง project plan
└── examples/
    └── example-output.md             # ตัวอย่าง: เปิดร้านอาหาร 6 เดือน
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — full project plan เปิดร้านอาหาร omakase 6 เดือน งบ 5 ลบ.

## 🎓 Tips

- **Critical Path** = focus point — task บน path delay = project delay
- ใส่ **buffer** ที่ project level (15-25%) ไม่ใส่ที่แต่ละ task
- ใช้คู่กับ `/meeting-notetaker` → action items push เข้า sprint
- ใช้คู่กับ `/notion-builder` → Project + Task + RAID database

## 🔗 Skills ที่ใช้คู่กัน

- `/meeting-notetaker` — สรุป kickoff + sprint planning
- `/notion-builder` — workspace สำหรับ project tracking
- `/business-consultant` — strategic context
- `/async-communicator` — RFC สำหรับ key decision
