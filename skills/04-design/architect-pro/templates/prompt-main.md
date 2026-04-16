# Architect Pro — Render Prompt Formula Library

> สูตร Midjourney / Flux / DALL-E prompts สำหรับงาน architectural visualization คุณภาพ portfolio

---

## Universal Formula

```
[TYPE of space: exterior/interior/detail],
[STYLE + era: modern tropical / minimalist Japandi / etc],
[KEY ARCHITECTURAL MOVES: courtyard, cantilever, louvers],
[MATERIALS: specific types with finishes],
[LIGHTING: time of day + quality],
[CAMERA: focal length + angle + lens],
[ATMOSPHERE: mood words],
[RENDER QUALITY: photorealistic, V-Ray, Corona, architectural photography],
[STYLE REFERENCE: architect name or publication],
[TECHNICAL PARAMS]
```

---

## 🏛️ Recipe by Shot Type

### Exterior Hero (Golden Hour)

```
Photorealistic architectural rendering of [BUILDING TYPE],
[STYLE], [KEY FEATURES: e.g. large cantilevered roof, floor-to-ceiling windows],
[MATERIALS: white stucco walls, teak wood accents, dark metal roof],
golden hour lighting with long dramatic shadows,
warm sun rays filtering through trees,
three-quarter front perspective at eye level,
24mm wide angle lens architectural photography,
tropical landscape with mature trees and pool,
sharp details, cinematic depth of field,
award-winning architecture, Archdaily publication quality,
inspired by [Tadao Ando / Duangrit Bunnag / Kengo Kuma],
--ar 16:9 --v 6 --style raw --stylize 150
```

**Example:**
```
Photorealistic architectural rendering of 2-story Japandi tropical villa,
250 sqm, flat cantilevered dark grey metal roof, central courtyard with Japanese maple,
floor-to-ceiling black aluminum window frames,
materials: white stucco wall, vertical teak wood slats, honed travertine deck,
golden hour 5pm lighting with long shadows, warm sun backlight,
three-quarter front perspective, 24mm architectural wide angle,
Phuket hillside with palm trees and 25m infinity pool in foreground,
sharp details, shallow DOF on foreground plants,
Archdaily feature quality, V-Ray Corona render aesthetic,
inspired by Kengo Kuma and Duangrit Bunnag tropical modern,
--ar 16:9 --v 6 --style raw --stylize 150
```

---

### Interior Living Space (Natural Light)

```
Photorealistic interior architectural rendering of [SPACE],
[STYLE], [KEY ELEMENTS: double-height ceiling, exposed beams],
[MATERIALS: oak flooring, linen sofa, travertine coffee table],
bright morning natural light from [direction] windows,
soft shadows, warm color temperature 3500K,
eye-level 28mm lens perspective,
styled with curated furniture and plants,
minimalist composition with 40% negative space,
Dwell magazine editorial style,
inspired by [Studio AC / Norm Architects],
--ar 3:2 --v 6 --style raw
```

**Example:**
```
Photorealistic interior rendering of open-plan living room,
Japandi minimalist style, double-height ceiling 5m with exposed timber beams,
large sliding glass door opening to courtyard garden with maple tree,
materials: white oak herringbone flooring, warm white plastered walls,
black iron stair railing, washi paper sliding partition,
furniture: low-profile linen sofa cream color, walnut coffee table,
handmade ceramic vases, single woven jute rug,
bright diffused morning light from east windows, sun rays on floor,
warm color temperature, soft shadows, eye-level 28mm perspective,
minimalist composition, 50% negative space,
Dwell magazine editorial photography quality,
inspired by Norm Architects and Studio AC,
--ar 3:2 --v 6 --style raw --stylize 120
```

---

### Detail / Material Close-up

```
Close-up architectural detail of [ELEMENT],
macro photography, [MATERIAL] meets [MATERIAL],
natural light with subtle shadows revealing texture,
shallow depth of field f/2.8,
50mm macro lens, neutral gray background,
architectural magazine detail shot,
Dezeen feature quality,
--ar 1:1 --v 6 --style raw
```

**Example:**
```
Close-up detail of stair junction where teak wood tread meets
black steel stringer, macro architectural photography,
visible wood grain with natural oil finish, hand-forged iron rivets,
single beam of natural light raking across surfaces,
shallow DOF f/2.8, 50mm macro, subtle shadow gradient,
neutral gray concrete floor background,
Dezeen architectural detail photography,
--ar 1:1 --v 6 --style raw
```

---

### Night / Dusk Mood

```
Architectural rendering at blue hour dusk,
[BUILDING] with warm interior glow through windows,
ambient twilight sky with gradient blue to orange,
landscape lighting path + uplighters on trees,
reflections in swimming pool,
long exposure architectural photography,
30 second exposure aesthetic,
cinematic, inspired by Iwan Baan night photography,
--ar 16:9 --v 6 --style raw
```

**Example:**
```
Architectural rendering of Japandi villa at blue hour dusk 7pm,
warm 2700K interior glow through floor-to-ceiling windows,
gradient sky blue (#1E2A3F) to orange (#D4734A) overhead,
uplighters on palm trees and garden accent lighting,
house reflected in 25m infinity pool surface,
long exposure architectural photography style, still water,
cinematic mood, Iwan Baan night photography aesthetic,
quiet contemplative atmosphere,
--ar 16:9 --v 6 --style raw --stylize 180
```

---

### Conceptual / Axonometric

```
Architectural axonometric drawing of [BUILDING],
isometric 30-60-90 projection,
flat colors with subtle shadow,
minimal white background,
clean vector illustration style,
BIG Bjarke Ingels diagram aesthetic,
exploded or sectional if needed,
--ar 1:1 --v 6 --style raw
```

---

### Interior Detail Lifestyle (Styled)

```
Interior lifestyle shot of [ROOM] styled for photograph,
[FEW KEY OBJECTS: books, plant, cup of coffee],
morning window light, dust motes in sun rays,
cozy lived-in feel with imperfection,
Kinfolk magazine lifestyle photography,
f/2 shallow DOF, 35mm lens,
warm natural colors,
--ar 4:5 --v 6 --style raw
```

---

## 🌏 Climate-Specific Tips

### Tropical / Thailand

```
Must include:
- Overhangs / deep eaves (2m+)
- Cross-ventilation openings
- Shaded outdoor space (semi-outdoor / verandah)
- Light colors to reflect heat
- Lush vegetation context

Avoid:
- All-glass facade without louvers
- Dark materials in direct sun
- Enclosed courtyards without ventilation
- Western European snowy aesthetic (irrelevant)
```

### Keywords for tropical modern:
```
"tropical modern architecture"
"passive cooling design"
"deep overhangs"
"courtyard house"
"louvered facade"
"open-concept semi-outdoor"
```

---

## 🎨 Style Keyword Library

| Style | Keywords |
|-------|----------|
| Modern tropical | `tropical modern`, `Duangrit Bunnag style`, `ASA tropical architecture` |
| Japandi | `Japandi architecture`, `wabi-sabi aesthetic`, `minimalist warm wood` |
| Minimalist | `Tadao Ando concrete`, `John Pawson minimalism`, `sacred geometry` |
| Industrial | `exposed brick and steel`, `converted warehouse`, `raw concrete` |
| Mid-century | `Palm Springs modernism`, `Eichler homes`, `1960s California` |
| Scandinavian | `Nordic minimalism`, `Norm Architects`, `natural light warmth` |
| Brutalist | `raw concrete brutalism`, `Paul Rudolph`, `massive sculptural form` |
| Biophilic | `biophilic design`, `living walls`, `indoor forest`, `nature integration` |
| Luxury resort | `Aman resort aesthetic`, `Amanpuri`, `Balinese tropical luxury` |

---

## 📐 Camera Angles Guide

| Shot | Lens | Angle | Use |
|------|------|-------|-----|
| Wide hero | 16-24mm | 3/4 front, eye level | Establishing |
| Interior wide | 24-28mm | Eye level, shift lens | Spatial feel |
| Medium | 35-50mm | Slightly elevated | Context |
| Detail | 85-100mm macro | Close, slight angle | Material |
| Drone aerial | 14-24mm | 45° down, high | Site context |
| Worm's eye | 14mm | Upward from ground | Drama / height |

---

## 💡 Lighting Descriptors

| Time | Quality | Mood |
|------|---------|------|
| Dawn (5-6am) | Cool blue, foggy | Mysterious, serene |
| Morning (7-10am) | Warm golden, long shadows | Fresh, hopeful |
| Midday (11am-2pm) | Harsh overhead, short shadows | Harsh (often avoid) |
| Afternoon (3-5pm) | Warm raking light | Balanced, productive |
| Golden hour (5-6pm) | Warm orange, long shadows | Cinematic, emotional |
| Blue hour (6-7pm) | Balanced indoor/outdoor exposure | Luxurious, editorial |
| Night | Artificial + ambient | Dramatic, moody |

**Rule:** Architecture renders อยู่ใน golden hour/blue hour 70% ของเวลา — best balance

---

## ⚠️ Common Render Mistakes

❌ Too much reflection (plastic feel)
❌ Over-bright HDR (looks like CGI)
❌ Empty space without styling (lifeless)
❌ Too many materials mixing (choose 5-7 max)
❌ Humans with distorted faces (ลบออก หรือ silhouette)
❌ Ignoring context (no landscape, empty site)
❌ Text on renders (Midjourney spells wrong — add in Photoshop)

---

## ✅ Render Quality Checklist

- [ ] Photorealistic materials with correct reflectance
- [ ] Contact shadows (grounding objects)
- [ ] Subtle imperfections (not too clean)
- [ ] Consistent light source and direction
- [ ] Atmospheric perspective (slight haze distant)
- [ ] Depth cues (foreground/mid/background)
- [ ] Styled with lifestyle props
- [ ] Context / landscape included
- [ ] Post-processing: slight S-curve, vignette, grain
