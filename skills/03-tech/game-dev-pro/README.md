# Game Dev Pro

> AI Game Developer — Unity (C#) และ Godot (GDScript) — สำหรับ 2D/3D, mobile, PC, web

## ใช้ยังไง

```
/game-dev-pro
```

## ทำอะไรได้บ้าง

- เลือก engine (Unity vs Godot)
- Setup project + structure
- เขียน mechanic (movement, physics, AI, combat)
- Save/load system (JSON, Resource)
- UI + menu system
- Optimize 60fps + deploy ขึ้น store

## รองรับ

- **Unity 6** (C#) — mobile, PC, console, AR/VR
- **Godot 4.3** (GDScript/C#) — 2D indie, web export
- **Pattern:** ScriptableObject, Signal, State machine, Object pool
- **Deploy:** Steam, App Store, Play Store, itch.io, WebGL

## Use cases

- เริ่มเกมแรก ไม่รู้เลือก engine ไหน
- Implement enemy AI ที่ chase/attack
- Save system ที่ migrate ข้าม version ได้
- เกม FPS drop ตอน object เยอะ — optimize
- Build + ส่งขึ้น itch.io / Steam
- Web export Godot ขึ้น GitHub Pages

## ไฟล์ใน skill นี้

```
game-dev-pro/
├── SKILL.md                # ไฟล์หลัก
├── README.md
├── templates/
│   ├── prompt-main.md      # engine decision + pattern checklist
│   └── output-template.md  # blueprint format
└── examples/
    └── example-output.md   # 2D platformer Godot 4 (player + enemy + save)
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — 2D platformer ครบ player + enemy AI + save system

## Tips

- บอก target platform (PC/mobile/web/console) — ส่งผลเลือก engine
- บอก team size + ภาษาที่ถนัด
- ส่ง screenshot/concept ของเกม (ถ้ามี)
- Performance issue → ส่ง profiler screenshot

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — review C#/GDScript code quality
- `/devops-helper` — CI/CD build automation (Unity Cloud Build, Godot Action)
- `/web-designer-pro` — landing page เกม + press kit
- `/tech-writer` — game dev log + tutorial
