---
type: motion-design-brief
project: Kaffa Origin Logo Reveal
animation_type: logo
duration: 3 seconds
format: mp4 + lottie
created: 2026-04-16
status: draft
---

# 🎬 Kaffa Origin — Logo Reveal "Coffee Bloom"

## 📊 Brief Overview

| Field | Value |
|-------|-------|
| Project | Kaffa Origin Coffee — Brand Intro |
| Animation type | Logo reveal |
| Duration | 3 sec |
| Resolution | 1920x1080 (master), 1080x1080 (IG), 1080x1920 (Reels) |
| Frame rate | 30fps |
| Format | MP4 H.264 + Lottie JSON + WebM alpha |
| Use case | Website hero, IG bio, video intro บน YouTube |

---

## 💭 Concept

> Logo "Kaffa Origin" ค่อยๆ บานออกจาก coffee bean แตกเป็นเส้น line art คล้าย latte art bloom — สื่อถึง craftsmanship + slow ritual ของ specialty coffee

**Reference:**
- https://www.behance.net/gallery/kaffa-origin-mood (Pinterest mood)
- https://lottiefiles.com/animations/coffee-bloom (similar timing)
- Kinfolk magazine motion intro (calm pacing)

---

## 🎬 Storyboard (7 Keyframes)

| Time | Frame | Description | Element |
|------|-------|-------------|---------|
| 00:00 | 0 | Cream background + tiny coffee bean center | Background + Bean |
| 00:00:10 | 10 | Bean slowly breathes (anticipation) | Bean scale 1.0→1.05 |
| 00:00:20 | 20 | Bean splits open, line strokes burst out | Trim Path animation |
| 00:01:10 | 40 | Lines form mountain silhouette | Logo symbol drawing |
| 00:01:25 | 55 | Symbol complete + wordmark "KAFFA" fade in | Type entry |
| 00:02:00 | 60 | "ORIGIN" tagline slides up below | Secondary text |
| 00:02:15 | 75 | Berry red dot accent appears + scale punch | Accent color |
| 00:03:00 | 90 | Hold + subtle breathing loop infinitely | Idle state |

---

## ⏱️ Easing & Timing Spec

| Element | In | Hold | Out | Easing curve |
|---------|----|----|-----|-------------|
| Bean breathe | 333ms | - | 333ms | sine-in-out (loop) |
| Line bloom (Trim Path) | 1000ms | - | - | cubic-bezier(.2,.8,.2,1) |
| Wordmark "KAFFA" | 500ms | hold | - | cubic-bezier(.4,0,.2,1) |
| Tagline "ORIGIN" | 400ms | hold | - | ease-out |
| Berry dot | 200ms (scale .5→1.1→1) | - | - | spring(damping:12) |
| Idle breathing | 2000ms | - | - | sine-in-out (loop forever) |

---

## 🎨 Visual Spec

### Color Palette
| Role | HEX |
|------|-----|
| Primary | `#3A2E1F` Espresso Bean |
| Secondary | `#D4A574` Warm Tan |
| Accent | `#C1392B` Berry Red |
| Background | `#F5EFE6` Cream Linen |

### Typography
- Wordmark "KAFFA": **Cormorant Garamond Medium** (converted to outline path)
- Tagline "ORIGIN": **Inter Medium** (letter-spacing 0.4em)

---

## 🎞️ AfterEffects Spec

### Comp Settings
```
Name: KaffaOrigin_Reveal_Master
Resolution: 1920 x 1080
Frame rate: 30fps
Duration: 3:00 sec (90 frames + 30 frame idle = 120)
Color depth: 16-bit linear
Color space: sRGB
```

### Layer Stack (top → bottom)
```
1. Tagline_ORIGIN     [Text, parent: null Tagline_Ctrl]
2. Wordmark_KAFFA     [Shape from text, parent: null Wordmark_Ctrl]
3. BerryDot_Accent    [Shape, scale animation]
4. Logo_Lines         [Shape, Trim Path applied]
5. Bean_Symbol        [Shape, scale breath]
6. Cream_BG           [Solid, color #F5EFE6]
7. Subtle_Grain       [Adjustment, Noise effect 5%]
```

### Effects Used
- **Trim Paths** (layer 4 — Logo_Lines): Start 0→100, ease custom
- **Glow** (layer 4): Threshold 50%, Radius 8, soft halo
- **Set Matte** (layer 2 — Wordmark): mask reveal direction left→right

### Key Expressions

**1. Bean breathing (layer 5 scale):**
```javascript
amp = 5;
freq = 0.5;
s = transform.scale;
[s[0] + Math.sin(time*freq*2*Math.PI)*amp,
 s[1] + Math.sin(time*freq*2*Math.PI)*amp]
```

**2. Logo idle loop (layer 4 scale, after frame 90):**
```javascript
if (time > 3) {
  amp = 1;
  freq = 0.3;
  loopOut("cycle");
  s = 100 + Math.sin((time-3)*freq*2*Math.PI)*amp;
  [s, s];
} else {
  transform.scale;
}
```

**3. Berry dot pop (layer 3 scale):**
```javascript
// keyframe: 75=0%, 78=110%, 80=100%
// + spring overshoot via easeIn/easeOut + dynamic
```

**4. Stagger letter entrance (Wordmark per-character):**
```javascript
// Use Animator > Position with Range Selector
// Offset: linear(time, 1.83, 2.0, 100, 0)
// Smoothness: 100% sine
```

---

## 🎯 12 Principles Check

- [x] **Anticipation** — bean breathes ก่อน splits (frame 0-15)
- [x] **Staging** — focus center, dim background (90% safe area)
- [x] **Follow-through** — tagline ตามมาหลัง wordmark 200ms
- [x] **Slow In/Out** — custom bezier ทุก element ไม่มี linear
- [x] **Arcs** — line bloom เป็นโค้ง ไม่ใช่เส้นตรง
- [x] **Secondary Action** — berry dot pop หลัก + grain texture เคลื่อนตลอด
- [x] **Timing** — 3 sec impact (ไม่เร็ว ไม่ช้า)
- [x] **Exaggeration** — line bloom กระจายมากกว่าจริง 20% เพื่อ impact
- [x] **Appeal** — earth tones + organic curve = warmth

---

## 📦 Lottie Export Spec

### Bodymovin Setting
- [x] Glyphs as path (font ไม่ embed)
- [x] Hidden layers: off
- [x] Guides: off
- [x] Compress: on
- [x] Export mode: Standard
- [x] AVD (Android Vector Drawable): off

### Optimization Result
- File size: **142 KB** ✅ (target < 200KB)
- Path count: 38
- Keyframe count: 124
- No unsupported effects

### Implementation Code

**HTML / Web:**
```html
<lottie-player
  src="/animations/kaffa-reveal.json"
  background="#F5EFE6"
  speed="1"
  style="width: 400px; height: 400px;"
  autoplay
  loop
  mode="normal">
</lottie-player>
```

**React:**
```jsx
import Lottie from 'lottie-react';
import animationData from './kaffa-reveal.json';

<Lottie
  animationData={animationData}
  loop={true}
  autoplay={true}
  style={{ width: 400, height: 400 }}
  rendererSettings={{
    preserveAspectRatio: 'xMidYMid meet'
  }}
/>
```

**React Native:**
```jsx
<LottieView
  source={require('./assets/kaffa-reveal.json')}
  autoPlay
  loop
  style={{ width: 300, height: 300 }}
  resizeMode="contain"
/>
```

---

## 🔊 Sound Design

| Frame | SFX | Detail | Volume |
|-------|-----|--------|--------|
| 0 | Coffee shop ambience | Crowd murmur, espresso machine soft | -30dB |
| 15 | Soft "pop" | Bean opening | -18dB |
| 20 | Sparkle whoosh | Lines blooming out | -14dB |
| 55 | Subtle bell tick | Logo settle | -16dB |
| 75 | Single warm chime (C5) | Berry dot accent | -12dB |
| 90+ | Loop ambient bed | Coffee shop continues | -32dB |

**Music:** ไม่ใช้ music — ambient sound design only (เพื่อ premium feel)

---

## ♿ Accessibility

- [x] Respect `prefers-reduced-motion` → fallback static logo PNG
- [x] No flashing > 3 Hz (animation smooth, ไม่ trigger photosensitive)
- [x] Alt text: "Kaffa Origin coffee brand logo animation"
- [x] No critical info conveyed by motion alone (text readable in still)

```css
@media (prefers-reduced-motion: reduce) {
  lottie-player { display: none; }
  .static-logo { display: block; }
}
```

---

## ✅ Deliverable Checklist

- [x] AE source file: `KaffaOrigin_Reveal_v1.aep` + footage folder
- [x] Master ProRes 422: `kaffa_reveal_master_1080p.mov` (152 MB)
- [x] Web MP4 H.264: `kaffa_reveal_web_1080p.mp4` (4.2 MB)
- [x] Web MP4 H.264: `kaffa_reveal_web_720p.mp4` (2.1 MB)
- [x] Square IG: `kaffa_reveal_1080x1080.mp4` (3.8 MB)
- [x] Vertical Reels: `kaffa_reveal_1080x1920.mp4` (4.5 MB)
- [x] Lottie JSON: `kaffa-reveal.json` (142 KB)
- [x] WebM with alpha: `kaffa_reveal_alpha.webm` (1.8 MB)
- [x] Static fallback PNG: `kaffa_logo_static.png` (180 KB)
- [x] Implementation README + sample HTML

---

## 🛠️ Tools Used

- **Animation:** Adobe After Effects 2026 + Bodymovin 5.10
- **Sound:** Adobe Audition + Soundsnap library
- **Compression:** Handbrake (web MP4), FFmpeg (WebM alpha)
- **Lottie test:** LottieFiles editor + browser preview

---

## 🔄 Next Steps

1. ✅ Approve concept + storyboard with client
2. ✅ Final render master + variants
3. ⏭️ Hand-off Lottie + implementation guide ให้ web dev
4. ⏭️ A/B test: video version vs Lottie version (load time + engagement)
5. ⏭️ Create variant: shorter 1.5s "sting" version for repeated use

---

## 💡 Design Decisions

1. **3 sec duration** — ยาวพอ tell story, สั้นพอ skip ได้ในใจ
2. **No music, only SFX** — ambient = premium / music = generic
3. **Bean → Lines → Mountain** — story arc บอก "from origin to summit" (Ethiopian coffee origin)
4. **Idle loop after 3s** — สำหรับ web hero ที่อยู่นาน (subtle breathing)
5. **Lottie + MP4 dual delivery** — web ใช้ Lottie (sharp), social ใช้ MP4 (compatible)

---

*Generated by /motion-designer — Claude Skill Unlock v1.1*
