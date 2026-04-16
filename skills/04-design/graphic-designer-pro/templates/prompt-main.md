# Graphic Design Prompt Formula

> สูตรเขียน Midjourney / DALL-E / Flux prompt สำหรับงานกราฟิกที่ได้ภาพสวยพร้อมใช้

---

## Universal Formula

```
[SUBJECT + DETAIL], [STYLE/MEDIUM], [COMPOSITION],
[LIGHTING + MOOD], [COLOR PALETTE with HEX/names],
[TEXTURE + MATERIAL], [REFERENCE STYLE or ARTIST],
[TECHNICAL PARAMS]
```

ตัวอย่าง param สำคัญ:
- `--ar 1:1` (square, logo/IG post)
- `--ar 16:9` (banner, hero, cover)
- `--ar 9:16` (story, Reels)
- `--ar 4:5` (IG feed portrait)
- `--ar 2:3` (poster, A4-ish)
- `--v 6` (Midjourney v6 — default สำหรับปี 2026)
- `--style raw` (ลด AI-ish feel, realistic กว่า)
- `--style expressive` (creative, painterly)
- `--stylize 250` (ค่า style strength, default 100)
- `--niji 6` (สำหรับ anime/illustration)

---

## Recipe by Design Type

### 🔤 Logo

```
Minimalist logo design for [BRAND NAME], [CONCEPT/SYMBOL],
[STYLE: geometric/organic/hand-drawn/calligraphic],
[COLOR: 2 colors max with HEX],
flat vector illustration, centered composition,
white background, high contrast, clean lines,
professional branding, award-winning logo design,
--ar 1:1 --v 6 --style raw --stylize 150
```

**Example:**
```
Minimalist logo design for "Kaffa Origin" coffee brand,
abstract coffee bean merged with mountain silhouette,
organic hand-drawn style with precise geometric lines,
earth tone palette (#3A2E1F deep brown + #D4A574 warm tan),
flat vector illustration on cream background (#F5EFE6),
centered composition with 30% negative space,
premium artisan coffee branding, Japanese design sensibility,
--ar 1:1 --v 6 --style raw --stylize 100
```

**Tips โลโก้:**
- ใช้ `flat vector illustration` เสมอ (กัน 3D/photo-realistic)
- ใส่ `white background` หรือ `transparent` เพื่อแยก subject
- ลิมิตสี 2-3 สีเท่านั้น
- `--stylize` ต่ำ (50-150) = clean, สูง = creative แต่ยาก reproduce

---

### 📌 Poster

```
Editorial poster design for [EVENT/BRAND],
[HERO ELEMENT: portrait/object/illustration],
[TYPOGRAPHY style: bold sans-serif / serif / display],
[LAYOUT: Swiss grid / asymmetric / centered],
[COLOR: 3-color palette with HEX],
[MOOD: tension / calm / energetic],
high contrast, gallery print quality, Pentagram style,
--ar 2:3 --v 6 --style raw
```

**Example:**
```
Editorial poster for jazz festival "Midnight Brass 2026",
silhouette of trumpet player against full moon,
bold condensed sans-serif typography "MIDNIGHT BRASS",
Swiss grid layout with asymmetric text placement,
deep navy (#0A1628) + gold (#D4A017) + cream (#F2E8D5),
moody atmospheric lighting, film grain texture,
inspired by Paula Scher and Saul Bass posters,
--ar 2:3 --v 6 --style raw
```

---

### 📊 Infographic

```
Clean infographic design about [TOPIC],
[NUMBER] step/item vertical flow with icons,
flat illustration style, modern vector graphics,
[COLOR: 3-4 palette with HEX],
isometric or flat icons, clear hierarchy,
ample white space, data visualization,
similar to Information is Beautiful style,
--ar 9:16 --v 6 --style raw
```

---

### 📱 Social Media Post (IG/FB feed)

```
Instagram feed post for [BRAND/TOPIC],
[HERO: product / typography / pattern],
[STYLE: minimal editorial / bold pop / soft pastel],
[COLOR: cohesive palette matching brand],
text placement in upper third with breathing room,
high engagement visual, scroll-stopping composition,
--ar 1:1 --v 6 --style raw
```

**Story/Reels (9:16):**
```
Vertical story format for [BRAND],
[VISUAL], text overlay space in middle third,
safe zones top/bottom 250px for UI,
--ar 9:16 --v 6 --style raw
```

---

### 🏷️ Web Hero / Banner

```
Website hero banner for [BRAND],
[HERO visual: product mockup / lifestyle / abstract],
left-aligned composition with 40% negative space on right for text,
[BRAND color palette],
cinematic depth of field, award-winning web design,
Awwwards featured quality,
--ar 16:9 --v 6 --style raw
```

---

## Color Palette Prompt Tricks

### วิธี 1: ใส่ HEX ตรงๆ
```
color palette: #3A2E1F, #D4A574, #F5EFE6
```

### วิธี 2: ใส่ชื่อสี + mood
```
earth tone palette: warm terracotta, sand beige, cream white
```

### วิธี 3: Reference วัฒนธรรม/สไตล์
```
Wes Anderson color palette
Japanese wabi-sabi tones
Bauhaus primary colors
1970s retro California
```

### วิธี 4: Photography mood
```
golden hour warm tones
overcast desaturated palette
neon cyberpunk (magenta + cyan)
```

---

## Style References (ใส่ในยุคท้าย prompt)

| Style | Keyword |
|-------|---------|
| Minimal editorial | `Kinfolk magazine style`, `Japandi aesthetic` |
| Maximalist | `Memphis design`, `90s MTV graphics` |
| Luxury | `Vogue editorial`, `Hermes branding` |
| Tech modern | `Linear.app aesthetic`, `Stripe illustrations` |
| Hand-crafted | `risograph print`, `letterpress texture` |
| Vintage | `mid-century modern`, `70s travel poster` |
| Bold pop | `Pop Art`, `Andy Warhol style` |
| Organic | `Art Nouveau`, `Alphonse Mucha` |

---

## 3-Variant Strategy

ทุกโปรเจค ต้องสร้าง 3 versions ให้เลือก:

### Variant A — Safe (80% ตรง brief)
- Style หลัก, composition มาตรฐาน
- ลูกค้ารับได้ 90% ของเวลา

### Variant B — Bold (push brief 20%)
- Same tone, composition creative กว่า
- Typography หรือ color experiment

### Variant C — Wildcard (different direction)
- เปลี่ยนมุมมอง (เช่น จาก illustration → photography mock)
- Surprise factor สำหรับลูกค้า open-minded

---

## Don'ts

❌ `a beautiful logo` (generic เกินไป — AI มั่ว)
❌ ใส่ brand name ตัวอักษร (Midjourney สะกดผิด — ใช้ Ideogram/DALL-E แทน)
❌ ขอให้ AI วาด text ยาวๆ (ยังไม่เสถียร)
❌ Prompt > 100 คำ (AI ให้ความสำคัญ 60 คำแรก)
❌ Contradictory terms ("minimal but maximalist")
❌ ใส่ลิขสิทธิ์ ("Nike swoosh style")

---

## Tools Recommendation

- **Midjourney v6** — Best for illustration, poster, mood
- **DALL-E 3** (ChatGPT) — Best for text rendering
- **Ideogram** — Best for typography/logo text
- **Flux Pro** (via Freepik/Fal) — Best photo-realistic
- **Leonardo.ai** — Best for game/fantasy art

เลือกเครื่องมือตาม use case — อย่าใช้ตัวเดียวตลอด
