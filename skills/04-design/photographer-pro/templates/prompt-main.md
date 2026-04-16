# Photographer Pro — Lighting + Retouching Recipe Library

> สูตรสำเร็จรูปสำหรับ lighting setup, Lightroom preset, และ retouching พร้อมใช้

---

## 💡 Lighting Setups (By Genre)

### Portrait — Natural Light (Outdoor)

```
Location: open shade หรือใต้ต้นไม้ใหญ่
Time: 1 ชม. ก่อน golden hour หรือ 30 นาทีหลังพระอาทิตย์ขึ้น
Direction: subject หัน 45° จากแหล่งแสง
Reflector: white bounce จากด้านล่าง-หน้า (fill shadow ใต้คาง)
Camera settings:
  - Aperture: f/1.8-2.8 (shallow DOF)
  - Shutter: 1/250 ขั้นต่ำ (กันกล้องสั่น + เอาสว่าง)
  - ISO: 200-400
  - WB: 5200-5500K (daylight) หรือ Auto + corrected in Lightroom
Lens: 85mm f/1.8 (classic portrait) หรือ 50mm f/1.4
```

### Portrait — Studio Strobe (1-light minimalist)

```
Key light: Softbox 90x60cm @ 45° ด้านหน้า, สูงกว่าตา 30cm
Power: f/8 (medium power, 1/4 จาก max)
Fill: White V-flat reflector ด้านตรงข้าม key
Background: seamless paper grey 18%, separate light at f/5.6
Modifier: grid 40° ถ้าต้องการ focused contrast
Camera: 1/125, f/8, ISO 100
Lens: 85mm f/1.4 หรือ 70-200 f/2.8
```

### Product — E-commerce Clean White

```
Light 1: Softbox 60x90cm overhead (main key)
Light 2: Strip softbox 30x120cm rim from behind-left
Light 3: White card fill จากด้านหน้า
Background: white sweep paper / acrylic white
Camera: f/11-16 (deep DOF), 1/160, ISO 100
Lens: 50mm macro หรือ 100mm macro
Tripod: essential — เตรียม focus stack ถ้าจำเป็น
```

### Product — Editorial / Moody

```
Light 1: Single gridded softbox 60x90 @ 90° side light
Light 2: NONE (let shadows fall naturally)
Background: dark textured (concrete / marble / velvet)
Fill: Negative fill (black flag) ด้านตรงข้าม เพื่อ deepen shadow
Camera: f/4-5.6 (subject pop), 1/125, ISO 100-200
Lens: 85mm f/1.4 หรือ 100mm macro
```

### Wedding — Reception Mixed Light

```
Main: on-camera flash bounced ceiling + diffuser
Secondary: remote flash behind subject (rim light)
Ambient: ISO 1600-3200 เพื่อเก็บ venue light
Camera: 1/125 (เร็วพอกันเบลอ, ช้าพอเอา ambient), f/2.8
Gel: CTO 1/2 บน flash เพื่อ match tungsten ambient
Lens: 35mm f/1.4 (wide event) + 85mm f/1.4 (compression)
```

### Family — Golden Hour Outdoor

```
Time: พระอาทิตย์สูง 10-30° (30 นาทีก่อนตก)
Direction: backlighting — subject หันหลังให้พระอาทิตย์
Rim light: ธรรมชาติจากพระอาทิตย์ (creates glow)
Fill: reflector ด้านหน้า หรือ expose for face + ให้ bg overexpose
Camera: f/2.8, 1/500, ISO 200
WB: 6500K (warm the scene)
```

---

## 🎨 Lightroom Preset Recipes

### Recipe 1: Bright & Airy (Family / Wedding / Lifestyle)

```
BASIC:
Exposure +0.35, Contrast -20, Highlights -45,
Shadows +45, Whites +15, Blacks +5,
Texture +10, Clarity -8, Dehaze -5,
Vibrance +10, Saturation -5

TONE CURVE (Point):
Blacks lifted: input 0 → output 22
Darks: input 64 → output 75
Lights: input 192 → output 200

HSL (Saturation):
Red -15, Orange -20, Yellow -25, Green -30,
Aqua -20, Blue -15, Purple 0, Magenta -10

HSL (Luminance):
Red +10, Orange +15, Yellow +10, Green +5

COLOR GRADING:
Shadows: Hue 210 (blue), Sat 15
Highlights: Hue 40 (warm), Sat 10
Blending 50, Balance +10

CALIBRATION:
Blue Primary: Hue +10, Sat -10
```

### Recipe 2: Moody Film (Portrait / Editorial)

```
BASIC:
Exposure 0, Contrast +10, Highlights -30,
Shadows -15, Whites -15, Blacks +10,
Texture +20, Clarity +5, Dehaze 0,
Vibrance -5, Saturation -15

TONE CURVE:
Classic S-curve: lift black 15, compress highlights

HSL (Saturation):
Red -10, Orange -20, Yellow -40, Green -50,
Aqua -30, Blue +5, Purple 0

HSL (Hue):
Orange -10 (skin warmer), Green +20 (toward teal)

COLOR GRADING:
Shadows: Hue 200, Sat 25 (teal shadows)
Midtones: Hue 30, Sat 10
Highlights: Hue 30, Sat 15 (orange)
Blending 50, Balance 0

DETAIL:
Sharpening 50, Masking 40
Grain: Amount 20, Size 25, Roughness 50
```

### Recipe 3: Product Clean White

```
BASIC:
Exposure +0.2, Contrast +15, Highlights -15,
Shadows +20, Whites +25, Blacks 0,
Texture +15, Clarity +10, Vibrance +5

CALIBRATION:
ensure color accuracy — use X-Rite ColorChecker

TONE CURVE: linear (no adjustment)
HSL: minimal — only correct cast
COLOR GRADING: skip (true-to-life)

DETAIL:
Sharpening 60, Masking 50
Noise Reduction 10
```

### Recipe 4: Wes Anderson / Symmetrical Pastel

```
BASIC:
Exposure +0.3, Contrast -10, Highlights -20,
Shadows +30, Texture +5, Vibrance +25, Saturation +5

HSL (Saturation):
Red +15, Orange +20, Yellow +30, Green +20, Blue +15

HSL (Hue):
Red +5, Orange +15 (peach skin), Yellow +10, Green +15 (mint)

COLOR GRADING:
Shadows: Hue 40, Sat 15 (warm shadows)
Highlights: Hue 180, Sat 10 (cool highlights)
Global: Hue 30, Sat 10

CALIBRATION:
Red Primary: Hue +10, Sat +10
Blue Primary: Hue +5, Sat +5
```

---

## 🖼️ Retouching Workflow (Portrait)

### Frequency Separation (Skin)
1. Duplicate layer 2 ครั้ง → low freq + high freq
2. Low freq: Gaussian Blur 8-12px
3. High freq: Apply Image → subtract low from original
4. Low freq layer: heal color + tone (patch, mixer brush 20%)
5. High freq layer: heal texture (clone, spot heal)
6. Keep pores — don't over-blur

### Dodge & Burn
1. New 50% grey layer, blend mode Soft Light
2. Dodge: white brush 5-10% flow → shape light (cheeks, bridge of nose, under eyes)
3. Burn: black brush 5-10% flow → deepen shadows (jaw, side of nose)
4. Zoom out often — ดู global shape
5. Final opacity 60-80%

### Eye Enhancement (Subtle)
- Selective dodge iris pattern (+1/3 stop)
- Sharpen iris only (mask out rest)
- Whiten eye whites ด้วย selective desaturation Yellow
- Don't go > 30% opacity

### Teeth Whitening
- Select teeth → HSL Yellow: Sat -30, Lum +15
- Don't go < -50 (unnatural grey)

### Liquify
- แจ้งลูกค้าก่อนว่าจะปรับไหน
- Reshape 5-10% max (minor slimming, fix weird folds)
- ห้ามเปลี่ยนรูปร่างหน้า / โครงกระดูก

---

## 📐 Composition Cheatsheet

| Rule | When |
|------|------|
| Rule of thirds | Default — always safe |
| Centered | Symmetrical subject, editorial portrait |
| Leading lines | Landscape, street, architecture |
| Framing | Doorways, arches, tree branches |
| Negative space | Minimalist, editorial, fashion |
| Fill the frame | Close-up portrait, detail shots |
| Golden ratio | Advanced — painterly feel |

---

## 🎯 Shot List Template (per shot)

```
Shot #07
- Description: Medium-wide — couple walking holding hands toward camera
- Location: pathway lined with trees (Location B)
- Lighting: Golden hour backlight, reflector for fill
- Composition: leading lines from path, subjects in lower third
- Lens: 50mm f/1.8
- Settings: 1/500, f/2.8, ISO 200
- Time: 8 min
- Direction cue: "เดินช้าๆ มองหน้ากัน ไม่ต้องมองกล้อง"
```

---

## ⚠️ Backup Plans

| Scenario | Plan B |
|----------|--------|
| ฝนตก outdoor | Move to covered venue / reschedule / moody rainy shots |
| Golden hour หายไป | Use strobe to simulate / move to open shade |
| Model late 30 min | Skip wide shots → compress to close-ups only |
| Card error | Always carry 2+ cards, shoot redundant to 2 slots |
| Battery dies | Bring 3+ batteries, car charger |
| Memory full | 128GB minimum, clear + format before |
