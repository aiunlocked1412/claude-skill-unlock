# Email Marketer — Framework & Benchmark

## Recipe: Full Email Program

```
/email-marketer full
Business: <ขายอะไร + AOV>
List size: <จำนวน + source>
ESP: <Mailchimp / Klaviyo / ActiveCampaign / etc.>
Current performance: <open / CTR / unsub %>
Goal: <nurture / sale / retention / win-back>
Voice: <fun / premium / warm / professional>
```

---

## Lifecycle Stages (5 Stage Model)

| Stage | นิยาม | Frequency | Content type |
|-------|------|-----------|-------------|
| New (0-14d) | เพิ่งสมัคร | Welcome series | Onboarding + brand story |
| Active engaged | เปิด >50% | 1-2/wk | Nurture + tips |
| Customer | ซื้อใน 90d | 1/wk | Cross-sell + loyalty |
| At-risk | ไม่เปิด 30-60d | 2/30d | Re-spark + survey |
| Dormant | ไม่เปิด 90d+ | 3 emails then remove | Win-back |

---

## Benchmark ไทย 2026

| Metric | E-commerce | SaaS | Newsletter | B2B |
|--------|-----------|------|-----------|-----|
| Open rate | 22-30% | 25-35% | 35-45% | 28-38% |
| CTR | 2-4% | 3-5% | 4-7% | 3-5% |
| Unsubscribe | <0.3% | <0.4% | <0.5% | <0.4% |
| Bounce | <2% | <2% | <2% | <2% |
| Spam complaint | <0.05% | <0.05% | <0.05% | <0.05% |

---

## Subject Line Formulas

### Curiosity
- "ผมเพิ่งรู้ว่า..."
- "เรื่องนี้ผมไม่อยากบอกใคร แต่..."
- "[คำถามที่ค้างใจ]"

### Personal
- "ถึงคุณ [ชื่อ] โดยเฉพาะ"
- "ขอเวลา 2 นาทีนะ"
- "เห็นคุณเปิดอันที่แล้ว เลย..."

### Urgency
- "[X] ชั่วโมงสุดท้าย"
- "ปิดเที่ยงคืนนี้"
- "เหลือ 12 ที่"

### Benefit
- "วิธี [outcome] ใน [time]"
- "[Number] อย่างที่ [audience] ทำผิดทุกวัน"

### Negative / Pattern interrupt
- "อย่าทำแบบนี้กับ [thing]"
- "เลิกอ่านคอนเทนต์ฟรี"

**Length:** 30-50 char (มือถือ crop 40)
**Avoid:** !!!, ALL CAPS, "FREE", "$$", "act now"

---

## Preview Text Rules
- 40-90 char
- เสริม subject — ไม่ซ้ำ
- คิดเหมือน sub-headline
- ห้ามว่าง — ESP จะดึง first line ของ body มาแทน

---

## Email Anatomy

```
[Subject 30-50 char]
[Preview 40-90 char]

From: ชื่อคน @ บริษัท

Hi [First name],

[Hook 1-2 บรรทัด — เปิดด้วยเรื่อง ไม่ใช่ pitch]

[Body — 100-300 คำ — 1 idea]

[ONE CTA — button หรือ link]

[Sign-off ชื่อจริง]

P.S. [ส่วนสำคัญที่สุด — 80% อ่าน]
```

---

## Segmentation Patterns

### Behavioral
- Opened last 30 days → engaged segment
- Clicked but didn't buy → high intent
- Bought 1x → first-time customer
- Bought 3+ → VIP

### RFM (Recency, Frequency, Monetary)
- Champions: ซื้อบ่อย + เพิ่ง + จ่ายเยอะ
- Loyal: ซื้อบ่อย + จ่ายเยอะ
- At-risk: ไม่ซื้อนาน + เคยจ่ายเยอะ
- Lost: ไม่ซื้อ 6+ เดือน

### Lifecycle
- Pre-purchase nurture
- First-purchase onboard
- Repeat-purchase engage
- Lapsed re-engage

---

## Deliverability Setup

### DNS Records (ติดที่ domain registrar)
```
SPF:  v=spf1 include:<esp>.com ~all
DKIM: ESP จะให้ public key — ใส่ TXT record
DMARC: v=DMARC1; p=none; rua=mailto:dmarc@yourdomain.com
```

ขั้นตอน DMARC: เริ่ม p=none → ดู report 2 สัปดาห์ → quarantine → reject

### Warm-up Schedule (สำหรับ domain/IP ใหม่)

| Week | Daily volume |
|------|-------------|
| 1 | 50/day |
| 2 | 100/day |
| 3 | 200/day |
| 4 | 500/day |
| 5+ | 1000+/day |

ส่งเฉพาะ engaged subscribers ก่อน (เปิด <30 วัน)

---

## Spam Trigger Words (เลี่ยง)

- "FREE!!!" / "100% FREE"
- "Make money fast"
- "Click here now"
- "Act now"
- "Limited time only" (มากเกิน)
- "$$$" / "₿"
- ALL CAPS WORDS
- คำซ้ำกัน 3+ ครั้ง

---

## A/B Test Recipe

```
Test: <variable เดียว>
Hypothesis: ถ้าเปลี่ยน X เป็น Y → Z จะดีขึ้น
Sample: 50/50 split, อย่างน้อย 1000/variant
Duration: 24-48 ชม.
Winner threshold: 95% confidence (chi-square)
Action: ถ้าชนะ → roll out 100%, ถ้าเสมอ → ทดสอบใหม่
```

---

## Common Mistakes

1. ส่งทั้ง list ทุกครั้ง → ทำลาย sender reputation
2. ไม่ลบ dormant → bounce rate พุ่ง
3. Subject ยาว 70+ char → crop หาย
4. Image-only email → ไป spam
5. ไม่มี alt text → accessibility + spam score เสีย
6. ไม่ส่ง welcome ทันที → lose 40% engagement
7. Unsubscribe ซ่อน → spam complaint เพิ่ม
