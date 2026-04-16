# หมวด 6: Education & Health (15 skills)

Skills สำหรับครู, ติวเตอร์, ครูภาษา, โค้ช, trainer, นักโภชนาการ, หมอ, ทันตแพทย์, เภสัชกร, สัตวแพทย์, นักจิตวิทยา, นักวิจัย, ครูโยคะ, โค้ชสมาธิ และ wellness

## 📚 Education

| Skill | คำสั่ง | ใช้เมื่อไหร่ |
|-------|--------|-------------|
| Teacher | `/teacher-pro` | แผนการสอน, แบบฝึกหัด (ห้องเรียน) |
| Tutor 🆕 | `/tutor-pro` | ติว 1-on-1, diagnostic, adaptive exercise |
| Language Teacher 🆕 | `/language-teacher` | English/Chinese/Japanese/Korean (CEFR) |
| Coach | `/coach-pro` | life coaching, session plan |
| Researcher | `/researcher-pro` | lit review, methodology |

## 💪 Health & Fitness

| Skill | คำสั่ง | ใช้เมื่อไหร่ |
|-------|--------|-------------|
| Nutritionist | `/nutritionist-pro` | meal plan, แคลอรี่ |
| Fitness Trainer | `/fitness-trainer-pro` | workout, ท่าฝึก |
| Yoga Instructor 🆕 | `/yoga-instructor` | sequence, asana, pranayama |
| Meditation Coach 🆕 | `/meditation-coach` | guided meditation, breathing |
| Mental Wellness 🆕 | `/mental-wellness` | journaling, CBT self-help |

## 🩺 Professional Medical (⚠️ ใบประกอบวิชาชีพเท่านั้น)

| Skill | คำสั่ง | สำหรับใคร |
|-------|--------|-----------|
| Doctor Helper ⚠️ | `/doctor-helper` | แพทย์, พยาบาล |
| Dentist Helper 🆕 ⚠️ | `/dentist-helper` | ทันตแพทย์ |
| Pharmacist Helper 🆕 ⚠️ | `/pharmacist-helper` | เภสัชกร |
| Veterinarian Helper 🆕 ⚠️ | `/veterinarian-helper` | สัตวแพทย์ |
| Psychologist Helper ⚠️ | `/psychologist-helper` | นักจิตวิทยา, จิตแพทย์ |

## ⚠️ Disclaimer สำคัญ

### Professional Helpers (5 skills)
**`/doctor-helper`, `/dentist-helper`, `/pharmacist-helper`, `/veterinarian-helper`, `/psychologist-helper`** เป็นผู้ช่วย **ค้นคว้าข้อมูล + จัดระเบียบ** เท่านั้น:
- ❌ ห้ามใช้แทนการวินิจฉัย / รักษา
- ❌ ห้ามใช้ให้คำแนะนำกับผู้ป่วย/เจ้าของสัตว์โดยตรง
- ❌ ห้ามใช้สำหรับ self-diagnosis / self-medication
- ✅ ใช้สรุปงานวิจัย, treatment plan template, refresh ความรู้, teaching

**สำหรับบุคลากรที่มีใบประกอบวิชาชีพเท่านั้น**

### Wellness Skills (yoga / meditation / mental-wellness)
- ⚠️ ปรึกษาแพทย์ก่อน ถ้า: ตั้งครรภ์, มีโรคประจำตัว, มีปัญหาสุขภาพจิต
- ⚠️ `/mental-wellness` **ไม่ใช่ therapy** — ถ้าจริงจังให้พบนักจิตวิทยา
- 🆘 ถ้ามีคิดทำร้ายตัวเอง: **โทร 1323** (สุขภาพจิต ฟรี 24 ชม.)

**การใช้ผิดวัตถุประสงค์อาจก่อให้เกิดความเสียหายต่อชีวิตและสุขภาพ**

## รูปแบบ output ทั่วไป

- Lesson plan / Curriculum / Program (รายคาบ/สัปดาห์/เดือน)
- Diagnostic + Adaptive worksheet
- Reference template (treatment plan, drug lookup, dose calc)
- Guided script (meditation, yoga sequence)
- Worksheet (CBT, gratitude, values clarification)
- Research summary + citation

## Workflow ตัวอย่าง

### สำหรับครู / ติวเตอร์
```
1. /tutor-pro diagnostic test
   ↓
2. /tutor-pro แผนติวรายบุคคล
   ↓
3. /language-teacher (ถ้าวิชาภาษา)
   ↓
4. /teacher-pro lesson plan ห้องเรียน
```

### สำหรับ Healthcare Professional
```
1. /researcher-pro lit review
   ↓
2. /doctor-helper / /dentist-helper / /pharmacist-helper
   ↓
3. /psychologist-helper (ถ้ามี comorbid mental health)
   ↓
4. /pharmacist-helper drug interaction check
```

### สำหรับ Wellness Coach
```
1. /yoga-instructor 60-min class
   ↓
2. /meditation-coach 10-min closing meditation
   ↓
3. /mental-wellness journaling + reframing
   ↓
4. /coach-pro overall life coaching
```
