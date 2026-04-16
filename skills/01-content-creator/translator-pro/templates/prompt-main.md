# Translation Template — Recipes & Pitfalls

## 4 ระดับการแปล

| ระดับ | ใช้เมื่อ | ตัวอย่าง |
|------|---------|---------|
| **Literal** | เอกสารกฎหมาย / สัญญา | ตรงตามคำต้นฉบับ |
| **Natural** | บทความ / email | ปรับให้ลื่น แต่เก็บความหมาย |
| **Localized** | UX / marketing | ปรับ reference ให้ท้องถิ่นเข้าใจ |
| **Transcreation** | Slogan / tagline / poetry | เขียนใหม่ เก็บแค่ intent |

---

## Common Pitfalls (ที่เจอบ่อย)

### 1. EN → TH: ความ formal ผิดระดับ

**ปัญหา:** English "Please" ≠ "กรุณา" เสมอ

❌ "Please click here" → "กรุณาคลิกที่นี่" (แข็งเกินไป บน UI)
✓ "Please click here" → "คลิกที่นี่" (casual) หรือ "คลิกเลย" (marketing)

---

### 2. TH → EN: อ้อมค้อมเกินไป

**ปัญหา:** ภาษาไทยสุภาพ = อ้อม แต่ English ต้อง direct

❌ "ขอเรียนแจ้งให้ทราบว่าขณะนี้ระบบอยู่ในช่วงการปรับปรุง..."
→ "I would like to inform you that the system is currently in the process of being updated..."

✓ "Our system is currently under maintenance."

---

### 3. Pronoun mismatch

**ภาษาไทยมีหลายระดับ:**
- ผม / ฉัน / กู / ข้าพเจ้า / เรา
- คุณ / ท่าน / เธอ / นาย / มึง

**English มีแค่:** I, you, we

**กฎ:** ดู **register ต้นฉบับ** → match ระดับในภาษาปลายทาง

---

### 4. Cultural references

**คำที่แปลตรงไม่ได้:**

| ไทย | ความหมาย | แปล (ไม่ได้ตรง) |
|-----|---------|----------------|
| เกรงใจ | ไม่อยากรบกวน | "be considerate / not want to impose" |
| มีน้ำใจ | helpful + generous | "kind-hearted / thoughtful" |
| สะใจ | satisfying revenge | "hit the spot / satisfying" |
| อ่อย | subtle flirt | "give subtle signals / toy with" |
| เผือก | mind other's business | "get into someone's business / snoopy" |

**English → Thai:**
| English | ปัญหา | แก้ |
|---------|-------|-----|
| "Break a leg" | คำอวยพรสะเทือน? | "สู้ๆ นะ" / "โชคดีนะ" |
| "Piece of cake" | ไม่ใช่ขนม | "หมูๆ" / "ง่ายมาก" |
| "Spill the tea" | ไม่ใช่ชา | "เล่าดิ" / "กรุบไหมล่ะ" |
| "Deal breaker" | ไม่มีคำตรง | "เรื่องที่รับไม่ได้" / "จุดแตกหัก" |

---

## Subtitle (.srt) Rules

### Format
```
1
00:00:01,500 --> 00:00:04,000
บรรทัดที่ 1 ไม่เกิน 42 ตัวอักษร
บรรทัดที่ 2 ก็ไม่เกิน 42

2
00:00:04,500 --> 00:00:07,000
Subtitle ถัดไป
```

### กฎสำคัญ
1. **Max 2 บรรทัด** ต่อ subtitle
2. **42 ตัวอักษร/บรรทัด** (industry standard)
3. **Reading speed 17 CPS** (characters per second) Thai / 21 CPS English
4. **Min duration 1 วินาที** Max 6 วินาที
5. **ตัดคำถูก** — ไทย: อย่าตัดกลางคำ (ปัญหา / ใช้เครื่องมือตัดคำ)
6. **Punctuation** — ไทยไม่ใช้ `.` จบประโยค (ยกเว้นตัวย่อ), ใช้ space หรือ newline

### การจัดการเวลาไม่พอ
ถ้าข้อความยาวเกินเวลา:
- **Condense** — ตัดคำที่ไม่จำเป็น (ครับ/ค่ะ, well, you know)
- **Split** เป็น 2 subtitles ถ้าเวลาพอ
- **Simplify** — ใช้คำสั้นกว่า (เช่น "อย่างไรก็ตาม" → "แต่")

---

## Email / Business Doc Recipes

### English → Thai (formal)

**Structure ไทย formal:**
```
เรียน คุณ<ชื่อ>

<เนื้อหา — เริ่มด้วยการแสดงความห่วงใย/ขอบคุณ ถ้าเหมาะ>

<ประเด็นหลัก>

<ปิด — บอกความคาดหวังต่อไป สุภาพ>

ขอแสดงความนับถือ
<ชื่อ>
<ตำแหน่ง>
```

### Thai → English (formal)

**Structure English formal:**
```
Dear <Name>,

<Opening — direct, state purpose>

<Main point — clear, bulleted if multi>

<Closing — specific next step, polite but brief>

Best regards / Sincerely,
<Name>
<Title>
```

**สำคัญ:** ตัดคำ "ขอเรียน..." / "ทั้งนี้..." / "อนึ่ง..." — English ไม่ต้อง

---

## Landing Page / Marketing

### Headline Transcreation

**ตัวอย่าง:** Apple "Think Different"
- Literal: "คิดต่าง" (ใช้ได้)
- Better: "คิดต่าง ทำแปลก" (เพิ่ม rhyme ไทย)
- Creative: "คิดไม่เหมือนใคร" (emotional)

**กฎ:**
- คง **syllable count** หรือ **rhythm** ถ้าเป็นไปได้
- เก็บ **core emotion** มากกว่า literal meaning
- ทดสอบออกเสียง — ไหลลื่นไหม?

### CTA Translation

| English | Thai options |
|---------|-------------|
| "Get Started" | "เริ่มเลย" / "เริ่มต้นใช้งาน" |
| "Learn More" | "ดูรายละเอียด" / "อ่านต่อ" |
| "Sign Up Free" | "สมัครฟรี" / "ลงทะเบียนฟรี" |
| "Buy Now" | "ซื้อเลย" / "สั่งซื้อทันที" |
| "Book a Demo" | "นัดชม Demo" / "จองเดโม" |

---

## Date / Number / Currency

### Date
| Context | Format |
|---------|--------|
| ไทย formal | 16 เมษายน 2569 (B.E.) |
| ไทย casual | 16 เม.ย. 2026 |
| US | April 16, 2026 (MM/DD/YYYY) |
| UK/EU | 16 April 2026 (DD/MM/YYYY) |

### Number
- TH: 1,234.56 (comma thousands, dot decimal)
- EN-US: 1,234.56 (same)
- EN-EU: 1.234,56 (dot thousands, comma decimal) — **ระวัง!**

### Currency
- Thai: "฿100" หรือ "100 บาท"
- English: "$100" / "100 USD" / "100 THB"
- **อย่าเปลี่ยนค่า** ถ้าไม่ได้รับอนุญาต — แค่เพิ่ม clarification: "฿3,500 (~$100 USD)"

---

## Glossary Management

ถ้าเอกสารยาว / มีหลายส่วน ให้ทำ glossary ก่อน:

```
| EN | TH | Context |
|----|----|---------|
| dashboard | แดชบอร์ด | keep English |
| onboarding | การเริ่มต้นใช้งาน | TH for casual |
| user | ผู้ใช้ | |
| customer | ลูกค้า | |
| analytics | วิเคราะห์ข้อมูล | |
```

**กฎ:** คำเดียวกัน = แปลเหมือนกันตลอดเอกสาร

---

## Quality Check Checklist

- [ ] อ่านซ้ำ — ฟังเป็นธรรมชาติในภาษาปลายทางไหม?
- [ ] เปรียบเทียบ source vs target — ไม่มี meaning drift
- [ ] Format ครบ (bold, italic, link, variable)
- [ ] ชื่อเฉพาะไม่ถูกแปล
- [ ] ตัวเลข / หน่วย / วันที่ ถูกต้อง
- [ ] Consistency ทั้งเอกสาร
- [ ] No machine translation artifacts (เช่น "มันคือ" / "การเป็น" / "ที่จะ")
