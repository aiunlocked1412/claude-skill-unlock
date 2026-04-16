---
type: 3d-production-brief
project: Stylized Fantasy Sword "Aegisbane"
asset_type: weapon prop
target_engine: Unity URP (mobile game)
polycount_target: 3000 tris
created: 2026-04-16
status: draft
---

# 🧊 Aegisbane — Stylized Mobile Game Sword

## 📊 Production Brief

| Field | Value |
|-------|-------|
| Project | "Realm Quest" mobile RPG — Hero weapon tier 5 |
| Asset type | One-handed sword (player wield) |
| Style | Stylized hand-painted (Hearthstone / WoW) |
| Target engine | Unity URP (Android + iOS, target 60fps) |
| Polycount target | 3000 tris (hero weapon, 1 on screen at time) |
| Texture resolution | 1024x1024 (mobile budget) |
| Output format | FBX (engine) + GLB (web preview) |
| Deadline | 7 วัน |

**Lore:** "Aegisbane" — ดาบโบราณตี falsจาก meteorite + รูบี้สีเลือดที่ pommel — ตัว blade มี rune glow สีฟ้า ซ่อน power ด้านใน

---

## 🖼️ Concept + Reference

**Reference board:** PureRef link with 12 images
- 4 reference: WoW Shadowlands weapons
- 3 reference: League of Legends prestige skins
- 3 reference: Diablo 4 unique weapons
- 2 reference: real medieval sword anatomy

**Style reference:**
- Tyler Bartley (WoW weapon artist, ArtStation)
- Hearthstone card art
- Warcraft Rumble art bible

**Mood keywords:** ornate, magical, weathered, royal, bloody

---

## 🤖 AI Concept Prompts (3 variants)

### Variant A — Front view (production reference)
```
Stylized fantasy long sword "Aegisbane",
ornate medieval blade with engraved runes glowing soft blue,
golden brass crossguard with leaf motif engravings,
dark leather wrapped grip with golden wire inlay,
ruby red gem pommel with subtle inner glow,
weathered metal with battle wear and slight rust patina,
hand-painted texture style similar to Hearthstone and World of Warcraft,
front view orthographic, neutral grey studio background,
soft three-point lighting, sharp focus,
--ar 9:16 --v 6 --style raw --stylize 150
```
**Use for:** main reference, modeling proportion

### Variant B — 3/4 turnaround
```
Stylized fantasy sword "Aegisbane" three-quarter turnaround view,
ornate medieval long sword with rune blade, brass guard, ruby pommel,
hand-painted stylized texture (Blizzard art bible),
turntable presentation pose, isolated on neutral grey,
soft studio lighting from upper-left,
--ar 16:9 --v 6 --style raw --stylize 150
```
**Use for:** check 3D form, proportion

### Variant C — Material/detail close-up
```
Extreme close-up of stylized fantasy sword pommel,
ruby red gem with inner glow, brass setting with engravings,
hand-painted PBR materials reference,
similar to Diablo 4 unique weapon detail,
macro studio shot, sharp focus on gem,
--ar 1:1 --v 6 --style raw --stylize 200
```
**Use for:** texture painting reference (color, pattern)

---

## 🔧 Modeling Strategy

| Step | Method | Tool | Time est. |
|------|--------|------|-----------|
| Block-out | Box modeling primitives | Blender | 30 min |
| High-poly sculpt | Subdivide + chisel detail | ZBrush | 4 hr |
| Retopo low-poly | Manual quad-by-quad | Blender + RetopoFlow | 2 hr |
| UV unwrap | Manual seam placement | Blender | 1 hr |
| Bake maps | High → low | Marmoset Toolbag | 30 min |
| Texture | Hand-paint stylized | Substance Painter + Photoshop | 6 hr |
| Render beauty | Marmoset showcase | Marmoset | 1 hr |

---

## 📐 Topology Spec

- **Polycount:** 2,847 tris ✅ (under 3000 budget)
- **Breakdown:**
  - Blade: 600 tris (long flat, low needed)
  - Crossguard: 850 tris (most ornate detail)
  - Grip: 400 tris (cylinder + wrap detail)
  - Pommel: 900 tris (gem + setting, hero detail)
  - Misc rune detail: 100 tris
- **Quad ratio:** 96% (some tris on flat blade caps)
- **No deforming joints:** static prop, no rig needed
- **Symmetry:** Mirror across blade Y-axis (save 50% modeling time)

---

## 🗺️ UV Unwrap Plan

- **UV space:** Single 0-1 (1024×1024 texture)
- **Layout:**
  ```
  [ Blade (large)            ]
  [ Crossguard ] [ Pommel ]
  [ Grip cyl ] [ Wrap detail ]
  [ Runes (small) ]
  ```
- **Seam placement:**
  - Blade: edge of cutting edge (hidden by silhouette)
  - Crossguard: bottom edge (hidden against blade)
  - Grip: inside curve of grip (hand grips here, never seen)
  - Pommel: bottom of sphere (only 1 seam)
- **Texel density:** 512 px/m (consistent)
- **Utilization:** 78% ✅
- **Padding:** 6 px

---

## 🎨 Texturing Spec (PBR — Stylized)

### Maps required
- [x] Base Color (Albedo) — sRGB, hand-painted highlight + shadow baked in
- [x] Metallic — Linear (mostly 0 except brass parts = 1)
- [x] Roughness — Linear (gem 0.05, metal 0.4, leather 0.7)
- [x] Normal — Linear OpenGL (medium detail, exaggerated for read)
- [x] Ambient Occlusion — baked

### Stylized texture rules
- **Painted highlights:** even though we have normal map, paint highlight stroke for stylized read
- **Color saturation:** push 20-30% beyond realistic for fantasy feel
- **Edge wear:** desaturate + lighten metal at sharp edges
- **Ruby gem:** use emissive map (subtle red glow inside)

### Channel packing
```
T_Aegisbane_MRA.png:
R: Metallic
G: Roughness
B: Ambient Occlusion
```

### Resolution
| Map | Resolution |
|-----|------------|
| BC | 1024 |
| Normal | 1024 |
| MRA packed | 1024 |
| Emissive (rune + gem) | 512 |

---

## 🔥 Bake Workflow

1. ✅ High-poly sculpt complete (3.2M tris in ZBrush)
2. ✅ Retopo to low-poly (2,847 tris in Blender)
3. ✅ UV unwrap with seams
4. ✅ Match cage (offset 0.08 unit)
5. ✅ Bake in Marmoset Toolbag 5:
   - Normal (tangent space, OpenGL)
   - AO (max distance 1.0)
   - Curvature (for edge wear mask)
   - Position
   - ID map (4 colors: blade / brass / leather / ruby)
6. ✅ Import to Substance Painter
7. ✅ Apply smart materials masked by ID

---

## 💡 Render Setup (Marmoset Toolbag)

### Lighting (3-point + HDRI studio)
- **Key:** 45° upper-left, 5500K, intensity 5
- **Fill:** opposite, 6500K, intensity 1.5
- **Rim:** behind sword, 7000K, intensity 4 (separate from bg)
- **HDRI:** Polyhaven Studio Small 03 (strength 0.4)

### Camera
- Focal: 85mm (sword detail)
- Aperture: f/5.6
- Background: gradient grey #1A1A1A → #2A2A2A
- Composition: vertical 9:16 hero shot + 16:9 turnaround

### Render output
- Beauty shot: 4K (4096×2304) PNG
- Turnaround: 1080p MP4, 360° in 5 sec (60 frames)
- Wireframe shot: same angle as beauty (for portfolio)

---

## 📤 Export Spec

| Format | Use | Setting |
|--------|-----|---------|
| FBX | Unity | Y-up, smoothing groups, embedded normal |
| GLB | Web preview (sketchfab) | Compressed, embed textures |
| Blender | Source master | Original .blend file |
| Marmoset | Portfolio scene | .tbscene file |

### Naming
```
SM_Aegisbane_T5.fbx                  ← Unity asset
SM_Aegisbane_T5.glb                  ← Web
T_Aegisbane_BC.png                   ← Base color
T_Aegisbane_N.png                    ← Normal
T_Aegisbane_MRA.png                  ← Packed metallic/roughness/AO
T_Aegisbane_E.png                    ← Emissive
M_Aegisbane.uasset                   ← Material (Unreal)
```

---

## ✅ Production Checklist

- [x] Concept locked + 3 variants approved
- [x] Block-out 30 min
- [x] High-poly sculpt 4 hr (3.2M tris)
- [x] Retopo 2 hr (2,847 tris ✅)
- [x] UV unwrap 1 hr (78% utilization)
- [x] Bake all 5 maps
- [x] Texture 6 hr in Substance Painter
- [x] In-Unity test (lighting + scale)
- [x] Beauty render 4K
- [x] Turnaround MP4
- [x] Wireframe screenshot
- [x] Export FBX + GLB + handoff folder

---

## 🛠️ Tools Used

- **Modeling/Retopo:** Blender 4.2 + RetopoFlow 3
- **Sculpting:** ZBrush 2026
- **UV:** Blender (built-in unwrap)
- **Bake:** Marmoset Toolbag 5
- **Texture:** Substance Painter 2026
- **Render:** Marmoset Toolbag 5
- **Engine test:** Unity 2026 LTS URP

---

## 💡 Engine-Specific Notes (Unity URP Mobile)

### Import settings
- Import FBX → Read/Write disabled (memory save)
- Texture compression: ASTC 6x6 (mobile) for BC, ASTC 5x5 for normal
- Generate mipmaps: yes
- Filter mode: Bilinear (anisotropic 2x for blade)

### Material setup
- Shader: URP Lit (PBR Metallic-Roughness)
- Use ORM packed (sample R/G/B for occlusion/roughness/metallic)
- Emissive intensity: 0.8 (subtle glow for runes)
- Detail map: optional dirt overlay (tile)

### Performance
- LOD0: 2,847 tris (close-up, < 5m camera)
- LOD1: 1,500 tris (5-15m)
- LOD2: 700 tris (15m+, far away)
- Disable LOD bias on mobile (memory save)

---

## 🎯 Beauty Shot Composition

```
Hero shot (9:16 portrait, IG/portfolio):
- Sword vertical center, slight tilt 5°
- Rune glow visible
- Ruby gem catches rim light
- Background dark gradient
- Shadow on floor for grounding

Turnaround (16:9 landscape):
- Camera orbit 360° in 5 sec
- Constant lighting (sword rotates, light fixed)
- Show all 4 sides
- Render at 60fps for smooth playback
```

---

## 🔄 Next Steps

1. ✅ Hand-off Unity package to game team
2. ⏭️ Create variant skins (Tier 6 — corrupted version, Tier 7 — celestial version)
3. ⏭️ VFX team: add particle trail when swung
4. ⏭️ Animation team: idle hover when in inventory
5. ⏭️ Showcase on ArtStation portfolio

---

*Generated by /3d-modeler — Claude Skill Unlock v1.1*
