# Personal Finance — โค้ชการเงินส่วนตัว

วางแผนการเงินส่วนบุคคลสำหรับคนไทย — ตั้งแต่ทำงบรายเดือน เก็บเงินสำรอง ลดหนี้ ลงทุน จนถึงวางแผนเกษียณ

## Features
- งบประมาณ 50/30/20 (ปรับสำหรับคนรายได้น้อย)
- Emergency Fund 3-6 เดือน
- แผนลดหนี้ Snowball / Avalanche
- แผนลงทุน asset allocation ตามอายุ
- FIRE Thailand (Lean / Regular / Fat)
- วางแผนภาษีไทย (SSF, RMF, ThaiESG, ประกัน)
- Financial Health Check

## บริบทไทย
- ตัวเลขเป็นเงินบาท
- ผลิตภัณฑ์ไทย (กองทุน บลจ. ไทย, สลากออมสิน, กบข., PVD)
- ภาษีตามกฎหมายไทย
- ค่าครองชีพไทย

## ตัวอย่างใช้งาน
```
/personal-finance
/personal-finance ทำงบเงินเดือน 35,000
/personal-finance หนี้บัตร 120,000 อยากปลดใน 2 ปี
/personal-finance วางแผนเกษียณอายุ 35
```

## ⚠️ Disclaimer
ข้อมูลที่ให้เป็น **ความรู้ทั่วไป** ไม่ใช่คำแนะนำการลงทุน — ปรึกษาที่ปรึกษาการเงินที่มีใบอนุญาต (CFP, IC License) ก่อนตัดสินใจ

## Output
ไฟล์ `.md` ชื่อ `finance-<topic>-YYYY-MM-DD.md` ประกอบด้วย:
- สถานการณ์ปัจจุบัน + Health Score (อัตราการออม, DTI, Emergency Fund)
- เป้าหมาย SMART (3-12 เดือน + 1-5 ปี + เกษียณ)
- แผน step-by-step แบ่งเป็น 4 phases
- Projection ตัวเลข 5 ปี
- แผนปลดหนี้ (snowball/avalanche)
- แผนลงทุน asset allocation ตามอายุ
- แผนภาษี (SSF/RMF/ThaiESG)
- Tracker template (Excel/Notion spec)
- Action checklist สัปดาห์นี้

## Workflow ตัวอย่าง
```
1. /personal-finance Financial Health Check
   ↓
2. /personal-finance หนี้บัตร 80k อยากปลด
   ↓ (3-6 เดือนหลังปลดหนี้)
3. /personal-finance อยากเริ่มลงทุนเดือนละ 5k
   ↓ (1 ปีหลัง)
4. /personal-finance วางแผนเกษียณอายุ 50
```

## Frameworks
- **50/30/20 Budget** — Needs/Wants/Savings (ปรับ 60/20/20 สำหรับรายได้น้อย)
- **Debt Snowball/Avalanche** — Dave Ramsey
- **FIRE Movement** — 25x Rule (Trinity Study)
- **Asset Allocation** — Age-based (100 - age = % equity)
- **3-6 Month Emergency Fund** — มาตรฐานสากล
