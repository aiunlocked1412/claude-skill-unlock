# Resume Builder — ผู้ช่วยเขียน CV ระดับ HR

เขียน Resume / CV / Cover Letter ที่ผ่าน ATS และดึงดูด recruiter

## Features
- Resume / CV ใหม่ทั้งใบ (1-2 หน้า)
- Cover Letter (ไม่เกิน 350 คำ)
- Optimize ตาม JD เฉพาะ (keyword extraction)
- LinkedIn Profile Optimizer
- STAR Bullet Rewriter (duty → achievement)
- ATS Score Check
- ภาษาไทย + อังกฤษ

## Frameworks
- **STAR method:** Situation, Task, Action, Result
- **ATS Optimization:** keyword density, format compliance
- **6-second rule:** recruiter scan ใน 6 วิ

## บริบทไทย vs อินเตอร์
- **บริษัทไทย:** ใส่รูป + วันเกิดได้ (วัฒนธรรม)
- **MNCs / อินเตอร์:** ห้ามใส่ (anti-discrimination)

## ตัวอย่างใช้งาน
```
/resume-builder
/resume-builder marketing manager 5 ปี
/resume-builder cover letter senior data analyst
/resume-builder optimize ตาม JD นี้: [paste]
/resume-builder ATS check
```

## Output
ไฟล์ `.md` ชื่อ `resume-<name>-<position>-YYYY-MM-DD.md` — แปลงเป็น .docx/.pdf ก่อนส่ง

## Tips
- 1 หน้า สำหรับ Junior / Mid (≤ 5 ปี)
- 2 หน้า สำหรับ Senior / Manager
- ใส่ตัวเลขใน bullet ทุกครั้ง (% / บาท / จำนวนคน)
- ปรับ resume ให้ตรง JD ทุกครั้ง — ไม่ใช้ resume เดียว apply ทุกที่
- Save .pdf หรือ .docx (ห้าม .pages, .png)
- File name format: `FirstName_LastName_Resume_[Position].pdf`

## Workflow ตัวอย่าง
```
1. /resume-builder ATS check resume ปัจจุบัน
   ↓
2. /resume-builder optimize ตาม JD เฉพาะ
   ↓
3. /resume-builder cover letter customize
   ↓
4. /resume-builder linkedin profile sync ตาม resume version ใหม่
   ↓
5. /interview-coach (next skill)
```

## Resume Sections (7 ส่วน)
1. **Header** — ชื่อ + contact + LinkedIn
2. **Professional Summary** — 2-3 บรรทัด
3. **Experience** — STAR bullets, 60% ของพื้นที่
4. **Skills** — Hard / Soft / Tools / Languages
5. **Education** — degree + GPA (ถ้า ≥ 3.50)
6. **Certifications** — relevant only
7. **Optional** — Awards / Volunteer / Side projects

## Action Verbs Strong (แทน "Responsible for")
Spearheaded, Architected, Drove, Orchestrated, Pioneered, Catalyzed, Transformed, Engineered, Cultivated, Generated
