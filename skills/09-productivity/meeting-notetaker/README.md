# Meeting Note-taker

> AI ช่วยจดประชุม + สรุป decision + จ่าย action item ให้ถูกคน + ส่ง follow-up email

## ⚡ ใช้ยังไง

```
/meeting-notetaker
```

## 🎯 ทำอะไรได้บ้าง

- ✅ สรุปประชุมเต็ม (Header, Agenda, Decision, Action, Parking Lot)
- ✅ Action items: 1 owner + 1 due date + definition of done
- ✅ Decision log พร้อมเหตุผล + reversibility
- ✅ Follow-up email หลังประชุม (24 ชม.)
- ✅ Pre-meeting agenda
- ✅ Recurring templates (Standup / 1:1 / Retrospective Mad-Sad-Glad)

## 💡 Use cases

- Project kickoff meeting / weekly sync / steering committee
- Sprint planning + retrospective ทีม dev
- 1:1 ระหว่างหัวหน้า-ลูกน้อง
- Vendor meeting / client call
- Board meeting / leadership sync

## 📦 ไฟล์ใน skill นี้

```
meeting-notetaker/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างสรุป
└── examples/
    └── example-output.md             # ตัวอย่าง: kickoff app delivery
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — สรุป kickoff meeting แอปส่งอาหารยาว 1 ชั่วโมง

## 🎓 Tips

- วาง **transcript ดิบ** ลงไปได้เลย (ไม่ต้องจัด format)
- บอก **role** ของแต่ละคน → action item จ่ายถูกคน
- ใช้คู่กับ `/email-manager` → ส่ง follow-up อัตโนมัติ
- ใช้คู่กับ `/project-manager-pro` → push action เข้า project tracker

## 🔗 Skills ที่ใช้คู่กัน

- `/email-manager` — ส่ง follow-up + reminder
- `/project-manager-pro` — ติดตาม action item เข้า sprint
- `/notion-builder` — สร้าง meeting database
- `/async-communicator` — แทนประชุมด้วย doc
