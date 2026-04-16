# Doctor Helper

> Research assistant สำหรับบุคลากรการแพทย์ — สรุป guideline / DDx list / drug interaction / clinical pearl

## ⚠️⚠️⚠️ DISCLAIMER สำคัญมาก ⚠️⚠️⚠️

**Skill นี้เป็น เครื่องมือช่วยค้นคว้าและจัดระเบียบข้อมูล สำหรับ บุคลากรทางการแพทย์/เภสัช/พยาบาลที่มีใบประกอบวิชาชีพเท่านั้น**

- ❌ **ห้ามใช้แทนการวินิจฉัยของแพทย์**
- ❌ **ห้ามใช้แทนการรักษา**
- ❌ **ห้ามให้คำแนะนำการแพทย์แก่ผู้ป่วยโดยตรงจาก output ของ skill**
- ❌ **ห้ามใช้สำหรับ self-diagnosis** (ผู้ป่วยใช้เองโดยไม่มีแพทย์)
- ✅ ใช้ได้เพื่อ: สรุปงานวิจัย, เตรียม note, refresh ความรู้ทฤษฎี

**การใช้ผิดวัตถุประสงค์อาจก่อให้เกิดอันตรายต่อชีวิต**

ถ้าคุณไม่ใช่บุคลากรการแพทย์ — **หยุดใช้ทันที** แล้วปรึกษาแพทย์โดยตรง

---

## ⚡ ใช้ยังไง

```
/doctor-helper
```

(Skill จะถาม confirm สถานะบุคลากรก่อนทำงาน)

## 🎯 ทำอะไรได้บ้าง (สำหรับแพทย์/เภสัช/พยาบาล)

- ✅ Research summary (paper + guideline ในรูปแบบ PubMed-style)
- ✅ Differential diagnosis list (**reference only**)
- ✅ Drug interaction check (**reference only**)
- ✅ Clinical pearl (1 เรื่อง concise memorable)
- ✅ Latest guideline summary (ADA, ACC/AHA, GOLD, GINA, etc.)
- ✅ Teaching material สำหรับ med student / intern

## 💡 Use cases ที่เหมาะสม

- แพทย์ประจำบ้าน เตรียม round / conference
- Attending preparing lecture
- Pharmacist เตรียม patient counseling
- Nurse ทบทวนโปรโตคอล
- Med student เรียนรู้ + quick review

## ❌ Use cases ที่ไม่เหมาะสม (ห้ามใช้)

- Self-diagnosis ของตัวเอง/ครอบครัว
- ตัดสินใจ treatment จาก output โดยไม่ verify
- ผู้ป่วยที่ไม่ใช่บุคลากรการแพทย์

## 📦 ไฟล์ใน skill นี้

```
doctor-helper/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md    # T2DM 2025 guideline summary
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — สรุป ADA Standards of Care for Diabetes 2025 (key changes + clinical implications)

## 🔗 Skills ที่ใช้คู่กัน

- `/researcher-pro` — literature review ละเอียดยิ่งกว่า
- `/nutritionist-pro` — สำหรับ counseling ผู้ป่วยเบาหวาน/โรคเรื้อรัง
- `/psychologist-helper` — สำหรับ dual-diagnosis case

---

**⚠️ ผู้ใช้ยอมรับความเสี่ยงและรับผิดชอบต่อการใช้งานของตนเอง**

**ทุก output เป็น REFERENCE เท่านั้น — ไม่ใช่ final clinical decision**
