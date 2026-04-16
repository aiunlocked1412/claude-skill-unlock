# Prompt Patterns สำหรับ Nutritionist Pro

## 1. Pattern: Meal Plan 7 วัน

```
ออกแบบ meal plan 7 วัน สำหรับ:
- Profile: <เพศ / อายุ / น้ำหนัก / ส่วนสูง / activity>
- เป้าหมาย: <ลด X kg ใน Y สัปดาห์ / เพิ่มกล้าม / รักษา>
- Target calories: <kcal/day>
- Macro: <P/C/F ratio>
- ข้อจำกัด: <แพ้ / ไม่กิน / ศาสนา>
- งบ: <บาท/สัปดาห์>

สร้าง 7 วัน x 4 มื้อ (Breakfast / Lunch / Dinner / Snack):
- ทุกเมนูเป็นอาหารไทยหรือ fusion ไทยที่หาวัตถุดิบง่าย
- ระบุแคลอรี่ + P/C/F ของแต่ละเมนู
- ทุกวันรวมต้องใกล้ target ±50 kcal
- หลีกเลี่ยงเมนูซ้ำในสัปดาห์เดียวกัน
- เน้น variety ของผัก 10+ ชนิด

ลงท้ายด้วย:
- Grocery list แยกตามร้าน
- Prep schedule 1 วัน
- Swap options
```

## 2. Pattern: TDEE + Macro Calculator

```
คำนวณ TDEE + macro สำหรับ:
- เพศ: M/F
- อายุ: <ปี>
- น้ำหนัก: <kg>
- ส่วนสูง: <cm>
- Activity: sedentary / light / moderate / high

BMR (Mifflin-St Jeor):
- ชาย: 10W + 6.25H - 5A + 5
- หญิง: 10W + 6.25H - 5A - 161

TDEE = BMR × activity factor
(1.2 / 1.375 / 1.55 / 1.725)

Target:
- ลด: TDEE - 500 (ลด 0.5 kg/สัปดาห์)
- เพิ่ม: TDEE + 300-500
- รักษา: TDEE

Macro (default):
- P: 1.6-2.2 g/kg body weight
- F: 20-30% total cal
- C: ที่เหลือ

แสดงผล:
- BMR
- TDEE
- Target cal
- P/C/F ในกรัม + %
```

## 3. Pattern: Grocery List

```
สร้าง grocery list สำหรับ meal plan 7 วัน

แยกตาม:
1. ตลาด/โลตัส (สด — ซื้อสัปดาห์ละ 1-2 ครั้ง)
   - ผัก (10+ ชนิด)
   - ผลไม้ (4-5 ชนิด)
   - เนื้อ/ไข่/ปลา
   - ของสด (เต้าหู้, นมสด)

2. 7-11 / ร้านสะดวกซื้อ
   - ของแห้ง ฉุกเฉิน
   - ขนมปัง whole grain
   - yogurt

3. แม็คโคร / Big C (bulk)
   - ข้าวกล้อง / quinoa
   - น้ำมันมะกอก
   - ถั่วต่างๆ
   - อาหารแช่แข็ง

ระบุ:
- ปริมาณ (เช่น อกไก่ 1 kg, ไข่ 15 ฟอง)
- ราคาประมาณ
- รวมงบทั้งหมด
```

## 4. Pattern: Recipe (1 เมนู)

```
สร้าง recipe สำหรับ <เมนู>:

- ส่วนผสม (สำหรับ 1 serving)
- ขั้นตอน (5-7 ขั้น สั้นกระชับ)
- เวลาทำ: X นาที
- แคลอรี่: ___ kcal
- Macro: P __g / C __g / F __g
- Tips: วิธีเก็บ / meal prep / variations

ต้องทำได้ใน:
- ครัวไทยทั่วไป
- วัตถุดิบจาก 7-11 / โลตัส
- ใช้เวลา ≤ 20 นาที (สำหรับ busy day)
```

## 5. Pattern: Food Swap

```
สร้าง swap guide สำหรับ:

อาหารที่มัก craving + ทางเลือกแคลต่ำกว่า 50%

แบ่งเป็น:
- Thai food (ผัดไทย → ก๋วยเตี๋ยวเรือ)
- Snack (มันฝรั่งทอด → ถั่วลิสงอบ)
- Drink (ชาเย็น → ชาไทยไม่ใส่น้ำตาล + หญ้าหวาน)
- Dessert (ไอศกรีม → กรีกโยเกิร์ต + ผลไม้)
- Fast food (McDo → Grilled chicken salad)

ระบุ:
- ก่อน → หลัง kcal
- Diff (-kcal หรือ -%)
- ความใกล้เคียงรสชาติ (5 ดาว)
```
