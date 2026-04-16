# Prompt Formula — Financial Planner

## Template คำถาม context

```
อายุ: <ปี>
สถานะ: <โสด / สมรส / มีบุตร X คน>
อาชีพ: <พนักงานประจำ / freelance / เจ้าของธุรกิจ>
รายได้สุทธิ/เดือน: <บาท>
ค่าใช้จ่ายคงที่/เดือน: <บาท>
หนี้สิน: <ประเภท + ยอด + ดอกเบี้ย>
สินทรัพย์: <เงินสด / กองทุน / หุ้น / ประกัน / อสังหา>
เป้าหมาย: <เกษียณอายุ / ซื้อบ้าน / ส่งลูกเรียนนอก>
Risk tolerance: <conservative / moderate / aggressive>
```

## Emergency Fund Recipe

```
คำนวณ emergency fund:
- ค่าใช้จ่ายคงที่/เดือน × multiplier
  - พนักงาน stable: × 6
  - Freelance: × 9-12
  - คู่สมรสทำงานทั้งคู่: × 3-6
- แนะนำที่เก็บ: e-savings + money market fund
- Goal: ตั้งให้ได้ภายใน 12 เดือน
```

## Asset Allocation Recipe

```
แบ่งพอร์ต:
- หุ้น %: 100 - อายุ (± risk tolerance 10%)
- ตราสารหนี้ %: ส่วนที่เหลือ - 10%
- เงินสด/ทอง %: 10%
- แยกเป็น: ในประเทศ / ต่างประเทศ
- กองทุนแนะนำตามประเภท (อย่าระบุชื่อ)
```

## Retirement Recipe

```
คำนวณเงินเกษียณ:
- รายจ่าย/ปีหลังเกษียณ × 25 = Target
- ปัจจุบันมีเท่าไร?
- ต้องเก็บเพิ่ม/เดือน เท่าไร? (assume return 7%/ปี)
- แหล่งเงิน: ประกันสังคม + RMF + กองทุน + หุ้น
- timeline: กี่ปีจะถึง goal
```

## Tax Optimization Recipe

```
รายได้ <ตัวเลข>:
- คำนวณภาษีปัจจุบัน
- รายการลดหย่อนที่ยังไม่ใช้:
  - RMF (max 500k)
  - SSF (max 200k)
  - ThaiESG (max 300k)
  - ประกันบำนาญ (max 200k)
  - ประกันชีวิต (max 100k)
- ภาษีที่ประหยัดได้
- คำเตือน rule รวม 500k
```

## FIRE Recipe

```
คำนวณ FIRE:
- รายได้ - รายจ่าย = savings
- Savings rate %
- Years to FIRE table
- Coast FIRE number (เลิก add)
- Lean / Normal / Fat target
- Action: เพิ่มรายได้ / ลดรายจ่าย / เพิ่ม return
```

## Debt Payoff Recipe

```
List หนี้ทุกก้อน:
- ดอก > 15%: ปิดด่วน (Avalanche)
- ดอก 7-15%: ทยอย
- ดอก < 7%: จ่ายตามปกติ
- คำนวณดอกเบี้ยรวมที่ประหยัดได้
- Timeline ปลดหนี้
```

## Tips

- Emergency fund ก่อน investment เสมอ
- ไม่แนะนำชื่อกองทุน — แนะนำ "ประเภท" เท่านั้น
- ทุก output มี disclaimer + แนะนำให้ปรึกษา CFP
- สมมติฐาน inflation 2-3%, return 7-8% (ตลาดหุ้นไทย 20 ปี)
