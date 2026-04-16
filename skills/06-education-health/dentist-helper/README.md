# Dentist Helper

> Clinical reference assistant สำหรับทันตแพทย์ — dental code, treatment plan template, materia medica, clinical pearl

## ⚠️⚠️⚠️ DISCLAIMER สำคัญมาก ⚠️⚠️⚠️

**Skill นี้เป็น เครื่องมือช่วยค้นคว้าและจัดระเบียบข้อมูล สำหรับ ทันตแพทย์ / dental staff ที่มีใบประกอบวิชาชีพเท่านั้น**

- ❌ **ห้ามใช้แทนการตรวจ/รักษาของทันตแพทย์**
- ❌ **ห้ามใช้แทน clinical judgment**
- ❌ **ห้ามให้คำแนะนำทางทันตกรรมแก่ผู้ป่วยโดยตรงจาก output**
- ❌ **ห้ามใช้สำหรับ self-diagnosis** (ผู้ป่วยใช้เองโดยไม่มีทันตแพทย์)
- ✅ ใช้ได้เพื่อ: code lookup, treatment plan template, materia medica, teaching

**การใช้ผิดวัตถุประสงค์อาจก่อให้เกิดผลแทรกซ้อนต่อสุขภาพ**

ถ้าคุณไม่ใช่บุคลากรทันตกรรม — **หยุดใช้ทันที** แล้วปรึกษาทันตแพทย์โดยตรง

---

## ⚡ ใช้ยังไง

```
/dentist-helper
```

(Skill จะถาม confirm สถานะบุคลากรก่อนทำงาน)

## 🦷 ทำอะไรได้บ้าง (สำหรับทันตแพทย์)

- ✅ Dental code lookup (ICD-10-CM dental, CDT, รหัส สปส.)
- ✅ Treatment planning template (single tooth → full mouth)
- ✅ Materia medica dental (วัสดุ + ยา + dose)
- ✅ Clinical pearl ทันตกรรม
- ✅ Guideline summary (EFP, AAE, ADA, FDI, ทันตแพทยสภา)
- ✅ Charting template (perio, ortho, endo)
- ✅ DDx dental pain (reference only)
- ✅ Teaching material สำหรับ DT student

## 💡 Use cases ที่เหมาะสม

- DDS เตรียม case conference
- ทันตแพทย์เฉพาะทาง refresh guideline ใหม่
- DT student เตรียม clinical exam
- คลินิกทันตกรรมจัด treatment plan template
- อาจารย์ทันตแพทย์เตรียม lecture

## ❌ Use cases ที่ไม่เหมาะสม (ห้ามใช้)

- Self-diagnosis ของตัวเอง/ครอบครัว
- ตัดสินใจรักษาจาก output โดยไม่ verify
- ผู้ป่วยที่ไม่ใช่ทันตแพทย์

## 📦 ไฟล์ใน skill นี้

```
dentist-helper/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md    # Treatment plan deep caries #46
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Treatment plan template สำหรับ deep caries #46 + materia medica composite

## 🔗 Skills ที่ใช้คู่กัน

- `/doctor-helper` — สำหรับ medical comorbidity
- `/pharmacist-helper` — สำหรับ drug interaction
- `/researcher-pro` — สำหรับ literature review

---

**⚠️ ผู้ใช้ยอมรับความเสี่ยงและรับผิดชอบต่อการใช้งานของตนเอง**

**ทุก output เป็น REFERENCE เท่านั้น — ไม่ใช่ final clinical decision**
