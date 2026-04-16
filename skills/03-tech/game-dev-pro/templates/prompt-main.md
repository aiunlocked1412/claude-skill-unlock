# Prompt Main — Game Dev Pro

## Engine Decision Matrix

### Unity vs Godot

| Criteria | Unity 6 | Godot 4 |
|----------|---------|---------|
| 2D | Good | **Best** (Scene/Node native) |
| 3D | **Best** | Good (improving fast) |
| Mobile (iOS+Android) | **Best** | Good |
| Console (PS/Xbox/Switch) | **Best** | 3rd-party port only |
| Web (HTML5) | OK | **Best** (small export) |
| Asset Store | **Huge** | Small |
| License | Free <$200K rev + royalty | **MIT** (free forever) |
| Language | C# | GDScript / C# / C++ |
| Runtime size | 30-50MB | 15-25MB |
| Job market (TH) | Bigger | Smaller |

**Decision flow:**
- Indie solo + 2D + budget conscious → **Godot**
- Mobile shipping + asset reuse → **Unity**
- Console / AAA-aspiring → **Unity** (or Unreal)

## Pattern Checklist

### Unity
- [ ] MonoBehaviour cache `GetComponent` ใน Awake
- [ ] ScriptableObject สำหรับ config (item, weapon, enemy stat)
- [ ] Object pool สำหรับ bullet/particle
- [ ] Use `FixedUpdate` for physics, `Update` for input
- [ ] Avoid `Find()`, `FindObjectOfType()` — assign in Inspector
- [ ] Coroutine cleanup ใน `OnDisable`
- [ ] Animator state machine — ไม่ hardcode string (use hash)

### Godot
- [ ] `@onready` cache `$NodePath` references
- [ ] Signal สำหรับ communication ข้าม Node
- [ ] Resource สำหรับ data (เก็บ .tres ใน res://)
- [ ] `_physics_process` for physics, `_process` for visual
- [ ] Scene composition > inheritance
- [ ] Group สำหรับ batch operation (`get_tree().get_nodes_in_group()`)

## Performance Budgets (target)

| Platform | FPS target | Draw calls | Triangles |
|----------|-----------|------------|-----------|
| Mobile (entry) | 30 | < 100 | < 100K |
| Mobile (mid) | 60 | < 200 | < 300K |
| PC | 60-144 | < 500 | < 1M |
| Console | 60 | < 1000 | < 5M |

## Save System Versioning

```
{
  "version": 2,
  "data": { ... }
}
```

- ใส่ `version` field ทุกครั้ง
- Migration function ต่อ version: v1 → v2 → v3
- Test: load save จาก version เก่า → ไม่ crash

## Common Pitfalls

- ใช้ `Update()` ทำ heavy operation = FPS drop
- `Instantiate()` ใน loop = GC spike (use pool)
- Audio uncompressed (.wav) ใน mobile = APK ใหญ่
- Texture > 2048×2048 บน mobile = VRAM ฮึด
- Forget to lock framerate (battery drain)
- Save ใช้ PlayerPrefs สำหรับ data ใหญ่ (5KB limit)

## Game Dev Tone

- Ship > polish — release MVP ก่อนแล้ว iterate
- Profile ก่อน optimize (อย่า premature)
- Test บน target device ตั้งแต่ week 1
