# Pharmacist Helper

> Clinical reference assistant สำหรับเภสัชกร — drug dictionary, interaction matrix, dosing, counseling, ADR

## ⚠️⚠️⚠️ DISCLAIMER สำคัญมาก ⚠️⚠️⚠️

**Skill นี้สำหรับ เภสัชกร / medical staff ที่มีใบประกอบวิชาชีพเท่านั้น**

- ❌ **ห้ามใช้แทนการประเมินของเภสัชกร**
- ❌ **ห้ามใช้แทนคำสั่งแพทย์**
- ❌ **ห้ามให้คำแนะนำการใช้ยาแก่ผู้ป่วยโดยตรงจาก output**
- ❌ **ห้ามใช้สำหรับ self-medication**
- ✅ ใช้ได้เพื่อ: drug lookup, interaction check, dose calc, counseling template, refresh ทฤษฎี

**การใช้ผิดวัตถุประสงค์อาจก่อให้เกิด medication error และอันตรายต่อชีวิต**

ถ้าคุณไม่ใช่บุคลากรการแพทย์ — **หยุดใช้ทันที** แล้วปรึกษาเภสัชกรหรือแพทย์โดยตรง

---

## ⚡ ใช้ยังไง

```
/pharmacist-helper
```

(Skill จะถาม confirm สถานะบุคลากรก่อน)

## 💊 ทำอะไรได้บ้าง (สำหรับเภสัชกร)

- ✅ Drug dictionary lookup (Thai/Generic/Trade name)
- ✅ Drug interaction matrix (2-10 ยา พร้อมกัน)
- ✅ Dose calculator: pediatric / renal / hepatic / geriatric
- ✅ Counseling script template (พร้อม teach-back)
- ✅ ADR reference + Naranjo causality
- ✅ TDM (vancomycin, phenytoin, digoxin, etc.)
- ✅ Herbal-drug interaction (Thai herbs)
- ✅ IV reconstitution / compatibility
- ✅ DUE / MTM framework
- ✅ Teaching material สำหรับ Pharm.D. student

## 💡 จุดเด่น

- **Thai context** — บัญชียาหลัก, ราคา NLEM, ขึ้นทะเบียน อย.
- **Thai herbs** — ฟ้าทะลายโจร, กระชายดำ + interaction กับ western drugs
- **Multi-source** — Lexicomp, Micromedex, BNF, Stockley's
- **Verify reminder** — เตือนเช็คกับ primary source ทุก output

## 👥 เหมาะกับใคร

- เภสัชกรชุมชน (ร้านยา)
- เภสัชกรโรงพยาบาล / clinical pharmacist
- เภสัชกรอุตสาหกรรม / regulatory
- Pharm.D. student / intern (supervised)
- แพทย์ / พยาบาล ที่ต้องการ verify drug info

## ❌ Use cases ที่ไม่เหมาะสม

- Self-medication ของตัวเอง/ครอบครัว
- ตัดสินใจจ่ายยาควบคุมพิเศษโดยไม่ verify
- ผู้ใช้ทั่วไปที่ไม่ใช่ medical staff

## 📦 ไฟล์ใน skill นี้

```
pharmacist-helper/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md    # warfarin + amiodarone + omeprazole interaction + counseling
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Drug interaction matrix 3 ยา + counseling script for warfarin patient

## 🔗 Skills ที่ใช้คู่กัน

- `/doctor-helper` — สำหรับ medical decision support
- `/dentist-helper` — สำหรับ premedication
- `/researcher-pro` — สำหรับ pharmacology literature

---

**⚠️ ผู้ใช้ยอมรับความเสี่ยงและรับผิดชอบต่อการใช้งานของตนเอง**

**ทุก output เป็น REFERENCE เท่านั้น — ไม่ใช่ final clinical decision**
