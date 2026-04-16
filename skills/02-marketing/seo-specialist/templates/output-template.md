---
type: seo-content-brief
topic: <หัวข้อ>
page_type: <article/landing/product>
primary_keyword: <...>
target_word_count: <...>
search_intent: <info/nav/trans/commercial>
created: YYYY-MM-DD
status: draft
---

# 🔍 SEO Brief: <หัวข้อ>

## 📊 Overview

| Field | Value |
|-------|-------|
| Primary keyword | `<...>` |
| Search intent | <...> |
| Page type | <...> |
| Target audience | <...> |
| Word count | <...> |
| Business goal | <...> |

---

## 🔑 Keyword Research

### 🎯 Primary Keyword

| Keyword | Volume/เดือน | Difficulty | CPC | Intent |
|---------|--------------|-----------|-----|--------|
| `<primary>` | X | X/100 | X บาท | <intent> |

### 🌿 LSI (Secondary) Keywords

| Keyword | Volume | Usage |
|---------|--------|-------|
| `<lsi 1>` | X | ใน H2/body |
| `<lsi 2>` | X | ใน H3 |
| ... | | |

### 🌾 Long-tail Keywords (10-20)

1. `<long-tail 1>` — X vol
2. `<long-tail 2>` — X vol
3. ...

### ❓ Question Keywords (People Also Ask)

1. <คำถาม 1>
2. <คำถาม 2>
3. ...

### 🏆 Top 5 Competitor Analysis

| Rank | URL | Title | Word count | จุดเด่น | จุดอ่อน |
|------|-----|-------|------------|--------|---------|
| 1 | ... | ... | X | ... | ... |
| 2 | ... | ... | X | ... | ... |

**Content gap:** <อะไรที่ top 5 ยังไม่ครอบคลุม>

---

## 📝 Content Outline

### H1 Options (3 ตัวเลือก)

1. `<title 1>` (X char) — มี primary keyword ที่ตำแหน่ง N
2. `<title 2>` (X char)
3. `<title 3>` (X char)

**แนะนำ:** #1 — เหตุผล: <...>

### Structure

```
H1: <title>

[Introduction] (150-200 คำ)
- Hook
- Promise
- Summary of what reader will learn
- Keyword mention ใน first 100 words

H2: <section 1> (300-500 คำ)
  [Purpose: ตอบ <คำถาม>]
  [Keywords: <primary>, <lsi>]
  [Visual: <idea>]
  [Internal link: <anchor> → <URL>]
  H3: <subsection>
  H3: <subsection>

H2: <section 2>
  ...

H2: <section 3>
  ...

H2: FAQ (ใช้ PAA จริงจาก Google)
  H3: <คำถาม 1>?
  H3: <คำถาม 2>?
  ...

H2: บทสรุป + CTA

[Author bio + published date]
```

### Section Details

#### H2: <Section 1>

- **Purpose:** <ตอบอะไร>
- **Target keyword:** `<keyword>`
- **Word count:** 300-500 คำ
- **Must include:**
  - <point 1>
  - <point 2>
- **Visual:** <image/infographic/video>
- **Internal link:** <anchor text> → `<URL>`
- **External link:** <source>

(ทำซ้ำทุก H2)

---

## ✅ On-Page SEO Checklist

### 🔧 Technical
- [ ] URL slug: `/<slug>` (≤ 5 คำ)
- [ ] HTTPS ทำงาน
- [ ] Mobile-friendly test ผ่าน
- [ ] LCP < 2.5s, CLS < 0.1, INP < 200ms
- [ ] Canonical tag ถูกต้อง

### 🏷️ Meta
- [ ] Title tag: `<title>` (X char, มี keyword)
- [ ] Meta description: `<desc>` (X char)
- [ ] Open Graph image 1200×630 px
- [ ] JSON-LD schema: Article + FAQPage

### 📝 Content
- [ ] H1 = title (1 ครั้งเท่านั้น)
- [ ] H2 ≥ 3 sections
- [ ] Primary keyword density 0.8-1.5%
- [ ] Keyword ใน first 100 words
- [ ] Keyword ใน URL + H1 + first H2
- [ ] LSI keyword แทรก ≥ 5 คำ
- [ ] Internal link ≥ 3 (anchor หลากหลาย)
- [ ] External link ≥ 1 (DA 40+)
- [ ] Image: ≥ 3 รูป + alt text มี keyword (ไม่ซ้ำทุกรูป)
- [ ] Image: compressed < 150KB

### ⭐ E-E-A-T
- [ ] Author bio + link LinkedIn/profile
- [ ] Published + Updated date
- [ ] Real experience (screenshot / photo / test data)
- [ ] Primary source cite ≥ 2

---

## 🏷️ Meta Tags (Ready to copy)

### HTML Head

```html
<title><primary keyword> | <brand></title>
<meta name="description" content="<150-160 char with CTA>">
<link rel="canonical" href="https://example.com/<slug>">

<!-- Open Graph -->
<meta property="og:title" content="<title>">
<meta property="og:description" content="<description>">
<meta property="og:image" content="https://example.com/og-image.jpg">
<meta property="og:url" content="https://example.com/<slug>">
<meta property="og:type" content="article">
<meta property="og:locale" content="th_TH">

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="<title>">
<meta name="twitter:description" content="<description>">
<meta name="twitter:image" content="https://example.com/og-image.jpg">
```

### JSON-LD Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "<title>",
  "description": "<description>",
  "image": "https://example.com/hero.jpg",
  "author": {
    "@type": "Person",
    "name": "<author>",
    "url": "https://example.com/about"
  },
  "publisher": {
    "@type": "Organization",
    "name": "<brand>",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  },
  "datePublished": "YYYY-MM-DD",
  "dateModified": "YYYY-MM-DD",
  "mainEntityOfPage": "https://example.com/<slug>"
}
```

### FAQPage Schema (ถ้ามี FAQ)

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "<คำถาม 1>?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<คำตอบ>"
      }
    }
  ]
}
```

---

## 🔗 Backlink Strategy

### Target Sites (DA 30+)

| Site | DA | Topic match | Angle | Contact |
|------|-----|-------------|-------|---------|
| <site1> | 55 | ตรง niche | Guest post | editor@ |
| <site2> | 48 | related | Resource list | form |
| <site3> | 40 | vertical | HARO | haro |

### Pitch Email Template

```
Subject: <angle> — <your brand>

สวัสดีคุณ <name>,

ชอบบทความ "<title>" ของคุณมาก — โดยเฉพาะส่วน <specific>

ผม/ดิฉันเขียนเรื่อง <topic> ที่ <your value>
คิดว่าน่าจะเป็น resource ที่ดีให้ผู้อ่านคุณ:
<URL>

ถ้าสนใจ — ยินดี:
- เขียน guest post 1500 คำเกี่ยวกับ <topic>
- ให้ quote จากประสบการณ์ <X ปี>
- Share บทความทาง social ถ้า mention

รอคำตอบนะคะ/ครับ
<signature>
```

---

## 📋 Writer Handoff Checklist

- [ ] Primary keyword แม่น (intent match)
- [ ] LSI + long-tail list ส่งให้ writer
- [ ] Outline H1-H3 ครบ + word count ต่อ section
- [ ] Image list + alt text + source
- [ ] Internal link list (anchor + target URL)
- [ ] Reference/source list
- [ ] Author info + published date
- [ ] Meta tags + OG image ready

---

*Generated by /seo-specialist — Claude Skill Unlock v1.0*
