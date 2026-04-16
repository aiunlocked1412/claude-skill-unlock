# Pet Care

> AI ที่ปรึกษาเลี้ยงสัตว์เลี้ยง — หมา แมว exotic — nutrition, training, health, grooming, travel ในบริบทไทย

## ⚡ ใช้ยังไง

```
/pet-care
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Nutrition Plan คำนวณแคลอรี่ + แนะนำอาหารตาม breed/อายุ/น้ำหนัก
- ✅ Training Guide positive reinforcement — basic commands, house training, แก้พฤติกรรม
- ✅ Health Checklist วัคซีน, heartworm, ตรวจเลือดประจำปี
- ✅ Grooming Routine ตามประเภทขน — หวี, อาบน้ำ, เล็บ, ฟัน, หู
- ✅ Pet Travel เอกสาร, carrier, acclimatize สำหรับเดินทางในไทยและต่างประเทศ
- ✅ Thai Climate Care รับมือความร้อน/ชื้น โรคตามฤดู เห็บหมัด heartworm

## 💡 Use cases

- เจ้าของมือใหม่อยากรู้ว่าต้องเตรียมอะไรก่อนรับสัตว์
- คุณพ่อคุณแม่หมา/แมวอยากปรับอาหารให้เหมาะกับอายุ
- มีปัญหาพฤติกรรมสัตว์ (กัด, เห่า, ไม่ยอมใช้กระบะทราย)
- วางแผนเดินทางพร้อมสัตว์เลี้ยง
- ตรวจสอบ wellness checklist ก่อนพา vet ประจำปี

## 📦 ไฟล์ใน skill นี้

```
pet-care/
├── SKILL.md     # ไฟล์หลัก (Claude อ่าน)
└── README.md    # คุณกำลังอ่านอยู่
```

## ⚠️ ข้อสำคัญ

skill นี้ให้ข้อมูลทั่วไปเพื่อการศึกษา **ไม่ใช่ veterinary advice** — สำหรับปัญหาสุขภาพ อาการป่วย หรือการใช้ยา ต้องปรึกษาสัตวแพทย์ที่มีใบอนุญาตเสมอ

## 🎓 Tips

- บอก **breed + อายุ + น้ำหนัก** ให้ครบ → ได้ nutrition plan ที่แม่นยำ
- บอก **living situation** (คอนโด/บ้าน) → ได้ exercise + enrichment plan ที่เหมาะ
- ใช้คู่กับ `/health-tracker` → ติดตาม weight + symptom log รายเดือน

## 🔗 Skills ที่ใช้คู่กัน

- `/home-manager` — จัดพื้นที่บ้านให้ปลอดภัยสำหรับสัตว์เลี้ยง
- `/travel-planner` — วางแผนเดินทางพร้อม pet-friendly accommodations
