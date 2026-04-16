# Motion Design Patterns + AfterEffects Expressions

> Reference สำหรับ animation principle, easing, AE expression, Lottie spec

---

## 12 Principles of Animation (Disney)

| # | Principle | Apply when |
|---|-----------|------------|
| 1 | Squash & Stretch | Bouncing ball, organic char |
| 2 | Anticipation | ก่อน action ใหญ่ (jump, punch) |
| 3 | Staging | Focus subject, camera angle |
| 4 | Straight Ahead vs Pose-to-Pose | Fluid (fire/water) vs deliberate |
| 5 | Follow Through & Overlapping | Hair, cloth, secondary part |
| 6 | Slow In & Slow Out | Easing — ไม่ใช่ linear |
| 7 | Arcs | Natural movement = curved path |
| 8 | Secondary Action | Detail (blink while talking) |
| 9 | Timing | Mass + emotion |
| 10 | Exaggeration | Push reality for clarity |
| 11 | Solid Drawing | Volume + perspective |
| 12 | Appeal | Charisma — ดูแล้วน่ารัก |

---

## Easing Curves Reference

### CSS / Web
```
ease         → cubic-bezier(.25,.1,.25,1)   /* default */
ease-in      → cubic-bezier(.42,0,1,1)      /* slow start */
ease-out     → cubic-bezier(0,0,.58,1)      /* slow end — UI in */
ease-in-out  → cubic-bezier(.42,0,.58,1)    /* both sides */

/* Custom recommended for UI 2026 */
material-standard → cubic-bezier(.4,0,.2,1)
material-decel    → cubic-bezier(0,0,.2,1)
material-accel    → cubic-bezier(.4,0,1,1)
ios-spring        → cubic-bezier(.5,0,.4,1.4)
playful-back      → cubic-bezier(.68,-.55,.27,1.55)
```

### Duration Guideline (UI)
| Action | Duration |
|--------|----------|
| Microinteraction (button hover) | 100-150ms |
| Element entering | 200-300ms |
| Modal/sheet | 300-400ms |
| Page transition | 400-500ms |
| Cinematic | 600-1000ms |

> Rule: ใช้เร็วสำหรับ feedback / ช้าสำหรับ context change

---

## AfterEffects Expressions Library

### Loop animation
```javascript
// loop forever
loopOut("cycle");
loopOut("pingpong");
loopOut("offset"); // continuous progression
```

### Wiggle (random)
```javascript
wiggle(2, 30); // freq 2/s, amplitude 30
// position with seed
seedRandom(index, true);
wiggle(5, 20);
```

### Bounce (spring physics)
```javascript
amp = 0.1;
freq = 2.0;
decay = 4.0;
n = 0;
if (numKeys > 0) n = nearestKey(time).index;
if (key(n).time > time) n--;
if (n == 0) {
    t = 0;
} else {
    t = time - key(n).time;
}
if (n > 0) {
    v = velocityAtTime(key(n).time - thisComp.frameDuration/10);
    value + v * amp * Math.sin(freq*t*2*Math.PI) / Math.exp(decay*t);
} else {
    value;
}
```

### Auto-orient along path
```javascript
// applied to rotation of layer following path
delta = 0.1;
p1 = transform.position.valueAtTime(time);
p2 = transform.position.valueAtTime(time + delta);
delta_x = p2[0] - p1[0];
delta_y = p2[1] - p1[1];
radiansToDegrees(Math.atan2(delta_y, delta_x));
```

### Time remap (slow-mo on cue)
```javascript
linear(time, 0, 2, 0, 1) // play 0-2s mapping to 0-1s of source
```

### Counter (number tween)
```javascript
start = 0;
end = 100;
dur = 2;
linear(time, 0, dur, start, end).toFixed(0);
```

---

## Animation Recipes

### 🎯 Logo Reveal (3-second)

```
Frame 0    : Black screen + dust particles
Frame 12   : Particles converge (CC Particle World, gravity 0)
Frame 24   : Letter strokes start drawing (Trim Path 0→100)
Frame 48   : Logo fully formed + scale punch (101% → 100%)
Frame 60   : Tagline fade in (opacity 0→100, ease-out)
Frame 72-90: Hold + subtle breathing loop (scale 100→101→100)

Total: 3 sec @ 30fps = 90 frames
```

### 🎬 UI Button Press (300ms)

```
0ms   : Default state
100ms : Scale 0.96 + bg color darken 10% (haptic light)
150ms : Loading spinner appears (replace icon)
300ms : on success → checkmark morph (success haptic)
500ms : Fade back to default
```

### 📊 Bar Chart Reveal (1.5s stagger)

```
Bar 1: Frame 0  → 0:30  (grow from 0 to value, ease-out cubic)
Bar 2: Frame 6  → 0:36  (delay 200ms)
Bar 3: Frame 12 → 0:42
Bar 4: Frame 18 → 0:48
Label fade-in: stagger 100ms after each bar
```

### 🌟 Particle Loop (Lottie-friendly)

```
- 5-10 particle layers
- random delay per layer (use index expression)
- opacity 0 → 100 → 0 (fade in/out)
- position rise vertical 100px
- scale 0.5 → 1.2 → 0.8
- duration 2-3s, loopOut("cycle")
```

---

## Lottie Best Practices

### Optimization checklist
- [ ] Convert text → outline path (font ไม่ embed)
- [ ] Trim layers ที่ไม่ visible
- [ ] ลด keyframe (auto: bezier vs hold)
- [ ] ห้ามใช้ effects ที่ไม่ support (particle, time remap, blur บางตัว)
- [ ] Round path (ลด anchor point)
- [ ] Export setting: glyph as path, no expressions
- [ ] Target file size < 200KB

### Bodymovin export setting
```json
{
  "glyphs": false,
  "hiddenLayers": false,
  "guideLayers": false,
  "compress": true,
  "exportMode": "standard"
}
```

### Web implementation (lottie-web)
```html
<div id="lottie-anim"></div>
<script src="lottie.min.js"></script>
<script>
  lottie.loadAnimation({
    container: document.getElementById('lottie-anim'),
    renderer: 'svg',
    loop: true,
    autoplay: true,
    path: 'animation.json'
  });
</script>
```

### React Native (lottie-react-native)
```jsx
<LottieView
  source={require('./animation.json')}
  autoPlay
  loop
  style={{ width: 200, height: 200 }}
/>
```

---

## Format Decision Tree

```
ต้อง animation บน web/app?
├── < 200KB possible? → Lottie JSON ✅
├── Need video footage? → MP4 / WebM
├── Looping background? → CSS animation / SVG
└── Complex interaction? → Rive (.riv)

ต้อง animation บน video?
├── Final cut? → ProRes 4:2:2 (master)
├── Web upload? → H.264 MP4
├── GIF for social? → GIF 480px max (size!)
└── Transparent? → WebM VP9 alpha / ProRes 4444
```

---

## Sound Design Pairing

| Visual cue | SFX type |
|------------|----------|
| Particle reveal | Soft whoosh + sparkle (high freq) |
| Logo punch in | Bass impact + reverb tail |
| Button success | UI tick + warm tone (C major) |
| Notification | 2-tone bell (do-mi) |
| Loading | Subtle tick repeat (heartbeat tempo) |
| Transition | Whoosh + filter sweep |

**Sources:** Soundsnap, Epidemic Sound, Artlist, BBC Sound Effects (free)

---

## Common Pitfalls

❌ Linear easing บน UI → robotic, มีไม่กี่ที่ใช้ได้ (rotation infinite)
❌ Animation > 600ms บน button → ผู้ใช้รอ
❌ Bounce overshoot 30%+ บน corporate → ดูเด็ก
❌ ลืม reduce motion (a11y)
❌ Lottie 1MB+ บน mobile → app size bloat
❌ Auto-play full screen video บน web (UX nightmare)
❌ Particle 1000+ บน mobile → drop frame

---

## Tools 2026 Recommendation

- **AfterEffects + Bodymovin** — industry standard, Lottie export
- **Cavalry** — procedural motion (better than AE for data viz)
- **Rive** — interactive vector animation (state machine)
- **Lottielab** — visual Lottie editor (no AE needed)
- **Spline** — 3D motion for web
- **Jitter** — quick social motion (browser-based)
- **Figma + Smart Animate** — UI prototype motion
