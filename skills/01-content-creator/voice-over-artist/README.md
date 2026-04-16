# Voice Over Artist

> AI ผู้ช่วยพากษ์/Voice Over — Script, Character Voice, Pace Marking, Recording Brief สำหรับ Animation, โฆษณา, E-Learning, Documentary

## ⚡ ใช้ยังไง

```
/voice-over-artist
```

## 🎯 ทำอะไรได้บ้าง

- ✅ เขียน/ปรับ Script พร้อม pace marking และ emotion cue ภาษาไทย
- ✅ Character Voice Profile (บุคลิก, อายุ, สำเนียง, tone, reference)
- ✅ Recording Brief มาตรฐานสตูดิโอ (ครบ do/don't/special notes)
- ✅ Timing & Pace Guide (word count ต่อ duration, จังหวะหายใจ)
- ✅ Script Localization (แปล + ปรับให้พูดสบายปาก ไม่ awkward)
- ✅ Full VO Package (script + brief + character guide)

## 💡 Use cases

- นักพากษ์/voice actor ต้องการ script ที่มี direction ครบ
- โปรดักชันเฮ้าส์อยากได้ recording brief มาตรฐานก่อนเข้าสตูดิโอ
- แบรนด์ทำโฆษณา TVC ต้องการ script 15/30/60 วิ พร้อม tone guide
- ครีเอเตอร์ทำ e-learning ต้องการ script หลายบทที่ consistency สูง
- การ์ตูน/animation studio ต้องการ character voice bible

## 📦 ไฟล์ใน skill นี้

```
voice-over-artist/
├── SKILL.md       # ไฟล์หลัก (Claude อ่าน)
└── README.md      # คุณกำลังอ่านอยู่
```

## 📊 ตัวอย่างผลลัพธ์

เมื่อ run `/voice-over-artist full VO package` จะได้:
- Script พร้อม pace marking ครบทุก line
- Character voice profile ทุกตัวละคร
- Recording brief สำหรับนักพากษ์
- Timing check (word count vs duration)

## 🎓 Tips

- บอก **duration ที่ต้องการ** — ส่งผลต่อ word count โดยตรง
- บอก **target audience** (เด็ก/ผู้ใหญ่/คนชรา) → tone และ delivery ต่างกันมาก
- แนบ **script ต้นฉบับ** ถ้ามี → จะปรับให้เหมาะสมได้เร็วกว่า
- ใช้คู่กับ `/screenplay-writer` → ได้บทที่พร้อมพากษ์ตั้งแต่ต้น

## 🔗 Skills ที่ใช้คู่กัน

- `/screenplay-writer` — เขียนบทก่อนนำมาทำ voice over
- `/book-author` — ทำ audiobook จากต้นฉบับหนังสือ
- `/ads-strategist` — วางกลยุทธ์โฆษณาก่อนผลิต TVC
