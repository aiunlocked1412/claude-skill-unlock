# 3D Production Reference + AI Concept Prompt

> Topology rules, UV/bake workflow, PBR texturing, AI 3D generation prompt

---

## Polycount Budget Reference

### Mobile Game (target 60fps on mid-range device)
| Asset | Tris | Notes |
|-------|------|-------|
| Hero character | 8-15K | 1 character on screen |
| NPC | 3-8K | 5-10 simultaneous |
| Weapon | 1-3K | Held by character |
| Prop small | 200-800 | Decoration |
| Building | 5-20K | Modular pieces |
| Vehicle | 5-15K | Player vehicle |

### Console / PC (60fps)
| Asset | Tris |
|-------|------|
| Hero character | 30-80K |
| Vehicle | 30-100K |
| Environment hero | 50-200K |

### Cinematic / Pre-rendered
| Asset | Tris |
|-------|------|
| Hero character (Pixar quality) | 1-10M |
| No real limit | sub-d ก่อน render |

---

## Topology Rules

### Quads vs Tris vs N-gons
```
✅ QUAD       ❌ N-GON      ⚠️ TRI (OK if flat)
┌──────┐     ┌────────┐    ┌────┐
│      │     │        │    │   /
│      │     │   ○    │    │  /
└──────┘     │        │    │ /
             └────────┘    └/
4 edges      5+ edges      3 edges
```

### Edge Flow Rules
- Follow muscle/contour direction
- Loop รอบ deforming joint:
  - Shoulder, Elbow, Wrist
  - Hip, Knee, Ankle
  - Eye, Mouth, Eyebrow
- Pole = vertex with > 4 edges → ใช้แค่จำเป็น (5-pole OK, 6+ ไม่ดี)
- Avoid:
  - T-junctions (shading break)
  - Triangulation บน deforming area
  - Long thin quads (texturing weird)

### Topology Pattern Library

**Cylinder cap (avoid pole at center):**
```
   ┌─┬─┐
   │ │ │
   ├─┼─┤
   │ │ │
   └─┴─┘
   (4-sided pole grid, not radial)
```

**Sphere subdivision:** ใช้ ico-sphere (regular) > UV sphere (poles)

---

## UV Unwrap Best Practices

### Seam Placement
- **Hidden seams:**
  - Under arm (character)
  - Behind ear / hairline
  - Inside leg
  - Bottom of object
- **Avoid seam in:**
  - Center of face
  - Visible front
  - High-detail area

### Texel Density
> Consistent texel density = quality consistent
> Use checker map UV test (1024x1024 grid)

```
Recommended:
- Character hero: 2048 px/m
- Environment prop: 512 px/m
- Background terrain: 256 px/m
```

### UDIM (Hero asset)
- 1 tile = 1 unique 4K texture
- Common: 4-8 tiles for hero character (face / body / hair / accessories)
- Tile naming: 1001, 1002, 1011, 1012 (10NN UV grid)

### UV Layout Tips
- Pack > 70% utilization
- Mirror symmetric parts (save UV space)
- Straighten UV where possible (axis-aligned)
- Padding 4-8 px between islands (avoid bleed)

---

## PBR Texturing Maps

### Required maps (Metallic-Roughness workflow)

| Map | Purpose | Format | Color space |
|-----|---------|--------|-------------|
| Base Color (Albedo) | Raw color | RGB 8-bit | sRGB |
| Metallic | 0 = dielectric, 1 = metal | Grayscale 8-bit | Linear |
| Roughness | 0 = mirror, 1 = matte | Grayscale 8-bit | Linear |
| Normal | Surface detail | RGB 8-bit | Linear (OpenGL or DX) |
| AO | Crevice shadow | Grayscale 8-bit | Linear |
| Height | Parallax detail | Grayscale 16-bit | Linear |
| Emissive | Self-glow | RGB 8-bit | sRGB |
| Opacity | Transparency | Grayscale 8-bit | Linear |

### Channel Packing (optimization)
```
Common pack:
R: Metallic
G: Roughness
B: AO
A: (free or height)

Saves 2 textures → 1 texture (mobile-friendly)
```

### Texture Resolution Guide
| Asset | Mobile | Console | Cinematic |
|-------|--------|---------|-----------|
| Hero character | 1K | 2K | 4K UDIM |
| Important prop | 512 | 1K | 2K |
| Background | 256 | 512 | 1K |
| Tileable | 1K | 2K | 4K |

---

## Bake Workflow (High → Low poly)

```
Step 1: Sculpt high-poly (ZBrush / Blender Sculpt)
        - 2-10M tris
        - All detail captured

Step 2: Retopo to low-poly
        - Match polycount budget
        - Clean topology
        - UV unwrap

Step 3: Match cage (envelope around low-poly)
        - 0.05-0.1 unit offset
        - Helps ray hit high-poly

Step 4: Bake maps in Substance Painter / Marmoset
        - Normal (object/tangent space)
        - AO (curvature crevice)
        - Curvature (edge wear)
        - Position (world XYZ)
        - Thickness (translucency)
        - ID map (auto material zones)

Step 5: Texture in Substance Painter
        - Use baked maps as masks
        - Smart materials apply cleanly
```

### Bake Settings Cheat Sheet
- **Resolution:** target × 2 (then downsample for AA)
- **Anti-aliasing:** 4x or 8x
- **Padding:** 4-8 px (avoid seam)
- **Use cage:** yes (Marmoset/Substance)
- **Match by:** mesh name (Marmoset suffix `_high` / `_low`)

---

## Lighting Setup (3-point + HDRI)

### Standard 3-point
```
       Key Light (45° front-side)
            ↘
    Subject ←  Fill (opposite, 1/4 intensity)
            ↗
       Rim Light (back, separate from bg)
```

### Color Temperature
- 3200K — warm tungsten (interior)
- 5500K — daylight (default neutral)
- 7000K — cool overcast

### HDRI for ambient
- Polyhaven (free CC0): https://polyhaven.com
- Use 4K+ HDRI for hero render
- Rotate HDRI to align key light direction
- Strength 0.3-0.8 (ambient fill, not key)

### Render Engine Setting
**Cycles (Blender — physical):**
- Samples: 256 (preview), 1024-4096 (final)
- Denoiser: OptiX / OpenImageDenoise
- Light bounces: 8 (default), 12 (high quality)

**Eevee (Blender — real-time):**
- Sample: 32 viewport, 128 render
- Bloom + AO + SSR enabled
- Indirect lighting bake (light cache)

**Marmoset Toolbag (preview/portfolio):**
- 1080p / 4K
- Real-time + ray-traced AO + GI
- Best for game asset portfolio

---

## File Format Decision

| Format | Use case | Notes |
|--------|----------|-------|
| **FBX** | Industry standard | Animation + skin |
| **GLB / GLTF** | Web / WebXR / AR | Compressed, modern |
| **OBJ** | Static mesh | No animation |
| **USDZ** | Apple AR Quick Look | iOS only |
| **USD** | Pixar, Omniverse | Complex scene |
| **Alembic (.abc)** | VFX cache | Cinema 4D / Houdini |
| **STL** | 3D print | No texture |

---

## AI 3D Generation Tools (2026)

### Tools comparison
| Tool | Output quality | Topology | Use case |
|------|---------------|----------|----------|
| **Tripo3D** | High | Medium (need retopo) | Concept fast |
| **Meshy** | High | Medium | Game prototype |
| **Luma Genie** | Medium | Poor | Reference only |
| **Rodin** | Very high | Good | Production-ready |
| **3DFY** | Photo-realistic | Industrial | Product viz |
| **CSM (Common Sense Machines)** | Stylized | Good | Game asset |

### AI 3D Prompt Formula
```
[STYLE], [SUBJECT + DETAIL],
[VIEW: front view / 3/4 view / character turnaround],
[T-pose / A-pose for character],
[TOPOLOGY hint: low-poly / high-poly],
[REFERENCE artist or game style],
plain background, neutral lighting,
--ar 1:1 --v 6 --style raw
```

### Example (Game asset)
```
Low-poly stylized fantasy sword,
medieval long sword with carved hilt and ruby gem pommel,
hand-painted texture style similar to Hearthstone or World of Warcraft,
front view + side view turnaround,
3000 triangle target polycount,
neutral grey background, three-quarter studio lighting,
--ar 16:9 --v 6 --style raw --stylize 150
```

---

## Pipeline Conventions

### Naming convention (Unreal style)
```
SM_<AssetName>_<Variant>     → Static Mesh
SK_<CharacterName>           → Skeletal Mesh
T_<TextureName>_<Type>       → Texture (BC, N, MRA)
M_<MaterialName>             → Material
MI_<MaterialName>_<Variant>  → Material Instance
```

### Folder structure
```
/Project
  /Assets
    /Characters
      /Hero
        Hero.blend
        Hero.fbx
        Hero_high.zpr (ZBrush)
        /Textures
          T_Hero_BC.png
          T_Hero_N.png
          T_Hero_MRA.png  (packed: M=R, R=G, AO=B)
    /Environments
    /Props
  /References
  /Renders
```

### Coordinate System
| Software | Up axis |
|----------|---------|
| Blender | Z+ |
| Maya | Y+ |
| Unreal | Z+ |
| Unity | Y+ |
| Cinema 4D | Y+ |

> ตอน export FBX: ระบุ axis conversion ให้ตรง engine

---

## Common Pitfalls

❌ N-gons (ห้ามขาด)
❌ Polycount เกิน budget
❌ Texel density ไม่ consistent → seam visible
❌ Forget normal map color space (sRGB vs linear) → wrong shading
❌ Y-up vs Z-up confusion → asset rotated 90°
❌ Scale unit ผิด (cm vs m) → 100x too big/small
❌ Bake แบบ symmetric overlap → seam at center
❌ ใช้ specular workflow (legacy) → use metalness
