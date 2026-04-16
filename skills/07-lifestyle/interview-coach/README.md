# Interview Coach — โค้ชเตรียมสัมภาษณ์งาน

เตรียมสัมภาษณ์งานแบบ Pro ตั้งแต่ "เล่าเรื่องตัวเอง" ถึง salary negotiation

## Features
- Tell Me About Yourself (60-90 วิ — สูตร P-P-F)
- Behavioral Q&A (50 คำถาม STAR-based)
- Case Study / Technical Interview
- Salary Negotiation (Base + Bonus + Stock + Benefits)
- 10 คำถามเทพถามกลับ
- Mock Interview (ซ้อมจริง + feedback)
- Pre-Interview Research framework
- Thank-You Email + Post-interview reflection

## Frameworks
- **STAR:** Situation, Task, Action, Result
- **P-P-F:** Past, Present, Future
- **BATNA:** Best Alternative To Negotiated Agreement (salary)
- **Anchoring:** ตั้ง stretch number ก่อน

## บริบทไทย vs อินเตอร์
- **บริษัทไทย:** เคารพ, ใช้ครับ/ค่ะ, ไม่ assertive เกิน
- **MNCs:** ตรงประเด็น, มี opinion, push back ได้

## ตัวอย่างใช้งาน
```
/interview-coach
/interview-coach เล่าตัวเอง ตำแหน่ง Senior PM
/interview-coach behavioral 10 คำถาม
/interview-coach salary negotiation offer 80k
/interview-coach mock interview
```

## Output
ไฟล์ `.md` ชื่อ `interview-prep-<position>-YYYY-MM-DD.md` ประกอบด้วย:
- Pre-Interview Research (company + role + interviewer)
- Tell Me About Yourself (60-90 วิ — สูตร P-P-F)
- Story Bank (5-7 stories ที่ใช้ตอบได้หลายคำถาม)
- Top 10 Q&A พร้อมคำตอบ STAR
- Why Us / Why This Role
- 10 คำถามถามกลับ
- Salary Negotiation prep + script
- Day-Before + Day-Of checklist
- Thank-You email template
- Post-interview reflection

## Workflow ตัวอย่าง
```
1. /resume-builder optimize CV ตาม JD
   ↓
2. /interview-coach (full prep)
   ↓ ทำตาม checklist
3. /interview-coach mock interview (ซ้อมจริง)
   ↓ วันสัมภาษณ์
4. /interview-coach thank you email + reflection
```

## 5 Common Mistakes
1. ตอบ "I have no weakness" — ดู arrogant
2. พูดลบเกี่ยวกับนายจ้างเก่า
3. ไม่มีคำถามถามกลับ ("ไม่มีครับ")
4. โกหกเรื่อง skill — ตรวจง่าย
5. บอก expected salary ก่อน HR ให้ range
