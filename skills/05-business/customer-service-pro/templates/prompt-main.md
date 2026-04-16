# Prompt Formula — Customer Service Pro

## Context Questions

```
ธุรกิจ: <ชื่อ + สินค้า/บริการ>
Platform: <Line OA / FB Inbox / IG DM / TikTok Shop / มีทั้งหมด>
Volume: <inbox/วัน>
ทีม CS: <จำนวนคน + ชั่วโมงทำงาน>
Brand voice: <formal / friendly / fun / professional>
Top 3 คำถามที่เจอบ่อย: ...
Top 3 ปัญหาที่เกิดบ่อย: ...
นโยบายคืนสินค้า: <7 วัน / 15 วัน / ไม่คืน>
เวลาจัดส่ง: <กี่วัน>
```

## Chatbot Flow Design Principles

### โครงสร้าง
```
[Greeting ต้อนรับ]
  ↓
[Main Menu — 3-5 ตัวเลือก]
  ↓
[Sub-menu หรือ Direct Answer]
  ↓
[Confirmation / Handoff]
```

### หลักการ
- Menu หลักไม่เกิน 5 choices
- ทุก path จบใน 3-4 steps
- มี "คุยกับเจ้าหน้าที่" ที่ทุกจุด
- Fallback: ถ้าไม่เข้าใจ 2 ครั้ง → handoff

## FAQ Writing Formula

### Pattern: Q → A → CTA

**Q (1 บรรทัด):** เขียนตามที่ลูกค้าจริงพิมพ์ — ไม่ต้อง formal
> ❌ "ดิฉันอยากสอบถามระยะเวลาในการจัดส่งสินค้า"
> ✅ "ส่งกี่วันถึงคะ?"

**A (2-4 บรรทัด):**
- ตอบชัด + ตัวเลข (ถ้ามี)
- Emoji 1-2 ตัว (ไม่เยอะ)
- มี escape "ถ้ามีคำถามเพิ่มเติมพิมพ์ได้เลยค่ะ"

**CTA (optional):**
- "สั่งซื้อ → [link]"
- "ดู review → [link]"

### ตัวอย่าง
```
Q: ส่งกี่วันถึงคะ?
A: ✅ Kerry / Flash = 1-2 วัน (กทม.) / 2-3 วัน (ตจว.)
   ✅ ไปรษณีย์ = 2-4 วัน
   ส่งทุกวัน จันทร์-เสาร์ (ยกเว้นวันอาทิตย์)
   
   ถ้ารีบ เรามี "ส่งด่วน" +50 บาท ถึงพรุ่งนี้ (สั่งก่อน 14:00)
```

## Escalation Rule Matrix

| Signal | Priority | Route to | SLA |
|--------|----------|----------|-----|
| Keyword: โกรธ, ฟ้อง, แย่มาก | P0 | Supervisor | 15 นาที |
| Keyword: refund > 1,000 | P1 | Manager | 2 ชม. |
| Keyword: ชำรุด + ภาพ | P1 | QC Team | 2 ชม. |
| ไม่เข้าใจ 3 รอบ | P2 | CS คน | 4 ชม. |
| คำถามเฉพาะทาง | P2 | Specialist | 4 ชม. |
| VIP (gold/platinum) | P1 | Account Manager | 2 ชม. |
| Offline hours | P3 | Bot auto-reply + ติดต่อกลับเช้า | 8 ชม. |

## Reply Template Types

1. **First Greeting** — ทักทายครั้งแรกใน inbox
2. **Order Received** — ยืนยันสั่งซื้อ
3. **Payment Confirmed** — ยืนยันชำระเงิน
4. **Shipped** — ส่งของพร้อม tracking
5. **Delivered Follow-up** — ถามความพึงพอใจ
6. **Out of Stock** — ของหมด + แนะนำ alternative
7. **Refund Approved** — อนุมัติคืนเงิน
8. **Refund Rejected** — ปฏิเสธคืนเงิน (ต้องสุภาพและชัด)
9. **Complaint Acknowledge** — รับเรื่อง complain
10. **Complaint Resolution** — แจ้งผลการแก้ไข
11. **Bad Review Response** — ตอบ review 1-2 ดาว
12. **Thank You** — ขอบคุณหลังซื้อ
13. **Win-back** — ดึงลูกค้ากลับหลังไม่ซื้อ 30 วัน

## ตัวอย่าง Brand Voice ต่างกัน

### Formal (ธนาคาร/ประกัน)
> "สวัสดีค่ะ คุณ [ชื่อ] ทางทีมได้รับเรื่องของคุณแล้ว จะดำเนินการตรวจสอบและติดต่อกลับภายใน 24 ชั่วโมง ขออภัยในความไม่สะดวกค่ะ"

### Friendly (D2C วัยรุ่น)
> "หวัดดีค่าคุณ [ชื่อ] 🌼 ได้รับเรื่องแล้วนะคะ ทีมจะเช็คให้เร็วที่สุดเลย พรุ่งนี้เช้าจะกลับมาอัพเดทให้ค่ะ ขอบคุณที่รอน้า"

### Fun (แบรนด์เด็ก/ของเล่น)
> "โย่!! [ชื่อ] 🎉 เรื่องของคุณถึงมือทีมแล้วค่ะ ขอเช็คสักนิดนึงน้า เดี๋ยวรีบวิ่งเอาคำตอบมาให้ภายในวันนี้!"

## Tips

- ตอบไวภายใน 15 นาทีใน peak hours → conversion rate +30%
- ใส่ชื่อลูกค้าใน message → engagement +15%
- Emoji 1-2 ตัว okay, >3 ตัวดูไม่เป็นมืออาชีพ
- Response template ≠ copy paste — ต้องปรับตามเคส
- บันทึก FAQ ที่ bot ตอบไม่ได้ → อัพเดท wiki สัปดาห์ละครั้ง
