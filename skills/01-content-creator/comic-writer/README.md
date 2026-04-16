# Comic Writer

> AI Comic / Manga / Webtoon Script Writer — เขียนสคริปต์ที่นักวาดวาดได้ทันที

## ⚡ ใช้ยังไง

```
/comic-writer
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Series bible (premise + characters + world + story arc)
- ✅ Chapter script (panel-by-panel)
- ✅ Single page script (สำหรับทดลอง)
- ✅ Dialogue polish (บทพูด natural)
- ✅ SFX library (sound effect ไทย/อังกฤษ/Onomatopoeia)
- ✅ Format converter (manga → webtoon vertical)

## 💡 Use cases

- Manga / Webtoon creator (LINE Webtoon, Mango Comics)
- Indie comic writer ที่ต้องการ artist
- นักเขียนมือใหม่ฝึกเขียนสคริปต์
- Studio ที่ทำ pitch ให้สำนักพิมพ์
- IP creator ที่ขยายเรื่องจาก novel → comic

## 📦 ไฟล์ใน skill นี้

```
comic-writer/
├── SKILL.md                  # ไฟล์หลัก (Claude อ่าน)
├── README.md                 # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md        # panel composition + SFX library + dialogue
│   └── output-template.md    # script format ที่ artist อ่านง่าย
└── examples/
    └── example-output.md     # ตัวอย่าง chapter 1 webtoon shojo
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Chapter 1 webtoon "ครูสาวกับนักเรียนปริศนา" (shojo, 12 หน้า → 32 panels webtoon)

## 🎓 Tips

- ระบุ **format** ชัดต้นเรื่อง — manga vs webtoon เขียนต่างกันมาก
- **Beat sheet ก่อน panel** — ป้องกัน scene เหลว
- จำกัด **25 คำ/bubble** — reader ข้าม dialogue ยาว
- ใช้คู่กับ `/storyteller-pro` เพื่อพัฒนา character + plot
- ใช้คู่กับ `/graphic-designer-pro` เพื่อ generate ภาพ reference panel

## 🔗 Skills ที่ใช้คู่กัน

- `/storyteller-pro` — plot structure + character development
- `/translator-pro` — แปลสคริปต์ Thai ↔ English/Japanese
- `/graphic-designer-pro` — character reference + scene mood board
- `/copywriter-pro` — chapter title + tagline
