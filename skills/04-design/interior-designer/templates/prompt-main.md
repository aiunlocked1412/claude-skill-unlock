# Interior Render Prompt + Style Reference

> สูตรเขียน Midjourney prompt สำหรับ interior visualization + style/material reference

---

## Universal Interior Render Formula

```
[ROOM TYPE], [STYLE], [SIZE/CONTEXT],
[KEY FURNITURE/MATERIAL],
[LIGHTING + MOOD + TIME OF DAY],
[COLOR PALETTE with HEX],
[CAMERA: focal length + angle],
[REFERENCE: designer/magazine],
[TECHNICAL: photorealistic, ar, v]
```

### Camera params for interior
- `--ar 3:2` — landscape (wide room view)
- `--ar 16:9` — cinematic
- `--ar 4:5` — portrait (vertical detail)
- `--v 6 --style raw` — photo-realistic
- Focal: 24mm (wide), 35mm (natural), 50mm (intimate)

---

## Style Recipes

### 🌸 Japandi (Japan + Scandinavia)
```
Japandi style master bedroom interior, 16 sqm,
low platform bed with natural oak frame,
linen white duvet, jute area rug,
washi paper pendant lamp, hinoki wood floor,
muted earth tone palette: cream #F5EFE6 walls, oak floor #C8A97E, deep charcoal #3A3A3A accents,
soft morning light from sheer linen curtain (east-facing window),
calm minimalist atmosphere, wabi-sabi aesthetic,
shot at 35mm focal length, eye-level natural perspective,
inspired by Norm Architects and Studio KO,
photorealistic, architectural digest quality,
--ar 3:2 --v 6 --style raw
```

### 🏛️ Mid-century Modern
```
Mid-century modern living room interior,
walnut wood credenza, leather lounge chair (Eames-style),
brass tripod floor lamp, abstract wool rug,
mustard yellow + teal + walnut palette,
warm 2700K accent lighting + natural afternoon light,
linear architecture with low ceiling,
inspired by Don Draper office aesthetic,
shot at 24mm wide angle, three-point perspective,
--ar 16:9 --v 6 --style raw
```

### 🏗️ Industrial Loft
```
Industrial loft kitchen with exposed brick wall,
black steel kitchen island with butcher block counter,
brass pendant lights row above island,
concrete polished floor, exposed ductwork ceiling,
warm wood + black metal + concrete grey palette,
moody warm 3000K Edison bulbs,
shot at 28mm wide, slightly low angle for ceiling drama,
inspired by Brooklyn loft renovations,
--ar 3:2 --v 6 --style raw
```

### 🌴 Tropical Modern (Thai context)
```
Tropical modern Thai villa living room, open to garden,
teak wood ceiling, white walls, polished concrete floor,
linen sofa, rattan armchair, banana leaf cushions,
floor-to-ceiling sliding glass door open to lap pool,
warm afternoon golden hour light, indoor-outdoor flow,
white + teak brown + sage green palette,
shot at 24mm wide, eye-level, view through to garden,
inspired by Bensley and Habita Architects Thailand,
--ar 16:9 --v 6 --style raw
```

### 🏰 Classic European
```
Classic French Provincial bedroom interior,
canopy bed with cream linen drapes,
oak parquet floor in herringbone pattern,
marble fireplace mantel with gold mirror above,
crystal chandelier, velvet armchair Louis XV style,
ivory + dusty rose + gold leaf palette,
natural soft afternoon light from French window,
high coffered ceiling 3.5m,
inspired by Maison de Vacances and Caroline Roux interiors,
--ar 3:2 --v 6 --style raw
```

### 🏔️ Cabin / Wabi-sabi
```
Wabi-sabi mountain cabin interior, raw and intentional,
limewashed plaster walls, reclaimed pine ceiling beams,
linen drop cloth slipcover sofa, sheepskin throw,
cast iron wood stove, natural stone hearth,
muted neutral palette: chalk white #F5F0E8, warm taupe #B8A88A, charcoal #4A4A48,
soft overcast natural light, slow afternoon,
shot at 35mm intimate angle,
inspired by Axel Vervoordt and Vincent Van Duysen,
--ar 4:5 --v 6 --style raw --stylize 250
```

---

## Material Palette by Style

### Japandi
```
- Walls: limewash plaster cream #F5EFE6
- Floor: white oak engineered wood (matte finish)
- Cabinet: rift-cut oak veneer + matte black hardware
- Counter: honed Calacatta marble or quartz
- Soft furnishing: linen, raw cotton, jute, wool
- Accent: matte black metal, brushed brass minimal
```

### Mid-century
```
- Walls: warm white #F5F1EA
- Floor: walnut hardwood (medium tone)
- Cabinet: walnut veneer + brass pulls
- Counter: white quartz with grey vein
- Soft furnishing: leather, wool tweed, velvet
- Accent: brass, smoked oak, atomic-era tile
```

### Industrial
```
- Walls: exposed brick + grey paint #696969
- Floor: polished concrete or reclaimed wood
- Cabinet: black steel + raw wood butcher block
- Counter: stainless steel or concrete
- Soft furnishing: distressed leather, canvas, wool
- Accent: Edison bulbs, copper pipe, factory steel
```

### Tropical Modern
```
- Walls: white limewash or wood plank
- Floor: polished concrete or terrazzo
- Cabinet: teak + white lacquer
- Counter: terrazzo or honed concrete
- Soft furnishing: linen, rattan, wood
- Accent: brass, woven cane, tropical plants
```

---

## Lighting Specs (Layered)

### 3-Layer System (must-have for any room)

**Layer 1: Ambient (general)**
- Recessed downlight 4" dim-to-warm
- Spacing: ceiling height ÷ 1.5 apart
- Lumens: 20-30 lm/sqft (living), 30-40 (kitchen)

**Layer 2: Task**
- Pendant over island (75cm above counter)
- Reading lamp bedside (eye level when sitting)
- Under-cabinet LED strip (3000K)
- Desk lamp (4000K work, 3000K relax)

**Layer 3: Accent**
- Wall sconce (1.5m from floor)
- Picture light (above artwork)
- Cove light hidden in ceiling perimeter
- Spotlight on object (40-60° beam)

### Color Temperature Cheat
| Room | Color temp |
|------|-----------|
| Bedroom | 2700K (warm cozy) |
| Living room | 2700-3000K |
| Dining | 2700K (food look warm) |
| Kitchen task | 3500-4000K |
| Bathroom (vanity) | 3000K (skin look natural) |
| Office | 4000K (focus) |
| Garage / utility | 5000K |

### Dimmer everywhere!
- Always spec dimmable LED
- Dim-to-warm = lower brightness = warmer color (cinema feel)

---

## Furniture Sizing Reference

### Living
```
3-seater sofa: 200×90×85cm
2-seater sofa: 160×90×85cm
Coffee table: 120×60×40cm (1/2 sofa length, 30-40cm from sofa)
TV console: 180×40×50cm
Area rug: extend 30cm beyond sofa each side
```

### Bedroom
```
King bed: 200×200cm (mattress)
Queen bed: 160×200cm
Nightstand: 50×40×60cm (each side)
Wardrobe: 120-200×60×210cm
Bench end-of-bed: 120×40×45cm
```

### Dining
```
4-seater table: 140×80cm
6-seater table: 180×90cm
8-seater table: 240×100cm
Chair clearance: 60cm pulled out
Walkway around table: 90cm
```

### Kitchen
```
Island: 240×100×90cm (with seating overhang)
Walkway between counter: 110-120cm
Counter height: 90cm (standing), 75cm (seated)
Upper cabinet bottom: 50cm above counter
```

---

## Bathroom Standards (codes)

```
Toilet space: 90×120cm minimum
Shower minimum: 80×80cm (90×90 comfortable)
Bathtub: 170×80cm standard
Vanity height: 85cm (standard), 90cm (tall user)
Mirror at eye level: 1.5-1.8m
GFCI outlet at vanity (Thai standard)
Slope floor 1-2% to drain
```

---

## Common Pitfalls

❌ Sofa pressed against wall (lonely island feel) — pull 10-30cm away
❌ Coffee table too small (< 1/2 sofa length)
❌ Rug too small (sofa legs OFF rug = looks cheap)
❌ Single overhead light (flat shadowless)
❌ TV mounted too high (eye level when sitting!)
❌ Curtain rod at window frame (extend rod 15cm beyond + 5cm above)
❌ Matchy furniture set bought together (looks like showroom)
❌ Trendy color paint (changes too fast — accent in pillow/art instead)

---

## Style References (designers/magazines to cite)

| Style | Designer/Magazine |
|-------|-------------------|
| Japandi | Norm Architects, Studio KO, Kinfolk |
| Mid-century | Eames, Saarinen, Don Draper office |
| Industrial | Brooklyn loft, Restoration Hardware |
| Tropical | Bensley, Bill Bensley Studio, Habita |
| Wabi-sabi | Axel Vervoordt, Vincent Van Duysen |
| Classic | Maison de Vacances, AD France |
| Mediterranean | Studio Andrew Trotter, Athena Calderone |
| Boho luxe | Justina Blakeney, Athena Calderone |
| Maximalist | Kelly Wearstler, Luke Edward Hall |
| Brutalist | Tadao Ando interior, exposed concrete |
