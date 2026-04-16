---
type: nocode-blueprint
project: MassageCRM — ร้านนวด "บ้านนวดเพลิน"
business: Spa/Massage shop (3 therapists, ~300 bookings/month)
created: 2026-04-16
---

# No-Code Blueprint: MassageCRM สำหรับร้านนวด

## Business Context

| Field | Value |
|-------|-------|
| Business | ร้านนวดไทย/อโรม่า (1 สาขา, 3 therapists) |
| Problem | รับ booking ทาง LINE/โทรศัพท์ ใช้ Excel + กระดาษ พลาด + ลืม follow-up + ไม่มีข้อมูลลูกค้ากลับมา |
| Users | เจ้าของ (1) + therapists (3) + ลูกค้า (~500 regulars) |
| Budget | ≤ $50/mo |
| Tech skill | เจ้าของ: beginner (ใช้ Google Sheets ได้), therapists: zero |
| Timeline | 2 สัปดาห์ go-live MVP |

**KPI เป้าหมายหลัง launch 3 เดือน:**
- ลด no-show 50% (จาก 15% → 7%)
- เพิ่ม repeat customer 20% (จาก reminder + feedback loop)
- ประหยัดเวลาเจ้าของ 10 ชม/สัปดาห์ (ไม่ต้องตอบ LINE manual)

---

## Tool Stack (แนะนำ)

| Layer | Tool | Why | Cost |
|-------|------|-----|------|
| Database | **Airtable** | Relational + view calendar, mobile app ดี | $10/mo (1 user pro) |
| Automation | **Make** (Integromat) | Flow ซับซ้อนได้ ราคาถูก | $9/mo |
| Booking form | **Tally** | Free unlimited, responsive | $0 |
| Customer portal | **Softr** | Build site on Airtable ง่าย | $24/mo (Phase 3) |
| LINE notify | **LINE Notify** | Free + Thai users ใช้ LINE 100% | $0 |
| SMS reminder | **MessageBird** | Cheapest for Thai SMS | ~฿0.20/SMS |
| Feedback form | **Tally** (reuse) | - | $0 |

### Total cost
- **MVP (Phase 1-2):** ~฿700/mo ($19 + SMS estimate ฿100)
- **Phase 3 (customer portal):** ~฿1,600/mo ($43)
- **Phase 4 (scale):** ~฿2,500/mo

### Alternatives considered

| Option | Pro | Con | Verdict |
|--------|-----|-----|---------|
| LINE OA + Google Sheets | ลูกค้าคุยใน LINE ตรง | Manual heavy, ไม่มี structure | Skip |
| Booking tool พร้อมใช้ (Calendly, Fresha) | Setup 1 วัน | ฝรั่ง-first, ไม่ flexible, ฿1K+/mo | Skip |
| Bubble (all-in-one) | ทำได้ทุกอย่าง | Learning curve + เจ้าของทำเองไม่ได้ | Skip |

---

## Database Schema (Airtable)

### Table 1: Customers
| Field | Type | Required | Note |
|-------|------|----------|------|
| id | Auto number | ✓ | Primary |
| name | Text | ✓ | |
| nickname | Text | | สำหรับ therapist เรียก |
| phone | Phone | ✓ | unique match key |
| line_id | Text | | optional |
| birthday | Date | | ใช้ส่ง promo |
| preferences | Long text | | เช่น "ชอบน้ำหนักแรง แพ้น้ำมันมะพร้าว" |
| created_at | Created time | Auto | |
| total_bookings | Count | Auto | Rollup |
| total_spent | Currency | Auto | SUM |
| last_visit | Date | Auto | MAX |
| customer_tier | Formula | Auto | IF(total_spent >= 10K, "VIP", IF(>=5K, "Regular", "New")) |
| no_show_count | Count | Auto | |

### Table 2: Services
| Field | Type | Required |
|-------|------|----------|
| id | Auto number | ✓ |
| name | Text | ✓ |
| duration_min | Number | ✓ |
| price | Currency | ✓ |
| active | Checkbox | ✓ |
| description | Long text | |

**Sample records:**
- นวดไทย 60 นาที — ฿400
- นวดไทย 90 นาที — ฿550
- อโรม่า 60 นาที — ฿600
- ประคบสมุนไพร 90 นาที — ฿700

### Table 3: Bookings
| Field | Type | Required | Note |
|-------|------|----------|------|
| id | Auto number | ✓ | |
| customer_id | Link → Customers | ✓ | |
| service_id | Link → Services | ✓ | |
| therapist_id | Link → Therapists | | assign ทีหลัง |
| datetime | Date+time | ✓ | |
| duration | Lookup | Auto | from Services |
| end_time | Formula | Auto | datetime + duration |
| status | Single select | ✓ | New / Confirmed / Done / No-show / Cancelled |
| total | Lookup | Auto | from Services.price |
| notes | Long text | | |
| reminder_sent | Checkbox | Auto | |
| feedback_sent | Checkbox | Auto | |
| created_at | Created time | Auto | |
| source | Single select | | Form / LINE / Phone / Walk-in |

### Table 4: Therapists
| Field | Type |
|-------|------|
| id, name, phone, active, specialties (multi-select) |

### Table 5: Feedback
| Field | Type |
|-------|------|
| id, booking_id (link), rating (1-5), comment, would_recommend (yes/no), created_at |

### Relationships

```
Customers  (1) ──→ (N) Bookings
Services   (1) ──→ (N) Bookings
Therapists (1) ──→ (N) Bookings
Bookings   (1) ──→ (1) Feedback
```

### Airtable Views (สำคัญมาก)

**Bookings table:**
- **Today** — filter date = TODAY() sort by time (หน้าแรกเปิดทุกเช้า)
- **Tomorrow** — filter date = TOMORROW() (ใช้เตรียม)
- **This Week Calendar** — calendar view
- **No-show alerts** — filter status = "New" AND datetime < NOW() - 30 min (alert)
- **Needs feedback** — status = "Done" AND feedback_sent = false

**Customers table:**
- **VIP** — tier = VIP, sort by last_visit
- **Inactive 60+ days** — last_visit < TODAY() - 60 (ส่ง win-back)
- **Birthday this week** — MONTH(birthday) = THIS_MONTH AND DAY near

---

## Automation Flows

### Flow 1: รับ Booking จาก Form (MVP)

**Trigger:** Tally form "จองคิวนวด" submitted

```
[Tally] webhook
   ↓
[Make: Router]
   ↓
[Filter] phone valid format?
   → No: HTTP respond "กรุณาใส่เบอร์ที่ถูกต้อง"
   ↓
[Airtable] Search Customers where phone = input.phone
   ↓
[Branch]
   Found       ─→ use customer_id
   Not found   ─→ [Airtable] Create Customer (name, phone)
                  → use new customer_id
   ↓
[Airtable] Search Services where name = input.service
   ↓
[Airtable] Create Booking
   - customer_id
   - service_id
   - datetime
   - status = "New"
   - source = "Form"
   ↓
[LINE Notify] → เจ้าของ (+ therapists group)
   "มี booking ใหม่
    ลูกค้า: {customer.name} ({phone})
    บริการ: {service.name}
    เวลา: {datetime}
    สถานะ: New (รอยืนยัน)
    [ดู: airtable link]"
   ↓
[Tally] auto-reply email
   "ได้รับการจองของคุณแล้ว
    เจ้าหน้าที่จะยืนยันภายใน 30 นาที
    ถ้าเร่งด่วน โทร 02-xxx"
```

**Make ops per booking:** ~8 ops
**Estimated monthly (300 bookings):** 2,400 ops → fits Make Core plan (10K ops)

### Flow 2: Reminder 24 ชม ก่อน booking

**Trigger:** Make schedule — every 1 hour

```
[Schedule] hourly
   ↓
[Airtable] Search Bookings
   WHERE status = "Confirmed"
     AND datetime BETWEEN NOW()+23h AND NOW()+25h
     AND reminder_sent = false
   ↓
[Iterator]
   ↓
[Filter] customer.phone exists?
   → Yes: continue
   → No: mark reminder_sent = true, skip SMS
   ↓
[MessageBird] send SMS
   "คุณ{customer.nickname}
    เตือนคิวพรุ่งนี้ {time}
    บริการ: {service}
    ถ้าไม่สะดวก โทร 02-xxx
    — บ้านนวดเพลิน"
   ↓
[Airtable] update Booking.reminder_sent = true
```

**Ops:** ~5 per booking with reminder
**Monthly:** 300 × 5 = 1,500 ops

### Flow 3: No-show detection

**Trigger:** Schedule — every 15 min

```
[Schedule]
   ↓
[Airtable] Search Bookings
   WHERE status = "Confirmed"
     AND datetime < NOW() - 30 min
   ↓
[Iterator]
   ↓
[Airtable] Update Booking.status = "No-show"
   ↓
[Airtable] Update Customer.no_show_count += 1
   ↓
[LINE Notify] → เจ้าของ
   "No-show alert: {customer} ({phone})
    คิว {time} ไม่มา
    Total no-shows: {count}"
   ↓
[Filter] no_show_count ≥ 3?
   → Yes: send LINE customer
     "พบว่าคุณ no-show 3 ครั้งติดต่อกัน
      ครั้งต่อไปขอเก็บมัดจำ 50% ล่วงหน้า"
```

### Flow 4: Feedback หลัง booking เสร็จ

**Trigger:** Airtable — Booking.status changed to "Done"

```
[Airtable trigger] status = "Done"
   ↓
[Delay] 2 hours (ให้ลูกค้าพักก่อน)
   ↓
[LINE message] → customer.line_id (ถ้ามี)
   หรือ SMS ถ้าไม่มี LINE
   "ขอบคุณที่ใช้บริการค่ะ
    ช่วย rate 1-5 ดาว: https://tally.so/xxx?booking={id}"
   ↓
[Airtable] update Booking.feedback_sent = true

-- async เมื่อ Tally submit --
[Tally webhook]
   ↓
[Airtable] Create Feedback
   ↓
[Filter] rating ≤ 3?
   → Yes: [LINE Notify] → เจ้าของ "Low rating alert!"
   → No:  continue
   ↓
[Filter] rating = 5 AND would_recommend = true?
   → Yes: [LINE message] customer
     "ขอบคุณค่ะ! ถ้าแนะนำเพื่อนมา
      ได้ส่วนลด 20% ทั้ง 2 คน
      code: REFER-{customer.id}"
```

### Flow 5: Win-back inactive customer

**Trigger:** Schedule — weekly (Monday)

```
[Schedule] weekly
   ↓
[Airtable] Search Customers
   WHERE last_visit < TODAY() - 60 days
     AND total_bookings >= 3
   ↓
[Iterator] (limit 50/week)
   ↓
[LINE message] customer
   "คุณ {nickname} คิดถึงจัง
    ห่างหายไป 2 เดือนแล้ว
    กลับมาภายในสัปดาห์นี้ ลด 15%
    code: MISSU-{customer.id}"
```

---

## App Architecture Diagram

```
┌────────────────────────────────────────────────────┐
│                   ลูกค้า                             │
└──┬─────────┬────────────────────┬──────────────────┘
   │         │                    │
   │ LINE OA │ book.baan-naud.com │ phone call
   │         │                    │
   ↓         ↓                    ↓
┌──────────────────┐       ┌──────────────────┐
│   Tally Form     │       │   เจ้าของ manual    │
│   (booking)      │       │   input Airtable   │
└────────┬─────────┘       └────────┬─────────┘
         │ webhook                   │
         ↓                           │
  ┌──────────────┐                  │
  │     Make     │                  │
  │  (5 flows)   │                  │
  └──────┬───────┘                  │
         │                           │
         ↓                           ↓
  ┌──────────────────────────────────────┐
  │         Airtable Database            │
  │  Customers, Bookings, Services,      │
  │  Therapists, Feedback                │
  └──────┬───────────────────────────────┘
         │
         ├──→ LINE Notify (owner + staff)
         ├──→ MessageBird (SMS reminder)
         └──→ LINE Messaging API (customer)

เจ้าของ/therapists ─→ Airtable mobile app (back-office)
ลูกค้า (Phase 3) ─→ Softr site (my-bookings, cancel)
```

---

## Roadmap + Cost

### Phase 1: MVP (Week 1-2) — ฿700/mo
**Goal:** รับ booking ผ่าน form + notify เจ้าของ + reminder SMS
- Day 1-2: Setup Airtable workspace + 5 tables + seed services
- Day 3-4: Build Tally booking form + embed in LINE profile
- Day 5-7: Make Flow #1 + #2
- Day 8-10: Test ด้วย booking จริง 20 ครั้ง + train เจ้าของใช้ Airtable
- Day 11-14: Soft launch — ปิด booking channel อื่น

**Cost:** Airtable $10 + Make $9 + SMS ~฿100 = **~฿700**

### Phase 2: No-show + Feedback (Week 3-4) — ฿800/mo
- Build Flow #3 (no-show)
- Build Flow #4 (feedback)
- Create feedback Tally form
- Train เจ้าของ interpret feedback

**Cost:** +฿100 สำหรับ SMS feedback เพิ่ม = **~฿800**

### Phase 3: Customer Portal (Month 2) — ฿1,600/mo
- Softr site build:
  - Landing + services list + book CTA
  - Login page (OTP phone)
  - /my-bookings (history + upcoming)
  - /cancel button
- Connect Airtable data source
- Custom domain `book.baan-naud.com`

**Cost:** +Softr Basic $24 = **~฿1,600**

### Phase 4: Win-back + Loyalty (Month 3) — ฿1,800/mo
- Flow #5 (win-back)
- Birthday promo
- Loyalty points (computed field)
- Referral tracking

### Phase 5: Scale (Month 6+) — evaluate
- ถ้า booking > 1K/mo หรือ cost > ฿5K/mo
- พิจารณา migrate เป็น custom app (Next.js + Supabase)
- Est: จ้าง dev 2 เดือน = ฿120K-150K (ROI ภายใน 2-3 ปี)

---

## Risks & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Airtable data หาย | Low | High | Weekly backup Airtable CSV → Google Drive (Make automation) |
| Make ops เกิน limit | Low | Medium | Monitor ops dashboard, alert 80% |
| เจ้าของไม่ใช้ Airtable (กลับไปใช้ Excel) | Medium | High | Train 2 session + sticker ติดโน้ตบุ๊ค + WhatsApp support กลุ่ม |
| SMS ส่งไม่ถึง (number wrong) | Medium | Low | Fallback LINE message ถ้า SMS fail |
| PDPA complaint | Low | High | Privacy policy + consent checkbox ในทุก form |
| Vendor price increase | Medium | Medium | Export Airtable CSV ทุก 3 เดือน |

---

## PDPA Checklist

- [x] Consent checkbox ใน Tally: "ยินยอมให้เก็บข้อมูลเพื่อบริการนวด"
- [x] Privacy policy page ใน Softr (Phase 3)
- [x] Data retention: inactive > 3 ปี → archive (ไม่ลบทันที เพราะ tax record)
- [x] Right to access: customer ขอดูข้อมูลได้ทาง LINE
- [x] Right to deletion: SOP ลบภายใน 30 วัน ถ้าขอ
- [x] Encryption: HTTPS ทุก channel (Airtable, Tally, Softr ใช้ HTTPS default)

---

## Success Metrics (วัดใน 3 เดือน)

| Metric | Baseline | Target | How to measure |
|--------|----------|--------|----------------|
| No-show rate | 15% | 7% | Airtable filter status=No-show / total |
| Repeat customer % (within 60 days) | 35% | 50% | Count distinct customers visiting ≥ 2× |
| Avg feedback rating | — | ≥ 4.3/5 | Feedback table AVG |
| Customer lifetime value (6mo) | ฿3,200 | ฿4,500 | Sum bookings per customer |
| Time saved — owner | 0 | 10 hr/week | Self-report |
| Booking through form | 0% | 60% | Source = Form / total |

---

## Next Steps (สำหรับเจ้าของ)

### สัปดาห์นี้
1. สมัคร Airtable, Make, Tally account (ส่ง OTP ไปมือถือ)
2. เตรียม list services (ชื่อ + ราคา + เวลา)
3. เตรียม list therapist (ชื่อ + เบอร์)
4. เตรียม list ลูกค้า regular 50 คนล่าสุด (จาก Excel เก่า) → import Airtable

### สัปดาห์หน้า
1. ทำตามวีดิโอสอน Airtable (link)
2. Import ลูกค้าเก่า
3. ให้ friends ลองกรอก booking form 5 คน
4. แก้จุดที่ confuse

### เดือนหน้า
1. Soft launch — post LINE OA "จองผ่าน link นี้"
2. ปิด booking ทาง LINE 1-on-1 (redirect ไป form)
3. Review metric ครั้งแรกหลัง 30 วัน

---

*Generated by /no-code-builder — Claude Skill Unlock v1.0*
