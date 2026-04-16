# Prompt Main — No-Code Builder

## Tool Selection Matrix

### Database / Spreadsheet

| Tool | Best for | Price (start) | Thai | Limit |
|------|----------|---------------|------|-------|
| **Google Sheets** | ทีมเล็ก, ข้อมูลง่าย | Free | Great | 10M cells |
| **Airtable** | Relational DB + view หลากหลาย | $10/user/mo | Ok | 50K records (free 1K) |
| **Notion DB** | รวม doc + DB | Free / $10 | Good | 2K DB entries ทั่วโลกใน workspace |
| **Baserow / NocoDB** | Self-host, unlimited | Free (self-host) | Good | No limit |

**เลือกเมื่อไหร่:**
- ข้อมูลแบน (1 table): Sheets
- ต้อง relate หลาย table: Airtable
- เน้น content/doc + DB: Notion
- ไม่อยากติด vendor: Baserow

### Automation

| Tool | Best for | Price | Learning curve |
|------|----------|-------|----------------|
| **Zapier** | Trigger-action ง่าย | $20/mo (100 tasks) | ต่ำ |
| **Make** | Multi-step, branching, loop | $9/mo (10K ops) | กลาง |
| **n8n** | Self-host, code+no-code | Free (self-host) | สูง |
| **Pipedream** | Dev-friendly, cheap | Free tier ใหญ่ | กลาง |

**เลือกเมื่อไหร่:**
- 1 trigger → 1-3 action: Zapier
- Flow ซับซ้อน + loop: Make
- Tech team, อยาก self-host: n8n

### App Builder (Frontend)

| Tool | Best for | Price | Backend |
|------|----------|-------|---------|
| **Softr** | Web app on Airtable | $24/mo | Airtable |
| **Glide** | Mobile app on sheet | $30/mo | Sheets/Airtable |
| **Bubble** | Complex web app | $32/mo | Built-in DB |
| **FlutterFlow** | Native mobile | $30/mo | Firebase |
| **Adalo** | Simple mobile | $36/mo | Built-in |

**เลือกเมื่อไหร่:**
- Internal tool บน Airtable: Softr
- Mobile app จาก spreadsheet: Glide
- Full custom web app: Bubble
- Native mobile ใน store: FlutterFlow

### Form / Survey

| Tool | Best for | Price |
|------|----------|-------|
| **Tally** | Unlimited free, beautiful | Free (unlimited!) |
| **Typeform** | Conversational, brand-heavy | $29/mo |
| **Google Forms** | Simple + integrate workspace | Free |
| **Jotform** | Complex logic, payment | $34/mo |

## Schema Design Principles

### 1. Think relational (แม้ไม่ใช่ SQL)
- แต่ละ entity = 1 table
- Relate ด้วย link field
- ไม่ซ้อน data ใน field เดียว

**Bad:**
```
Bookings table:
- customer (text: "John, john@...")  <- ข้อมูล 2 field ใน 1
- services (text: "massage x2, facial x1")  <- list in string
```

**Good:**
```
Bookings:
- id
- customer_id → Customers
- total_price
- BookingItems (1-to-many):
  - id
  - booking_id
  - service_id → Services
  - qty
  - price
```

### 2. Normalization (ระวัง over-normalize)
- Normalize ถ้า: ข้อมูลซ้ำ > 3 แถว
- ไม่ normalize ถ้า: ข้อมูลเกือบไม่เปลี่ยน + ใช้ไม่บ่อย

### 3. Use enum (single select) แทน free text
```
status: ["New", "Confirmed", "Done", "Cancelled"]
```
- Filter ง่าย
- Consistent
- Report งาน

### 4. Audit fields ทุก table
- created_at (auto)
- updated_at (auto)
- created_by (collaborator)

### 5. Computed fields
- Total = SUM(BookingItems.price × qty)
- Customer lifetime value = SUM of all bookings
- Days since last visit = TODAY() - last_booking

## Automation Design Principles

### 1. Idempotent
- Run ซ้ำ 2 ครั้ง → result เหมือน 1 ครั้ง
- เช็ค "already exists" ก่อน create

### 2. Error handling
- ทุก step ที่เรียก external → ต้องมี error branch
- Log error → Slack/email

### 3. Rate limit aware
- Zapier free = 100 tasks/mo
- Airtable API = 5 req/sec
- Don't hammer API in loop

### 4. Test with real data
- สร้าง test data ก่อน deploy
- Run flow end-to-end ก่อน turn on

## PDPA / Data Privacy (ไทย)

- ข้อมูลลูกค้า → ต้อง consent ก่อน
- เก็บเฉพาะที่จำเป็น
- ไม่ share ข้าม tool โดยไม่ encrypt
- Backup ควรอยู่ในไทยหรือ region ที่ compliant
- Delete on request ได้ (right to be forgotten)

## Cost Estimation Framework

### Tier 1: MVP (0-100 users, 0-1K records)
- Database: Airtable Free / Sheets Free
- Automation: Make Core ($9/mo)
- Form: Tally Free
- **Total: $9-20/mo**

### Tier 2: Growing (100-1K users, 1K-10K records)
- Database: Airtable Team ($20/user/mo)
- Automation: Make Pro ($16/mo)
- Frontend: Softr Basic ($24/mo)
- **Total: $60-100/mo**

### Tier 3: Scale (1K+ users, 10K+ records)
- Database: Airtable Business ($45/user/mo)
- Automation: Make Enterprise
- Custom development ทดแทน
- **Total: $200-500/mo** (พิจารณา migrate เป็น custom code)

**Rule of thumb:** เมื่อ cost > $300/mo หรือ user > 5K — พิจารณา migrate เป็น custom code
