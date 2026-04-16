---
type: nocode-blueprint
project: <ชื่อโปรเจค>
business: <ประเภทธุรกิจ>
created: YYYY-MM-DD
---

# No-Code Blueprint: <ชื่อโปรเจค>

## Business Context

| Field | Value |
|-------|-------|
| Business | <ประเภท> |
| Problem | <ปัญหาที่แก้> |
| Users | <ใครใช้, จำนวน> |
| Budget | <$/month> |
| Tech skill | Zero / Beginner / Intermediate |
| Timeline | <กี่สัปดาห์> |

---

## Tool Stack (แนะนำ)

| Layer | Tool | Why | Cost |
|-------|------|-----|------|
| Database | Airtable | Relational + view หลากหลาย | $10/mo |
| Automation | Make | Flow ซับซ้อนได้ ราคาถูก | $9/mo |
| Form | Tally | Free ไม่จำกัด | $0 |
| Customer app | Softr | Build on Airtable | $24/mo |
| Payment | Omise | Thai PromptPay support | % per tx |
| Notification | LINE Notify + MessageBird SMS | ลูกค้าไทยใช้ LINE | Free + $0.05/SMS |

**Total MVP cost:** ~$43/mo

### Alternatives considered

| Option | Pro | Con | Verdict |
|--------|-----|-----|---------|
| Notion DB + Zapier | Simpler | Limit 2K records | Skip (scale) |
| Bubble (all-in-one) | ทำได้ทุกอย่าง | Learning curve สูง | Skip (overkill) |
| Custom code (Next.js) | Scale ไม่มี limit | ต้องจ้าง dev | Phase 3 |

---

## Database Schema

### Tables

#### Customers
| Field | Type | Required | Note |
|-------|------|----------|------|
| id | Auto number | Yes | Primary |
| name | Single line text | Yes | |
| phone | Phone | Yes | Unique (auto-match) |
| email | Email | No | |
| line_id | Single line text | No | |
| created_at | Created time | Auto | |
| total_bookings | Count | Auto | Rollup จาก Bookings |
| total_spent | Currency | Auto | SUM(Bookings.total) |
| last_visit | Lookup | Auto | MAX(Bookings.date) |

#### Bookings
| Field | Type | Required | Note |
|-------|------|----------|------|
| id | Auto number | Yes | |
| customer_id | Link → Customers | Yes | |
| service_id | Link → Services | Yes | |
| datetime | Date+time | Yes | |
| status | Single select | Yes | New / Confirmed / Done / Cancelled |
| total | Currency | Auto | Formula |
| notes | Long text | No | |
| created_at | Created time | Auto | |

#### Services
| Field | Type | Required |
|-------|------|----------|
| id | Auto number | Yes |
| name | Text | Yes |
| duration_min | Number | Yes |
| price | Currency | Yes |
| active | Checkbox | Yes |

### Relationships

```
Customers (1) ─── has many ──→ (N) Bookings
Services  (1) ─── has many ──→ (N) Bookings
```

### Views

- **Bookings Today** — filter status != "Cancelled" AND date = TODAY()
- **Bookings This Week** — calendar view
- **VIP Customers** — filter total_spent > 10,000
- **Upcoming** — filter date > NOW() AND status = "Confirmed"

---

## Automation Flows

### Flow 1: รับ Booking จาก Form

**Trigger:** Tally form submitted

```
[Tally form]
  "จองคิวนวด" form submitted
      ↓
[Make: Webhook]
      ↓
[Filter] phone ถูก format?
  → Yes: go to Step 2
  → No: send error back (email reply)
      ↓
[Airtable] Search Customers where phone = input
  → Found: use existing customer
  → Not found: create new customer
      ↓
[Airtable] Create Booking
  - customer_id = customer.id
  - service_id = from form
  - datetime = from form
  - status = "New"
      ↓
[LINE Notify] → เจ้าของร้าน
  "มี booking ใหม่
   Customer: <name>
   Service: <service>
   Datetime: <datetime>
   [ดูใน Airtable]"
      ↓
[Tally] auto-reply email to customer
  "ได้รับการจองแล้ว รอยืนยันจากเจ้าของภายใน 1 ชม"
```

**Make steps:** 7 steps
**Ops/booking:** ~7 ops
**Est. monthly (100 bookings):** 700 ops

### Flow 2: Reminder 24hr ก่อน booking

**Trigger:** Schedule (every hour)

```
[Schedule] every 1 hour
      ↓
[Airtable] Search Bookings
  WHERE status = "Confirmed"
    AND datetime BETWEEN now+23h AND now+25h
    AND reminder_sent != true
      ↓
[Iterator] for each booking
      ↓
[SMS] send ถึง customer.phone
  "แจ้งเตือน: คิวนวดของคุณ <service>
   พรุ่งนี้ <time>
   ถ้าไม่สะดวก โทร 02-xxx"
      ↓
[Airtable] update Booking.reminder_sent = true
```

### Flow 3: Feedback หลัง booking เสร็จ

**Trigger:** Airtable — Booking.status changed to "Done"

```
[Airtable trigger] status = "Done"
      ↓
[Delay] 2 hours
      ↓
[LINE message] → customer
  "ขอบคุณที่ใช้บริการค่ะ
   ช่วย rate 1-5 ดาว: <link Tally>"
      ↓
[Tally] feedback form submitted
      ↓
[Airtable] create Feedback record
  + link to Booking
      ↓
[Filter] rating ≤ 3?
  → Yes: alert เจ้าของร้าน via LINE
```

---

## App Architecture

### Customer-facing (Softr)

```
Softr site: book.yourmassage.com
├── /  (landing page)
│   - Hero + services list
│   - [Book now] CTA
├── /book  (booking form — embedded Tally)
├── /my-bookings  (login required)
│   - List ของตัวเอง
│   - Cancel button
└── /login  (Softr auth — OTP via phone)
```

### Back-office (Airtable)

- เจ้าของ / พนักงาน ใช้ Airtable app โดยตรง
- Views customize ตาม role
- Mobile-friendly

### Data flow

```
┌──────────────┐
│ Customer     │ ← เข้า book.yourmassage.com
└──────┬───────┘
       │ กรอก form
       ↓
┌──────────────┐
│ Tally Form   │ ─── webhook ──→ Make
└──────────────┘
                                  │
                                  ↓
┌──────────────┐   ←────── write ─┤
│ Airtable DB  │                  │
└──────┬───────┘                  │
       │                           │
       ↓                           ↓
┌──────────────┐         ┌────────────────┐
│ Softr app    │         │ LINE + SMS     │
│ (customer)   │         │ (notification) │
└──────────────┘         └────────────────┘

เจ้าของร้าน ─→ Airtable directly
```

---

## Roadmap + Cost

### Phase 1: MVP (Week 1-2) — $20/mo
- [x] Setup Airtable (3 tables)
- [x] Sample data 10 services
- [x] Tally booking form
- [x] Make flow: Form → Airtable + LINE Notify
- **Deliverable:** รับ booking ผ่าน form + เจ้าของเห็นใน Airtable + LINE

### Phase 2: Reminder + Feedback (Week 3-4) — $25/mo
- [ ] Make flow: Reminder 24hr (SMS)
- [ ] Make flow: Feedback after "Done"
- [ ] Feedback form + Tally
- **Deliverable:** Full booking lifecycle automated

### Phase 3: Customer Portal (Month 2) — $49/mo (+$24 Softr)
- [ ] Softr site build
- [ ] Login + "My bookings" page
- [ ] Cancel booking
- **Deliverable:** ลูกค้า self-service

### Phase 4: Scale (Month 3+) — $100+/mo
- [ ] Payment integration (Omise)
- [ ] Loyalty program (points)
- [ ] Multi-branch support
- [ ] Staff scheduling

### Phase 5: Migrate to custom (เมื่อ $300+/mo หรือ user > 5K)
- Next.js + Postgres + SendGrid
- Estimate: จ้าง dev 2 เดือน = ฿80K-150K

---

## Risks & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Airtable ข้อมูลหาย | Low | High | Backup รายสัปดาห์ไป Google Drive (Make) |
| Vendor lock-in Airtable | Medium | Medium | Export CSV ทุก 3 เดือน |
| Make cost พุ่ง | Medium | Low | Monitor ops ทุกเดือน alert ถ้า > 80% |
| PDPA compliance | Medium | High | Privacy policy + consent form + data deletion SOP |
| LINE API เปลี่ยน | Low | Medium | Fallback SMS ได้ |

---

## PDPA Checklist

- [ ] Consent checkbox ใน form ("ยินยอมให้เก็บข้อมูล")
- [ ] Privacy policy page
- [ ] Data retention (ลบข้อมูลลูกค้า inactive > 2 ปี)
- [ ] Right to access (customer ขอดูข้อมูลได้)
- [ ] Right to deletion (SOP การลบ)
- [ ] Encrypt data in transit (HTTPS)

---

## Next Steps

1. **Week 1:**
   - Setup Airtable workspace
   - Create 3 tables + sample data
   - Build Tally form
2. **Week 2:**
   - Build Make flow #1 (booking)
   - Test end-to-end 10 bookings
   - Go-live soft launch
3. **Week 3-4:**
   - Build Make flow #2 + #3
   - Create feedback form
4. **Month 2:**
   - Build Softr customer portal
   - Invite first 20 regular customers

---

*Generated by /no-code-builder — Claude Skill Unlock v1.0*
