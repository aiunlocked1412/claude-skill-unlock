# Prompt Patterns สำหรับ Tutor Pro

## 1. Pattern: Diagnostic Test

```
สร้าง diagnostic test 15-20 ข้อ สำหรับ:
- วิชา: <...>
- ระดับ: <...>
- เป้าหมาย: <สอบอะไร>

โครงสร้าง 4 sections:
- A (5 ข้อ): Foundation — ความรู้พื้นฐาน (Bloom's Remember/Understand)
- B (5-7 ข้อ): Application — นำไปใช้ (Bloom's Apply)
- C (5-6 ข้อ): Advanced — โจทย์สอบจริง (Bloom's Analyze)
- D (2 ข้อ): Synthesis — ระดับสูง (Bloom's Evaluate/Create)

แต่ละข้อระบุ:
- หัวข้อย่อย (sub-topic tag)
- คะแนน
- ระดับยาก 1-5

หลังเด็กทำเสร็จ → สร้าง analysis matrix:
| หัวข้อย่อย | คะแนนเต็ม | ได้ | % | จุดอ่อน? | ลำดับติว |
```

## 2. Pattern: VARK Learning Style Quiz

```
ถามนักเรียน 8 คำถาม VARK เพื่อระบุ learning style:

1. ถ้าจะเรียนทำกับข้าวใหม่ คุณชอบ:
   V) ดูคลิป YouTube
   A) ฟัง podcast / คนสอน
   R) อ่านสูตร
   K) ลองทำเลย ผิดแล้วแก้

(สร้างอีก 7 ข้อในแนวเดียวกัน)

หลังตอบครบ → คำนวณ + แนะนำ:
- Style หลัก (มากสุด)
- Style รอง
- กลยุทธ์ติวที่เหมาะ
- Tools / สื่อที่แนะนำ
```

## 3. Pattern: Personalized Study Plan

```
สร้างแผนติวรายบุคคล จาก diagnostic result:

INPUT:
- จุดอ่อน (จาก diagnostic): [...]
- จุดแข็ง: [...]
- Learning style: [...]
- เวลาที่มี: [N] สัปดาห์ × [M] ชม./สัปดาห์
- เป้าหมาย: [คะแนน X / ผ่านสอบ Y]

OUTPUT:
- Week-by-week plan
- แต่ละ week ระบุ:
  * Topic
  * Activities (ตาม learning style)
  * Mastery threshold (ต้องได้ % เท่าไรก่อนไปต่อ)
  * Backup plan ถ้าไม่ผ่าน
- Milestone checks (สัปดาห์ที่ 4, 8, จบ)
- Mock exam schedule
```

## 4. Pattern: Adaptive Worksheet

```
สร้างแบบฝึก adaptive — 5-8 ข้อ/set

Logic:
- เริ่มที่ระดับยากที่นักเรียนอยู่
- ถ้าทำถูก 80%+ → set ถัดไป +1 ระดับ
- ถ้า 50-79% → set ถัดไป ระดับเดิม + เพิ่มจำนวน
- ถ้า < 50% → set ถัดไป -1 ระดับ + อธิบาย concept ใหม่

แต่ละข้อ + เฉลย:
- คำตอบ
- วิธีคิด step-by-step
- เหตุผลทำไมเป็นอย่างนั้น (ไม่ใช่แค่สูตร)
- Common mistake (ที่นักเรียนมักทำผิด)
- โจทย์คล้ายๆ ให้ฝึกเพิ่ม (link)
```

## 5. Pattern: Spaced Repetition Schedule

```
สร้างตาราง spaced repetition แบบ Anki:

INPUT: list หัวข้อ/concept ที่ต้องจำ

OUTPUT (calendar 30 วัน):
| วัน | หัวข้อใหม่ | หัวข้อทบทวน | จำนวน |
|-----|-----------|-------------|-------|
| 1 | A, B | - | 2 |
| 2 | C | A, B | 3 |
| 3 | D | - | 1 |
| 4 | E | A, B | 3 |
| 5 | F | C | 2 |
| 8 | G | A, B, C | 4 |
| 16 | H | A-D | 5 |
| 30 | - | All | 8+ |

(spacing: 1, 2, 4, 8, 16, 30)
```

## 6. Pattern: Mock Exam Analysis

```
หลังนักเรียนทำ mock exam → วิเคราะห์:

1. คะแนนรวม + เทียบเป้า
2. คะแนนแยกหัวข้อ — bar chart text
3. เวลาที่ใช้แต่ละ section (เร็ว/พอดี/ช้า)
4. ข้อที่ผิด — แยกประเภท:
   - ผิดเพราะไม่รู้ (gap ใน knowledge)
   - ผิดเพราะเข้าใจผิด (misconception)
   - ผิดเพราะคำนวณผิด (careless)
   - ผิดเพราะอ่านโจทย์ไม่ดี (reading)
5. Top 3 priority สำหรับ 7 วันต่อไป
6. แผน revise ก่อนสอบจริง
```

## 7. Pattern: Tutoring Session Script (1 hr)

```
สร้าง script สำหรับติว 60 นาที — pace ละเอียด

นาที 0-5: Check-in (สบายดีไหม? ติดอะไร? อารมณ์?)
นาที 5-10: ทบทวนสัปดาห์ก่อน (3 ข้อ — ดู mastery)
นาที 10-25: New concept — อธิบาย + ตัวอย่าง 2-3 อัน
นาที 25-40: ลงมือทำ (เด็กทำ ครูดู — ไม่ช่วยทันที)
นาที 40-50: แก้ + อธิบาย misconception
นาที 50-55: สรุป + key takeaway 3 ข้อ
นาที 55-60: การบ้าน + นัดครั้งต่อไป

ทุกขั้นมี:
- คำพูดครู (script จริง)
- คำถามที่ครูจะถาม
- คำตอบที่นักเรียนน่าจะตอบ (เพื่อเตรียม)
- Plan B ถ้านักเรียนไม่ตอบ
```
