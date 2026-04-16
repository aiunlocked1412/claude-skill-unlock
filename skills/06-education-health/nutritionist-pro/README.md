# Nutritionist Pro

> ผู้ช่วย meal planning สำหรับคนไทย — meal plan + แคลอรี่ + macro + grocery list ครบชุด

## ⚡ ใช้ยังไง

```
/nutritionist-pro
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Meal plan 7 วัน (breakfast / lunch / dinner / snack)
- ✅ คำนวณ TDEE + Macro split (P/C/F)
- ✅ Grocery list แยกตามร้าน
- ✅ Meal prep schedule (prep 1 วัน, กินได้ 5 วัน)
- ✅ Recipe pack เมนูโฮมเมด <400 kcal
- ✅ Swap guide (ของโปรดแคลสูง → ทางเลือกแคลต่ำ)

## 💡 Use cases

- ลดน้ำหนัก (cutting) — 1,200-1,800 kcal
- เพิ่มกล้าม (bulking) — 2,500-3,500 kcal
- ควบคุมน้ำตาล (diabetic-friendly)
- Vegetarian / Vegan / Keto / Low-carb
- Maintenance (รักษาน้ำหนัก)

## 📦 ไฟล์ใน skill นี้

```
nutritionist-pro/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md    # 1,500 kcal/day ลดน้ำหนัก
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — meal plan 1,500 kcal/day 7 วัน สำหรับหญิงไทยอายุ 30 ปี อยากลดน้ำหนัก

## ⚠️ DISCLAIMER

**เครื่องมือนี้ให้คำแนะนำทั่วไป ไม่ใช่คำแนะนำทางการแพทย์**

- ❌ ไม่ใช่การบำบัดโรค
- ❌ ไม่แทนนักโภชนาการที่มีใบประกอบวิชาชีพ

**ผู้ที่ควรปรึกษาแพทย์/นักโภชนาการก่อนใช้:**
- มีโรคประจำตัว (เบาหวาน, ความดัน, โรคไต)
- ตั้งครรภ์ / ให้นมบุตร
- ประวัติ eating disorder
- ผู้สูงอายุ / เด็กต่ำกว่า 18

## 🎓 Tips

- บอก **เพศ/อายุ/น้ำหนัก/ส่วนสูง/activity** → แคลอรี่แม่นขึ้น
- ระบุ **ข้อจำกัด** (แพ้อาหาร, ศาสนา) → meal plan ใช้ได้จริง
- ใช้คู่ `/fitness-trainer-pro` → meal + workout = ผลเร็ว

## 🔗 Skills ที่ใช้คู่กัน

- `/fitness-trainer-pro` — workout plan ประกบ meal plan
- `/coach-pro` — health coaching ติดตามผล
- `/doctor-helper` — (สำหรับบุคลากรการแพทย์) ตรวจ drug-nutrient
