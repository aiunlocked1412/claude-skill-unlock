# SEO Specialist — Prompt Recipes

## Recipe 1: Full SEO Content Brief

```
/seo-specialist <หัวข้อบทความ>
Primary keyword (ถ้ามี): <...>
Page type: บทความ / landing / product
Audience: <...>
Goal: <info/lead/sale>
Competitor URLs (optional): <list>
```

## Recipe 2: Keyword Research เฉพาะ

```
/seo-specialist keyword "<หัวข้อ>"
Intent ที่อยากได้: informational / commercial
Location: ไทย / international
Seed keyword: <list>
```

## Recipe 3: Content Outline

```
/seo-specialist outline
Primary keyword: <...>
Target word count: <...>
Audience level: มือใหม่ / กลาง / มือโปร
```

## Recipe 4: On-Page Audit

```
/seo-specialist audit <URL>
Primary keyword: <...>
```

## Recipe 5: Meta Tags

```
/seo-specialist meta
Page: <URL or topic>
Primary keyword: <...>
CTA: <...>
```

## Search Intent 4 ประเภท

| Intent | ผู้ใช้ต้องการ | Keyword pattern | Page type |
|--------|--------------|-----------------|-----------|
| **Informational** | เรียนรู้ | "วิธี...", "คืออะไร", "ยังไง" | Blog article, guide |
| **Navigational** | ไปยังเว็บ/แบรนด์ | "<brand> login", "เว็บ..." | Homepage, landing |
| **Transactional** | ซื้อ/ทำ action | "ซื้อ...", "สมัคร...", "จอง..." | Product, checkout |
| **Commercial** | เปรียบเทียบก่อนซื้อ | "รีวิว...", "เทียบ...", "ดีไหม", "ที่ดีที่สุด" | Review, comparison |

## Keyword Modifier (ไทย 2026)

### Informational
- วิธี, ยังไง, เทคนิค, สูตร, step, how to
- คืออะไร, แปลว่า, หมายถึง, meaning
- สาเหตุ, ทำไม, เพราะอะไร

### Commercial
- รีวิว, review, ใช้ดีไหม, คุ้มไหม
- เปรียบเทียบ, vs, เทียบ, ที่ดีที่สุด
- pantip, เสียงจริง, ของจริง
- ราคา, ส่วนลด, โปร

### Transactional
- ซื้อ, สั่ง, จอง, สมัคร
- ส่วนลด, คูปอง, โค้ด
- ใกล้ฉัน, near me, delivery

### Local
- <ชื่อเมือง>, <ย่าน>, ใกล้ <...>

## E-E-A-T Checklist

### Experience (ใหม่ใน 2022+)
- [ ] เขียนจากประสบการณ์จริง (มีรูป/วิดีโอ/screenshot)
- [ ] พูดถึงข้อเสีย/ข้อจำกัด ไม่ใช่แค่ข้อดี
- [ ] ระบุระยะเวลาใช้จริง

### Expertise
- [ ] Author มี credential ชัด
- [ ] อ้างอิงข้อมูลเฉพาะทาง
- [ ] ใช้ศัพท์ถูกต้อง

### Authoritativeness
- [ ] แบรนด์/เว็บมี About page ชัด
- [ ] Contact info ครบ
- [ ] External link ไป primary source

### Trustworthiness
- [ ] HTTPS
- [ ] Privacy policy + ToS
- [ ] Review/Testimonial จริง
- [ ] ถ้า YMYL (Your Money Your Life) — ต้องเข้ม extra

## Core Web Vitals Target (2026)

| Metric | Good | Needs improve | Poor |
|--------|------|---------------|------|
| LCP | < 2.5s | 2.5-4s | > 4s |
| INP (แทน FID) | < 200ms | 200-500ms | > 500ms |
| CLS | < 0.1 | 0.1-0.25 | > 0.25 |

## Schema Markup ที่ใช้บ่อย

- **Article** — บทความ blog
- **Product** — product page
- **Review** — รีวิว
- **FAQPage** — FAQ section
- **BreadcrumbList** — navigation
- **LocalBusiness** — ร้านที่มีหน้าร้าน
- **HowTo** — บทความสอนทำ
- **Recipe** — สูตรอาหาร
