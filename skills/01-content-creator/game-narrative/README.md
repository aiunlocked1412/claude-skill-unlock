# Game Narrative

> AI Game Story Designer — ออกแบบเรื่องที่ player เลือกเอง ไม่ใช่ดู cutscene

## ⚡ ใช้ยังไง

```
/game-narrative
```

## 🎯 ทำอะไรได้บ้าง

- ✅ World lore + bible (history, factions, magic system)
- ✅ Character arc (PC + NPC — backstory, motivation, growth)
- ✅ Dialogue tree (branching + state management)
- ✅ Quest design (main / side / companion / faction)
- ✅ Environmental storytelling (เล่าเรื่องผ่าน level)
- ✅ Codex / Lore drop (in-game documents)

## 💡 Use cases

- Indie game dev ที่ทำ RPG / narrative game
- Studio ที่ต้องการ narrative designer support
- Tabletop RPG (D&D, Pathfinder) GM ที่อยากเตรียม campaign
- Visual novel writer
- Mod creator (Skyrim, Fallout, Baldur's Gate)

## 📦 ไฟล์ใน skill นี้

```
game-narrative/
├── SKILL.md                  # ไฟล์หลัก (Claude อ่าน)
├── README.md                 # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md        # lore + dialogue + quest patterns
│   └── output-template.md    # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md     # ตัวอย่าง side quest + dialogue tree
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Side quest "หาแมวหายในเมืองเก่า" — fetch quest ภายนอก แต่มี dark twist 4 endings

## 🎓 Tips

- ระบุ **genre + platform** ชัด → tone + scope แม่นขึ้น
- ทุก choice ต้องมี **real consequence** — กัน "illusion of choice"
- **Show, don't tell** — environmental storytelling > exposition
- ใช้คู่กับ `/storyteller-pro` เพื่อพัฒนา character arc ลึก
- ใช้คู่กับ `/comic-writer` ถ้าทำ visual novel หรือ cutscene

## 🔗 Skills ที่ใช้คู่กัน

- `/storyteller-pro` — character + plot fundamentals
- `/comic-writer` — cutscene script / visual novel panel
- `/translator-pro` — dialogue localization
- `/copywriter-pro` — quest title + lore item names
