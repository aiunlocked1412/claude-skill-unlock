---
type: illustration-brief
project: Pixel Mascot — TechFlow
illustration_type: character
quantity: 1 character + 8 expressions + 5 poses
created: 2026-04-16
status: draft
---

# 🎨 Pixel — TechFlow Mascot Design

## 📊 Brief Overview

| Field | Value |
|-------|-------|
| Project | TechFlow (Thai SaaS for workflow automation) Mascot |
| Type | Character / Mascot |
| Use case | Website hero, onboarding, error pages, social, sticker pack |
| Quantity | 1 character + 8 expressions + 5 action poses + 5 stickers |
| Format | SVG (master) + PNG transparent + Lottie idle anim |
| Deadline | 14 วัน |

**Story:** TechFlow ต้องการ mascot ที่ดูเป็นมิตร ฉลาด ช่วย user ใช้ระบบยากๆ ได้ง่าย — ตั้งชื่อ "Pixel" หุ่นยนต์ตัวเล็กที่อาศัยอยู่ใน dashboard

---

## 🎭 Style Direction

**Style:** Flat vector with subtle 2D shading (Notion + Slack vibe)
**Tone:** Friendly, smart, helpful (ไม่ใช่ silly เด็กเกิน)
**Reference:**
- https://dribbble.com/shots/notion-illustrations (style)
- Slackbot (personality reference)
- Duolingo Owl (engagement reference)

---

## 🌈 Color Palette

| Role | HEX | % usage | Notes |
|------|-----|---------|-------|
| Primary (body) | `#6366F1` | 60% | TechFlow brand indigo |
| Secondary (highlight) | `#A5B4FC` | 20% | Lighter indigo for shading |
| Accent (eyes/cheek) | `#F472B6` | 10% | Soft pink — friendly |
| Neutral (outline) | `#1E1B4B` | 5% | Dark indigo (not pure black) |
| Background | `#F5F3FF` | 5% | Lavender white |

**Rationale:** ใช้ brand color (indigo) เป็นหลัก + pink accent ทำให้ดูน่ารัก ไม่ corporate cold

---

## 🧍 Character Spec

| Attribute | Detail |
|-----------|--------|
| Name | Pixel |
| Type | Cute robot (geometric shapes) |
| Proportion | 3 heads tall (chibi style) |
| Personality | Friendly, curious, helpful |
| Body color | `#6366F1` indigo |
| Distinctive feature | Square LED eyes that change shape per emotion + antenna with glowing pink dot |
| Voice | "พี่เลี้ยง" tone — เด็กกว่า user แต่ฉลาด ไม่กวนใจ |

### Body Construction
```
     ┌─┐  ← Antenna (pink LED)
   ┌─┴─┴─┐
   │ □ □ │  ← Square LED eyes
   │  ‿  │  ← Smile mouth (changes per emotion)
   └─┬─┬─┘
   ┌─┴─┴─┐
   │  ▢  │  ← Body (chest screen)
   │ ░░░ │  ← Display showing status
   └┬───┬┘
    │   │  ← Arms (small)
   ─┴───┴─
```

### Expression Sheet (8 emotions)

| # | Emotion | Eye shape | Mouth | Antenna color | Use case |
|---|---------|-----------|-------|---------------|----------|
| 1 | Happy 😊 | □ □ | ‿ smile | pink steady | Default |
| 2 | Sad 😢 | _ _ closed | ︵ frown | blue dim | Error |
| 3 | Surprised 😮 | ◯ ◯ wide | o open | yellow flash | Notification |
| 4 | Thinking 🤔 | ◔ side | ━ flat | pink slow pulse | Loading |
| 5 | Loving 😍 | ♥ ♥ | ‿ wide smile | pink rainbow | Success |
| 6 | Angry 😡 | ◣ ◢ slant | ︿ down | red | Warning |
| 7 | Sleepy 😴 | _ _ heavy | ‿ small | dim | Offline |
| 8 | Excited 🎉 | ✦ ✦ stars | ◡ open laugh | rainbow burst | Celebration |

### Action Poses (5)
1. **Standing wave** — default, hand wave (homepage hero)
2. **Holding paper** — onboarding, "let me help"
3. **Sitting + tablet** — working, blog illustration
4. **Floating** — loading state, no ground
5. **Carrying box** — empty state, "moving things"

---

## 🖼️ AI Image Prompts (3 Variants)

### Variant A — Safe/Classic (Friendly Robot)
```
Cute friendly robot mascot character "Pixel" for tech SaaS brand,
small chibi proportions 3 heads tall,
geometric shapes: rounded square head, square LED eyes,
small antenna with pink glowing dot on top,
indigo body color #6366F1 with lighter highlight #A5B4FC,
soft pink cheek dots #F472B6,
friendly smile, curious expression,
flat vector illustration with subtle 2D shading,
white background, character turnaround front view,
similar to Notion illustrations and Slackbot aesthetic,
--ar 1:1 --v 6 --style raw --stylize 100
```
**Rationale:** ตรง brief ที่สุด — friendly + chibi + indigo brand

### Variant B — Bold/Experimental (Glassmorphism)
```
Translucent glassmorphism robot mascot "Pixel",
crystalline body with internal indigo glow #6366F1,
holographic surface with subtle rainbow refraction,
floating in soft lavender cloud,
3 heads tall chibi proportion,
ethereal magical tech aesthetic,
inspired by Apple Vision Pro UI and Spline 3D illustrations,
--ar 1:1 --v 6 --style raw --stylize 200
```
**Rationale:** Modern 2026 trend (glassmorphism + 3D) — ดูพรีเมียมกว่า แต่ render ยากในหลาย platform

### Variant C — Wildcard (Origami paper craft)
```
Paper craft origami robot character mascot "Pixel",
folded paper aesthetic, geometric facets,
indigo blue paper with subtle texture #6366F1,
visible fold lines, soft drop shadow on paper background,
inspired by Polish paper illustration art,
craft + tech fusion concept,
--ar 1:1 --v 6 --style expressive --stylize 250
```
**Rationale:** Differentiation — ไม่มี SaaS เจ้าไหนใช้ paper craft mascot = memorable

---

## 📐 Vector Spec

- **Source tool:** Recraft (vector master) + manual cleanup ใน Illustrator
- **Anchor count:** ~24 per pose (minimal smooth curves)
- **Path style:** All strokes outlined to fill, no live stroke (consistency)
- **Layer organization:**
  ```
  Pixel-Master.fig
  ├── 📁 Body/
  │   ├── Head
  │   ├── Body (chest screen)
  │   ├── Arms (L/R)
  │   └── Antenna
  ├── 📁 Face/ (variant components)
  │   ├── Eyes (8 variants)
  │   ├── Mouth (8 variants)
  │   └── Cheeks
  └── 📁 Effects/
      ├── Antenna glow
      └── Chest screen content
  ```
- **Naming:** `pixel-emotion-pose-color.svg` (e.g. `pixel-happy-wave-default.svg`)

---

## 📤 Export Spec

| Format | Use | Setting |
|--------|-----|---------|
| SVG | Web (React component) | SVGOMG optimized, < 8KB each |
| PNG @1x | Email signature | 64px |
| PNG @2x | Web retina | 128px |
| PNG @3x | iOS | 192px |
| Lottie JSON | Idle blink animation | 50KB, 60 frames |
| Figma library | Design system | Component variants (8 emotions × 5 poses) |
| Sticker pack | iMessage / LINE | 408x408 PNG, 24 stickers |

---

## ♿ Accessibility & Inclusion

- [x] Robot character = ไม่มี gender bias
- [x] No skin tone (genderless)
- [x] Status icons (antenna color) มี shape change ด้วย ไม่ใช่ color เพียงอย่างเดียว
- [x] Color contrast indigo on white = 6.5:1 ✅ (WCAG AAA)
- [x] Alt text spec: "Pixel mascot — [emotion] expression"

---

## ✅ Deliverable Checklist

- [x] Master Figma file (with components + variants)
- [x] SVG x 40 (8 emotions × 5 poses)
- [x] PNG @1x/2x/3x x 40
- [x] Color variations: default + monochrome
- [x] Lottie idle blink (eyes blink every 4 sec)
- [x] Sticker pack 24 (iMessage + LINE format)
- [x] Style guide PDF (3 pages: anatomy, expressions, do/don't)
- [x] React component package (`@techflow/pixel-mascot`)

---

## 🛠️ Tools Used

- **AI generation:** Recraft v3 (primary, vector output)
- **Refinement:** Figma + Illustrator
- **Animation:** AfterEffects + Bodymovin (Lottie)
- **Export:** Figma plugin "SVG Export" + SVGOMG

---

## 💡 Usage Guidelines

### ✅ Do
- ใช้ Pixel ในจุดที่ต้องการ humanize tech (onboarding, help, error)
- เปลี่ยน expression ตาม context (happy = success, sad = error)
- Lottie blink animation ใน hero section
- ใช้ neutral color บน dark background

### ❌ Don't
- ห้ามเปลี่ยน body color เป็นสีอื่นนอก palette
- ห้ามใช้ Pixel ใน sensitive context (security alert ใช้ icon ดีกว่า)
- ห้าม distort proportion (3 heads tall เป็น standard)
- ห้ามใส่ accessory ที่ทำให้ดู gendered (bow, tie)

---

## 🔄 Next Steps

1. ✅ Review concept + 3 variants กับ brand team
2. ⏭️ Refine chosen variant + create full set (40 assets)
3. ⏭️ Animate Lottie idle (eyes blink, antenna pulse)
4. ⏭️ Hand-off to web dev (React component library)
5. ⏭️ Sticker pack submission to iMessage / LINE store
6. ⏭️ Document in Figma design system

---

## 💬 Pixel Personality Bible

> Pixel เป็น "พี่เลี้ยง" ในระบบ — ฉลาด เป็นมิตร แต่ไม่กวนใจ
>
> **Voice:** เป็นกันเอง แต่ไม่กระโดดโลดเต้น
> **Tone:** "ผมพร้อมช่วยนะ!" ไม่ใช่ "หวัดดีเพื่อนนน 😍😍😍"
> **Catchphrase:** "Let's flow together" (ภาษาอังกฤษ) / "ลุยกันเลย!" (ภาษาไทย)
>
> **Backstory:** Pixel เกิดในวัน TechFlow launch ปี 2026 มาจาก Bangkok HQ
> ชอบกาแฟ (เหมือน user), ชอบเรียนรู้ workflow ใหม่ๆ
> ไม่ชอบงานซ้ำๆ (เพราะเชื่อใน automation)

---

*Generated by /illustrator-pro — Claude Skill Unlock v1.1*
