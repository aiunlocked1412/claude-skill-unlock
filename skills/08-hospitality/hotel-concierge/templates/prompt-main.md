# Prompt Formula — Hotel Concierge

## Template คำถาม context

```
Hotel: <ชื่อ> <ดาว> <location>
Guest: <สัญชาติ> <จำนวน> <อายุเฉลี่ย> <relationship>
Stay: <จำนวนคืน> + <check-in date>
Interest: <food / culture / shopping / wellness / nightlife / kids>
Budget: <economy / mid / premium / luxury> ต่อมื้อ ฿<X> ต่อกิจกรรม ฿<Y>
Special: <allergy / accessibility / religious / language>
```

## Recommendation Matrix Prompt

```
แนะนำสำหรับ guest <profile>:
สำหรับแต่ละ category (Food, Attraction, Shopping, Transport, Wellness):
- 3-5 options
- แต่ละ option ต้องมี:
  1. Name (Thai + EN)
  2. Address + Google Maps link
  3. Price range (฿/฿฿/฿฿฿/฿฿฿฿)
  4. Why pick (1-2 ประโยค ตรง profile)
  5. Tip (เวลาดี, จองล่วงหน้า, dress code)
- ระบุระยะทางจากโรงแรม (เดิน/แท็กซี่/BTS กี่นาที)
- มี backup option (plan B) ทุกตัวเลือก
```

## Itinerary Prompt

```
ออกแบบ itinerary <จำนวนคืน> สำหรับ <guest profile>:
- แบ่งเป็น Morning / Lunch / Afternoon / Dinner / Evening
- 1 วัน max 3 highlight
- Pacing: เช้าหนัก, บ่าย relax, เย็น experience
- Buffer 30 นาที ระหว่าง slot
- Backup plan ถ้าฝน/ปิด
- Total cost estimate ต่อวัน
```

## Complaint Resolution Prompt

```
Handle complaint: <ระดับ> + <สถานการณ์>
Process: LISTEN → APOLOGIZE → SOLVE → COMPENSATE → FOLLOW-UP

Output:
1. Script ขอโทษ (ห้าม blame)
2. Action steps (ใคร ทำอะไร เมื่อไร)
3. Compensation tier (ตามระดับ)
4. Follow-up plan (T+1, T+7, T+30)
5. Internal note (PMS update)
```

## Reply Template Prompt

```
เขียน reply template สำหรับ:
- Channel: <email / in-app / WhatsApp>
- Language: <ไทย / EN / mixed>
- Scenario: <booking / inquiry / complaint / thank you>
- Tone: <professional warm / casual friendly / formal corporate>
- ความยาว: <50-80 words>
- มี CTA ชัด
```

## Tips

- **Verify ทุก recommendation** ก่อนแนะ — เปิด/ปิด, ราคา, จอง
- **Profile guest** เป็น compass — couple ≠ family ≠ business
- **อาหาร allergy** ตรวจซ้ำกับร้าน 100% (ถั่ว, gluten, halal)
- **Backup plan** เสมอ — Plan B ถ้า Plan A ปิด/ฝน/full
- **Photo + map** ส่งใน in-app/WhatsApp ลด friction guest
