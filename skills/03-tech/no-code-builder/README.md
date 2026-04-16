# No-Code Builder

> AI No-Code Architect — tool recommendation + schema + automation — build ธุรกิจโดยไม่ต้องเขียนโค้ด

## ใช้ยังไง

```
/no-code-builder
```

## ทำอะไรได้บ้าง

- แนะนำ no-code tool ที่ถูกงาน (เปรียบเทียบ 2-3 ตัว + เหตุผล)
- Database schema design (table, field, relationship)
- Automation flow (Zapier / Make / n8n step-by-step)
- App architecture (frontend + backend + auth)
- Cost estimate + scale roadmap
- Risk assessment (vendor lock-in, data loss, PDPA)

## Tools ที่รองรับ

**Database:** Airtable, Notion, Google Sheets, Baserow, NocoDB
**Automation:** Zapier, Make (Integromat), n8n, Pipedream
**App builder:** Bubble, Glide, Softr, FlutterFlow, Adalo
**Workflow:** Notion, ClickUp, Monday
**Form:** Tally, Typeform, Google Forms, Jotform
**Website:** Webflow, Framer, Carrd
**Email:** Mailchimp, ConvertKit, Beehiiv

## Use cases

- CRM สำหรับ SME (ร้านนวด, คลินิก, freelance)
- Inventory ของร้านออนไลน์
- Internal dashboard สำหรับทีมเล็ก
- Booking/appointment system
- Feedback/survey automation
- Newsletter + community management
- E-commerce minimal (without Shopify)

## ไฟล์ใน skill นี้

```
no-code-builder/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md        # tool selection matrix + schema principles
│   └── output-template.md
└── examples/
    └── example-output.md     # CRM ร้านนวด full blueprint
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — สร้าง CRM ร้านนวด รับ booking + reminder + feedback ครบชุด

## Tips

- บอก budget ต่อเดือนให้ชัด — AI จะเลือก tier ที่เหมาะ
- บอก tech skill ตรงๆ (zero / beginner / intermediate)
- บอกจำนวน user + record ที่คาด scale

## Skills ที่ใช้คู่กัน

- `/data-analyst-pro` — วิเคราะห์ข้อมูลจาก database no-code
- `/web-designer-pro` — ออกแบบ UI ของ Softr/Bubble page
- `/programmer-pro` — เพิ่ม custom code ถ้า no-code ไม่พอ
