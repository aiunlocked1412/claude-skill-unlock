# Tattoo Design Prompt + Style Reference

> AI prompt formula สำหรับ tattoo concept generation + style heritage

---

## Universal Tattoo Prompt Formula

```
[STYLE], [SUBJECT + SYMBOLISM],
[COMPOSITION on body part],
[LINE WEIGHT + SHADING],
[COLOR vs B&W],
[STENCIL view: flat black, white background],
[REFERENCE artist if applicable],
[TECHNICAL: high contrast, sharp outline, --ar, --v]
```

### Key parameters
- `--ar 1:1` — sticker / single concept
- `--ar 9:16` — sleeve / leg / back
- `--ar 4:5` — most body parts
- `--v 6 --style raw` — clean tattoo flash
- `flat tattoo flash design, white background` — important for stencil

---

## Style Recipes

### ✍️ Single line / Minimalist
```
Minimalist single continuous line tattoo design,
[SUBJECT: flower / face profile / animal],
delicate fine line work, no shading, no fill,
0.3mm thin black line on white background,
flat tattoo stencil illustration,
inspired by Mo Ganji and Mateusz Adach minimalist tattoos,
--ar 1:1 --v 6 --style raw
```

### 🇺🇸 American Traditional (Sailor Jerry style)
```
American Traditional tattoo design, [SUBJECT: anchor/eagle/rose/dagger],
bold black outline 2-3mm thickness,
solid red, yellow, green, blue ink (limited palette),
heavy black shading, classic banner with text,
flat tattoo flash sheet style, white background,
inspired by Sailor Jerry and Ed Hardy classic American Traditional,
--ar 1:1 --v 6 --style raw
```

### 🐉 Japanese Irezumi
```
Japanese traditional Irezumi tattoo design, [SUBJECT: dragon/koi/tiger/phoenix],
flowing waves and clouds background (mist + water),
bold black outlines with grey wash shading,
saturated color: red, gold, deep blue, green,
classic Edo-period composition,
designed for [body part: full sleeve / back piece / chest],
inspired by Hokusai woodblock prints and Horiyoshi III tattoo master,
flat tattoo design reference,
--ar 9:16 --v 6 --style raw --stylize 200
```

### 📷 Realism / Portrait
```
Photorealistic black and grey tattoo design,
hyper-realistic portrait of [SUBJECT: person/animal/object],
detailed shading with smooth grey tones,
sharp focus on eyes / focal point,
soft skin texture, photographic quality,
designed to fit [body part] [size cm],
inspired by Nikko Hurtado and Bob Tyrrell realism masters,
high resolution stencil reference,
--ar 4:5 --v 6 --style raw
```

### 🌸 Watercolor
```
Watercolor tattoo design, [SUBJECT: bird/flower/abstract],
splash of color paint dripping effect,
loose brush strokes, no outline (or minimal),
vibrant pink, turquoise, yellow color bleed,
abstract artistic style,
white background for stencil,
inspired by Sasha Unisex and Ondrash watercolor tattoos,
--ar 4:5 --v 6 --style expressive --stylize 250
```

### ⚫ Blackwork / Geometric
```
Blackwork geometric tattoo design, [SUBJECT: mandala/sacred geometry/dotwork],
heavy solid black with negative space,
precise compass-drawn lines, perfect symmetry,
sacred geometry composition (Flower of Life / Metatron),
fine dotwork stippling for shading,
inspired by Thomas Hooper and Chaim Machlev dotwork masters,
white background flat design,
--ar 1:1 --v 6 --style raw --stylize 100
```

### 🌿 Fine Line Botanical
```
Fine line botanical tattoo design, [SUBJECT: rose/peony/branch/wildflower],
delicate single line work 0.5mm thickness,
no fill, hint of light grey wash for depth,
elegant feminine flow, asymmetric composition,
designed for [body part: forearm / spine / collarbone],
inspired by Dr. Woo and Jakub Nowicz fine line,
white background flat reference,
--ar 9:16 --v 6 --style raw
```

### 🌀 Tribal (Polynesian/Maori — RESPECT)
```
Polynesian tribal tattoo design, traditional Samoan/Maori inspired pattern,
heavy black geometric pattern with cultural symbolism,
spear tip, ocean wave, turtle shell motifs,
designed to flow around [body part: shoulder/leg/back],
inspired by traditional pe'a and ta moko (with proper cultural consultation),
authentic respectful design,
--ar 9:16 --v 6 --style raw
```
**⚠️ NOTE:** Tribal patterns from indigenous cultures require cultural consultation. ห้ามใช้ Maori moko ถ้าไม่ใช่ Maori. ห้ามใช้ tā moko facial. ใช้ generic "Polynesian-inspired" และ flag ให้ลูกค้าทราบ

---

## Style Decision Matrix

| Want this | Choose this style |
|-----------|-------------------|
| Tiny + meaningful | Minimal / Single line / Fine line |
| Bold + classic + age well | American Traditional |
| Epic + storytelling + large | Japanese Irezumi |
| Photo of loved one/pet | Realism (B&W safer) |
| Artistic + colorful + unique | Watercolor |
| Symmetric + spiritual | Blackwork / Geometric / Mandala |
| Feminine + delicate | Fine line botanical |
| Cultural identity (own culture) | Tribal (with elder consultation) |
| Lettering / quote | Script / Calligraphy (any style) |

---

## Pain Scale Map (1-10)

```
HEAD/NECK
- Forehead: 8
- Behind ear: 6
- Side of neck: 7
- Back of neck: 6
- Throat: 9 (extreme)

TORSO
- Chest pec: 5-6 (men), 7 (women near sternum)
- Sternum/center chest: 9
- Ribs: 9 (legendary brutal)
- Stomach: 6-7
- Lower back: 5
- Spine: 9
- Shoulder blade: 5

ARMS
- Outer upper arm: 3 (easiest!)
- Inner upper arm: 7
- Outer forearm: 4
- Inner forearm: 5
- Elbow ditch: 9
- Elbow point: 7
- Wrist (outer): 5
- Wrist (inner): 7
- Hand top: 8
- Fingers: 9 (and fade fast!)

LEGS
- Outer thigh: 3
- Inner thigh: 7
- Knee top: 8
- Behind knee: 9
- Calf: 4
- Shin: 7
- Ankle bone: 8
- Foot top: 8
- Foot sole: 9 (fade fast)

OTHER
- Armpit: 10 (legendary worst)
- Genital area: 10
- Behind knee: 9
- Inner elbow: 9
```

---

## Placement & Aging Considerations

### Best for longevity (low fade)
- Outer upper arm
- Calf (back)
- Upper back
- Chest (high, not on muscle that flexes)
- Outer forearm

### Worst for longevity (fast fade)
- Hands (constant washing + sun)
- Feet (footwear friction)
- Inner forearm (sun + flexing)
- Fingers (high friction + tiny ink reservoir)
- Lips (saliva degrades)
- Knees (skin stretch)

### Aging effect (after 20 years)
- Solid line tattoos → still readable
- Fine line → blur into single line
- Pure white ink → turn yellow
- Pastel colors → fade to almost invisible
- Heavy shading → blob if not done well
- Watercolor without outline → blur first

### Sun protection
- SPF 30+ on tattoo always (UV = #1 fade cause)
- Avoid tan beds (devastating to color)
- Cover with clothing in sun > 30 min

---

## Color Ink Reference

### Trusted ink brands (2026)
- **Eternal Ink** — vegan, vibrant
- **Intenze** — wide color range
- **World Famous** — bold colors
- **Solid Ink** — Federico Ferroni signature
- **Kuro Sumi** — Japanese style black

### Color longevity rank (best → worst)
1. **Pure black** — strongest, lasts 50+ years
2. **Deep blue** (cobalt, navy) — excellent
3. **Forest green** — great
4. **Brown** — good
5. **Red** (warm cadmium) — fade after 15 years
6. **Yellow** — fade after 10 years
7. **Purple** — fade with sun
8. **Pink (light)** — fade fast
9. **White** — turn yellow, "highlight" only
10. **Gold/silver metallic** — gimmick, fade fast

### Allergy risk
- **Red ink:** highest allergy (cadmium, cinnabar) — 1-3% of people
- **Yellow:** moderate
- **Green:** can react under MRI (chromium content in old ink)
- **Blue/Black:** lowest risk

### Skin tone advice
- **Fair (Type 1-2):** all colors work, watch for sun
- **Medium tan (3-4):** pastels look washed out, stick to bold saturated
- **Dark brown (5-6):** black + heavy line strongest, color subdued (consult artist familiar with darker skin)

---

## Stencil Spec for Artist

When delivering to tattoo artist:
- **Resolution:** 300 DPI minimum
- **Format:** PDF (scalable) or PNG (raster)
- **Size:** actual mm × mm marked
- **Color separation:** B&W stencil + color reference separate
- **Outline weight:** annotated (1mm thick? 0.5mm fine?)
- **Reference photos:** if realism (clear photo, multiple angles)
- **Body part outline:** show how design fits curve
- **Print on:** thermal stencil paper (artist supplies)

---

## Common Pitfalls

❌ Tattoo on mole (cover skin cancer screening = dangerous)
❌ Detail too fine for size (1cm portrait = blob)
❌ Names of romantic partner (#1 regret)
❌ Trendy meme (Game of Thrones, Squid Game) — outdate fast
❌ Religious symbol of culture not yours (cultural appropriation)
❌ Tattoo on stretch mark area (poor healing)
❌ Skin condition not consulted (psoriasis, eczema)
❌ Drinking before session (blood thin = bad healing)
❌ DIY at home (infection + bad result)
❌ Bargain artist (ดี = แพง, ถูก = ตลอดชีวิต regret)

---

## Pre-tattoo Mental Check

ถาม wearer 5 questions ก่อน:
1. ถ้าเปลี่ยนใจ 5 ปีหลัง — ยัง happy ไหม?
2. กระทบ profession ไหม? (Thai school teacher, military, hotel front)
3. ใส่กับ wedding dress / suit ได้ไหม? (formal occasion)
4. ถ้า partner ไม่ชอบ — เป็นไง?
5. มี ink allergy/skin condition ที่ artist ต้องรู้ไหม?

---

## Tattoo Artist Selection (Thailand)

### Criteria
- ✅ Portfolio = same style ที่อยาก
- ✅ Studio licensed + sterile
- ✅ Use single-use needle (ดูในพิธี!)
- ✅ Wear gloves + change ระหว่าง procedure
- ✅ Consultation 30 min ฟรี (ดี artist จะให้)
- ✅ Aftercare instructions เขียน
- ✅ Realistic price (฿2-5K/hr in BKK)
- ❌ Avoid: bedroom studio, no hygiene visible, "free tattoo" promo

### Recommended hubs
- Bangkok: Khao San (เก่า), Sukhumvit (modern), Onnut (Korean style)
- Chiang Mai: Nimman (artistic)
- Phuket: tourist (be careful — ระวัง shop ที่ rotate artist)

---

## Style References (artists to research/cite)

| Style | Artists |
|-------|---------|
| Minimal | Mo Ganji, Mateusz Adach, JonBoy |
| Traditional | Sailor Jerry (heritage), Ed Hardy, Bert Krak |
| Japanese | Horiyoshi III, Shige, Filip Leu |
| Realism | Nikko Hurtado, Bob Tyrrell, Inal Bersekov |
| Watercolor | Sasha Unisex, Ondrash, Russell Van Schaick |
| Blackwork | Thomas Hooper, Chaim Machlev (Dotyk), Tomas Garcia |
| Fine Line | Dr. Woo, Jakub Nowicz, Jonathan Valena |
| Neo-Traditional | Eckel, Antonio Macko Todisco |
