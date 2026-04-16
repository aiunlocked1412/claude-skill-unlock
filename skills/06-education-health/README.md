# หมวด 6: Education & Health (7 skills)

Skills สำหรับครู, โค้ช, trainer, นักโภชนาการ, หมอ, นักจิตวิทยา, นักวิจัย

| Skill | คำสั่ง | ใช้เมื่อไหร่ |
|-------|--------|-------------|
| Teacher | `/teacher-pro` | แผนการสอน, แบบฝึกหัด |
| Coach | `/coach-pro` | โปรแกรม, session plan |
| Nutritionist | `/nutritionist-pro` | meal plan, แคลอรี่ |
| Fitness Trainer | `/fitness-trainer-pro` | workout, ท่าฝึก |
| Doctor Helper ⚠️ | `/doctor-helper` | research, differential |
| Psychologist Helper ⚠️ | `/psychologist-helper` | session notes, CBT |
| Researcher | `/researcher-pro` | lit review, methodology |

## รูปแบบ output ทั่วไป

- Lesson plan / Program (สัปดาห์/เดือน)
- Template form (intake, assessment)
- Research summary + citation
- Progress tracker (excel-like)

## ⚠️ Disclaimer สำคัญ

**`/doctor-helper` และ `/psychologist-helper`** เป็นผู้ช่วย **ค้นคว้าข้อมูล** เท่านั้น:
- ❌ ห้ามใช้แทนการวินิจฉัยโรค
- ❌ ห้ามใช้แทนการรักษา
- ❌ ห้ามใช้ให้คำแนะนำทางการแพทย์กับผู้ป่วยโดยตรง
- ✅ ใช้สรุปงานวิจัย, เตรียม note, refresh ความรู้ได้

**การใช้ที่ผิดวัตถุประสงค์อาจก่อให้เกิดความเสียหายต่อชีวิตและสุขภาพของผู้อื่น**

## Workflow ตัวอย่าง

```
1. /researcher-pro lit review หัวข้อใหม่
   ↓
2. /teacher-pro แผนการสอน 12 สัปดาห์
   ↓
3. /coach-pro โปรแกรม coaching ลูกค้า
   ↓
4. /nutritionist-pro meal plan ประกอบ
   ↓
5. /fitness-trainer-pro workout เสริม
```
