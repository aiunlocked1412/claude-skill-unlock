# Illustration Prompt Formula + Style Reference

> สูตรเขียน prompt สำหรับ Recraft / Midjourney / DALL-E ที่ได้ vector illustration คุณภาพ

---

## Universal Formula

```
[STYLE], [SUBJECT + DETAIL], [COMPOSITION],
[COLOR PALETTE with HEX], [LINE WEIGHT/TEXTURE],
[REFERENCE STYLE/ARTIST], [TECHNICAL PARAMS]
```

### Tools by use case
| Tool | Best for |
|------|----------|
| **Recraft** | Vector SVG output (no trace needed) |
| **Midjourney v6** | Character, editorial, mood |
| **DALL-E 3** | Text/typography in illustration |
| **Ideogram** | Icon with text label |
| **Krea / Flux** | Photo-realistic ที่ stylize ได้ |

---

## Style Recipes

### 🌸 Flat illustration (Notion/Slack style)
```
Flat vector illustration, [SUBJECT],
clean geometric shapes, no gradients,
limited color palette: [3-4 HEX colors],
soft rounded corners, minimal detail,
white background, modern friendly style,
similar to Notion or Slack illustration aesthetic,
--ar 1:1 --v 6 --style raw --stylize 100
```

### 🏔️ Isometric 2.5D
```
Isometric illustration of [SCENE/OBJECT],
30-degree axonometric perspective,
soft pastel color palette ([HEX]),
detailed flat shading with subtle depth,
floating elements, no background,
similar to Streamline or Storytale illustrations,
--ar 1:1 --v 6 --style raw
```

### 🧍 Character / Mascot
```
Cute mascot character design for [BRAND],
friendly [animal/object/robot] character,
3 heads tall proportion (chibi style),
big expressive eyes, soft round shapes,
[COLOR palette HEX],
flat vector style with simple shading,
front view + 3/4 view + side view turnaround,
--ar 16:9 --v 6 --style raw --stylize 150
```

**Character expression sheet:**
```
Character sheet of [NAME] mascot,
8 expressions: happy, sad, surprised, thinking,
loving, angry, sleepy, excited,
consistent style across all,
clean vector illustration,
arranged in 2x4 grid,
--ar 4:3 --v 6 --style raw
```

### 🔷 Icon Set
```
Set of [N] minimalist line icons for [TOPIC],
24x24 pixel grid, 2px stroke weight,
consistent style: outline only / outline + filled,
rounded line caps, geometric construction,
black on transparent background,
arranged in [4x4/3x5] grid,
similar to Phosphor Icons or Heroicons style,
--ar 1:1 --v 6 --style raw --stylize 50
```

### 📰 Editorial Illustration
```
Editorial illustration about [CONCEPT],
conceptual + symbolic composition,
metaphorical visual storytelling,
muted sophisticated color palette ([HEX]),
textured digital painting style,
inspired by The New Yorker covers and Christoph Niemann,
--ar 4:5 --v 6 --style raw --stylize 250
```

### 🎨 Hand-drawn / Sketchy
```
Hand-drawn illustration of [SUBJECT],
loose pencil sketch lines, watercolor wash,
imperfect organic shapes, charm of imperfection,
warm earthy color palette ([HEX]),
visible paper texture background,
similar to Oliver Jeffers or Jon Klassen children book art,
--ar 1:1 --v 6 --style expressive --stylize 300
```

### 🌐 Tech/Abstract Gradient
```
Abstract tech illustration, [CONCEPT],
fluid 3D gradient mesh shapes,
vibrant gradient: [HEX1 → HEX2 → HEX3],
glassmorphism + soft glow effects,
floating geometric primitives,
inspired by Stripe, Linear, Vercel branding,
--ar 16:9 --v 6 --style raw --stylize 200
```

### 🌳 Botanical / Nature pattern
```
Seamless pattern of [PLANT/FLOWER/FRUIT],
hand-illustrated botanical style,
muted natural color palette: [HEX],
delicate line work + flat color fill,
even repeat tile, can tile seamlessly,
inspired by William Morris and Japanese kimono patterns,
--ar 1:1 --v 6 --tile --style raw
```

---

## Color Palette Strategies

### 60-30-10 Rule
```
60% Background/dominant: #F5EFE6 cream
30% Subject body: #3A8E5A green
10% Accent (highlight): #E63946 red
```

### Schemes by mood

| Mood | Palette example |
|------|-----------------|
| Calm minimal | #F5F5F4 + #404040 + #E5E5E5 |
| Playful | #FF6B9D + #FFD93D + #6BCB77 + #4D96FF |
| Tech sleek | #0F172A + #6366F1 + #06B6D4 + #F1F5F9 |
| Earthy organic | #3A2E1F + #D4A574 + #8B6F47 + #F5EFE6 |
| Pastel candy | #FFB5A7 + #FCD5CE + #B8E0D2 + #95D5B2 |
| Editorial premium | #1A1A1A + #C9A961 + #F5F5F0 + #8B0000 |

---

## Character Design Guide

### Anatomy proportion
| Type | Heads tall |
|------|------------|
| Realistic adult | 7-8 |
| Heroic | 8-9 |
| Cute mascot (chibi) | 2-4 |
| Stylized child | 5-6 |
| Funny/cartoon | 5-7 |

### Construction lines (head)
```
   ┌────┐
   │ E E│  ← Eye line (50% from top)
   │ N  │  ← Nose (75%)
   │ U  │  ← Mouth (85%)
   └────┘
```

### Mascot personality decision
- **Friendly:** big eyes, soft curves, smile default
- **Smart:** glasses, taller head proportion
- **Heroic:** strong jaw, confident pose
- **Mysterious:** narrow eyes, dark colors
- **Funny:** exaggerated proportion, asymmetric

### Expression sheet (must-have 8)
1. 😊 Happy (default)
2. 😢 Sad
3. 😮 Surprised
4. 🤔 Thinking
5. 😍 Loving (heart eyes)
6. 😡 Angry
7. 😴 Sleepy
8. 🎉 Excited / Celebrating

---

## Icon Set Best Practices

### Grid construction (24x24)
```
┌───────────────────────────┐
│ 2px padding all sides     │
│ ┌─────────────────────┐   │
│ │  20x20 active area  │   │
│ │  (icon lives here)  │   │
│ └─────────────────────┘   │
│                           │
└───────────────────────────┘
```

### Stroke consistency
- All icons same stroke (1.5/2/2.5px)
- Round line cap, round line join
- No half-pixel (always integer)

### Visual weight equalization
> Icon ที่มี mass มาก (filled square) ดูใหญ่กว่า outline circle ที่ขนาดเท่ากัน
> ต้องลด physical size ของ filled icon ลง 5-10% เพื่อให้ดูเท่ากัน

### Categories ต้องครบ
- Navigation: home, search, menu, back, close
- Action: add, edit, delete, save, share
- Status: success, warning, error, info, loading
- Communication: chat, mail, phone, notification
- User: profile, settings, logout, login

### Export setup
```
SVG: optimize via SVGOMG
- remove metadata
- collapse groups
- convert shapes to paths

PNG: 1x / 2x / 3x for retina
- 24px / 48px / 72px

Icon font: Fontello / Icomoon (legacy)
React component: SVGR
```

---

## Vector Refinement Workflow

```
1. AI generate (Recraft) → SVG / PNG
2. Open in Illustrator / Figma
3. Image Trace (if PNG)
4. Clean anchor points (delete redundant)
5. Pathfinder unite/subtract
6. Recolor with brand palette
7. Test at target size (24px / 48px)
8. Export SVG optimized
9. Test on light + dark background
```

---

## Common Pitfalls

❌ Mix style ใน set เดียว (flat + 3D)
❌ Stroke weight ไม่ consistent
❌ ใช้ gradient เกิน 3 สี = noisy
❌ Photo-realistic = AI ไม่ดีพอ ใช้รูปจริงดีกว่า
❌ Copy character ที่จด TM (Mickey, Pikachu)
❌ Skin tone ขาวหมดทั้ง set (diversity matter)
❌ Use red/green only for status (color blind ไม่เห็น)
❌ Icon ที่ literal เกินไป (กล่อง = settings? ใช้ gear ดีกว่า)

---

## Style References (ใส่ใน prompt)

| Style | Keyword |
|-------|---------|
| Notion-like | `Notion illustration aesthetic, friendly business illustration` |
| Apple HIG | `Apple Human Interface Guidelines icon style` |
| Material You | `Google Material Design 3 illustration` |
| Streamline | `Streamline icons, isometric soft` |
| Phosphor | `Phosphor icons, line geometric` |
| Heroicons | `Heroicons style, simple outline` |
| Storytale | `Storytale illustration, character isometric` |
| Lukas Brzak | `Lukas Brzak illustration style` |
| Tom Froese | `Tom Froese editorial illustration` |
| Christoph Niemann | `Christoph Niemann conceptual minimalist` |
| Olly Moss | `Olly Moss negative space illustration` |
