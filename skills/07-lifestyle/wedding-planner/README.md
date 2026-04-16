# Wedding Planner — Wedding Planner มืออาชีพ

วางแผนงานแต่งครบวงจร — พิธีไทย + สากล + ผสม

## Features
- 12-Month Master Timeline (ครบทุก milestone)
- Budget Allocation (40% venue, 25% food, 12% photo, etc.)
- Venue Selection (โรงแรม, outdoor, บ้าน, destination)
- Vendor Checklist (ภาพ, ดอกไม้, MC, อาหาร)
- พิธีไทย (ขันหมาก, สงฆ์, รดน้ำสังข์, สู่ขอ, สินสอด)
- พิธีสากล (ceremony, reception, vow, speech)
- Bride / Groom Checklist
- Guest Management (RSVP, seating, welcome bag)
- Save Budget Tips
- Day-Of Run-Sheet (นาทีต่อนาที)

## Budget Standard (% ของงบรวม)
- Venue + Catering: 40-50%
- Photo + Video: 12%
- ดอกไม้ + Decoration: 8%
- ชุดเจ้าบ่าวเจ้าสาว: 6%
- MC + ดนตรี: 4%
- Stationery: 2%
- Hair + Makeup: 2%
- Wedding Cake: 1%
- Buffer: 5-10% (สำคัญ!)

## บริบทไทย
- พิธีไทย: ขันหมาก ประตูเงินทอง สงฆ์ รดน้ำสังข์
- สินสอด: 100k - 1M+ ตามครอบครัว
- ทอง 1-5 บาท + พระเครื่อง
- Vendor ราคาตลาด 2026 (กรุงเทพ + ต่างจังหวัด)
- โรงแรม 5 ดาวกรุงเทพ vs riverside vs บ้าน

## ตัวอย่างใช้งาน
```
/wedding-planner
/wedding-planner งบ 800,000 150 คน ผสมไทย+สากล
/wedding-planner timeline 12 เดือน
/wedding-planner พิธีไทย ขันหมาก
/wedding-planner save budget 500k 100 คน
```

## Output
ไฟล์ `.md` ชื่อ `wedding-<topic>-YYYY-MM-DD.md` ประกอบด้วย:
- Overview (date, guests, budget, style)
- Budget Breakdown 11 หมวด + buffer 10%
- 12-Month Master Timeline
- Vendor Tracker (มัดจำ + งวด + final)
- พิธีไทย Schedule (ขันหมาก + สงฆ์ + รดน้ำ)
- พิธีสากล Schedule (ceremony + reception)
- Day-Of Run Sheet (15-min granularity)
- Bride / Groom Checklist
- Guest Management (RSVP + dietary + special)
- Backup Plans (ฝนตก, vendor ไม่มา)

## Workflow ตัวอย่าง
```
1. /wedding-planner Critical 7 (date + budget + style)
   ↓
2. /wedding-planner 12-month timeline
   ↓ (เดือนที่ 9)
3. /wedding-planner vendor checklist photo+video
   ↓ (เดือนที่ 6)
4. /wedding-planner พิธีไทย ขันหมาก + สินสอด
   ↓ (เดือนที่ 1)
5. /wedding-planner run sheet day-of
```

## ราคาตลาด Vendor 2026 (กรุงเทพ)
- Venue 5 ดาว: 1,800-3,500/หัว
- Photographer top: 80k-250k
- Videographer: 50k-150k
- Wedding gown ตัด: 40k-300k
- ดอกไม้ครบงาน: 60k-200k
- MC + DJ: 25k-100k
- Wedding planner: 80k-300k
