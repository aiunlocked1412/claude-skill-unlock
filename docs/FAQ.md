# FAQ — คำถามที่พบบ่อย

> Bundle นี้แจกฟรีโดย [aiunlock.co](https://aiunlock.co) ภายใต้ MIT License

---

## 🎁 เรื่องการใช้งาน & License

### Q: Bundle นี้ฟรีจริงเหรอ?
**A:** ใช่ ฟรี 100% ภายใต้ MIT License — ไม่มีเงื่อนไขลับ ไม่มีค่าใช้จ่ายแอบแฝง

### Q: ใช้ในบริษัทได้ไหม?
**A:** ได้ MIT License อนุญาตให้ใช้ทั้งส่วนตัวและเชิงพาณิชย์

### Q: สร้างผลงานขายเชิงพาณิชย์ได้ไหม?
**A:** ได้ ผลงานที่ "สร้างด้วย" skills เหล่านี้ คุณเป็นเจ้าของ 100%

### Q: แจกให้เพื่อน / fork repo ได้ไหม?
**A:** ได้เลย — ภายใต้ MIT License แจกต่อได้อิสระ ขอแค่เก็บ attribution ไปที่ aiunlock.co

### Q: แก้ไข skills แล้วเอาไปขายได้ไหม?
**A:** ทางเทคนิคทำได้ภายใต้ MIT License — แต่เราแนะนำให้ contribute กลับเข้ามาจะดีกว่า เพื่อให้คอมมูนิตี้ได้ใช้ร่วมกัน

---

## 💻 เรื่องการติดตั้ง

### Q: ต้องติดตั้ง Claude Code ก่อนไหม?
**A:** ใช่ Skills เหล่านี้ทำงานใน Claude Code เท่านั้น ดาวน์โหลดที่ https://claude.com/claude-code

### Q: ใช้ Windows ได้ไหม?
**A:** ได้ แต่ต้องใช้ผ่าน **WSL2** (Windows Subsystem for Linux) เพราะ `install.sh` เป็น bash script

### Q: ติดตั้งแล้ว `/` command ไม่ขึ้น?
**A:** ลองทำตามขั้นตอน:
1. ปิดและเปิด Claude Code ใหม่
2. ตรวจว่า `~/.claude/skills/<skill-name>/SKILL.md` มีอยู่
3. ลอง `ls ~/.claude/skills/` ต้องเห็น 37 folders
4. ถ้ายังไม่ได้ รัน `./install.sh --force`

### Q: `Permission denied: ./install.sh`?
**A:** ให้สิทธิ์ execute ก่อน:
```bash
chmod +x install.sh uninstall.sh
./install.sh
```

### Q: ติดตั้งซ้ำได้ไหม?
**A:** ได้ รัน `./install.sh` ซ้ำ — skills เดิมจะถูกข้าม (ไม่เขียนทับ) — หากอยากอัปเดต ใช้ `--force`

---

## 🎯 เรื่องการใช้งาน

### Q: Skill ไหนควรเริ่มจากตัวไหน?
**A:** ขึ้นกับอาชีพคุณ — ลองเริ่มจาก:
- ทำ content → `/youtuber-pro`, `/blogger-pro`
- ขายของ → `/online-seller`, `/copywriter-pro`
- เขียนโค้ด → `/programmer-pro`
- ครู/อาจารย์ → `/teacher-pro`

### Q: ใช้ skill หลายตัวในงานเดียวได้ไหม?
**A:** ได้แน่นอน เช่น:
```
/digital-marketer → วางแผน campaign
/copywriter-pro → เขียน headline
/social-media-admin → สร้างปฏิทินโพส
```

### Q: Output ของ skill บันทึกไว้ที่ไหน?
**A:** ขึ้นกับ skill — บาง skill สร้าง `.md` ในโฟลเดอร์ที่คุณกำหนด บางตัวแสดง inline ใน Claude Code

### Q: ปรับ output ให้ตรงกับสไตล์ตัวเองได้ไหม?
**A:** ได้ — บอก Claude ไปตรงๆ เช่น "ใช้โทนสนุก", "เขียนเหมือนคนคุยกับเพื่อน", "ความยาวไม่เกิน 500 คำ"

### Q: Skill รองรับภาษาอังกฤษไหม?
**A:** ทุก skill เขียนเป็นภาษาไทยเป็นหลัก แต่ **สร้าง output ภาษาอังกฤษได้** — แค่บอก Claude "ตอบเป็นภาษาอังกฤษ" หรือ "เขียน content ภาษาอังกฤษ"

---

## 🔧 เรื่องการ Customize

### Q: แก้ไข skill เองได้ไหม?
**A:** ได้ — แก้ที่ `~/.claude/skills/<skill-name>/SKILL.md` โดยตรง
- เปลี่ยน prompt, เพิ่ม rules, ปรับ output format
- การแก้ไม่กระทบ bundle ต้นฉบับ

### Q: สร้าง skill ใหม่เพิ่มได้ไหม?
**A:** ได้ — สร้าง folder `~/.claude/skills/my-custom-skill/` พร้อม `SKILL.md` — Claude Code จะรับรู้ทันที

### Q: ลบบาง skill ออก ไม่เอาทั้งหมด ทำได้ไหม?
**A:** ได้ — ลบ folder นั้นออก:
```bash
rm -rf ~/.claude/skills/<skill-name>
```

### Q: อัปเดตเวอร์ชันใหม่ยังไง?
**A:** เมื่อ bundle v1.1.0+ ออก:
1. `git pull` repo ล่าสุด
2. รัน `./install.sh --force`

---

## ⚠️ เรื่องข้อจำกัด

### Q: `/doctor-helper` วินิจฉัยโรคได้ไหม?
**A:** **ไม่ได้** — เป็นแค่ผู้ช่วยสรุปข้อมูลวิจัย/ยา ห้ามใช้แทนแพทย์จริง

### Q: `/lawyer-pro` ใช้เป็นเอกสารทางกฎหมายได้เลยไหม?
**A:** **ไม่ได้** — ต้องให้ทนายตรวจก่อนใช้จริง

### Q: `/stock-trader-pro` บอกว่าซื้อหุ้นตัวไหนดีได้ไหม?
**A:** **ไม่ได้** — ให้ข้อมูล technical analysis เท่านั้น การตัดสินใจลงทุนเป็นของคุณเอง

### Q: AI ให้ข้อมูลผิดบ้างไหม?
**A:** มีโอกาส — ตรวจสอบข้อมูลสำคัญกับแหล่งอ้างอิงที่น่าเชื่อถือเสมอ โดยเฉพาะ:
- ตัวเลข/สถิติ
- ข้อมูลทางการแพทย์/กฎหมาย
- ชื่อบุคคล/สถานที่/เหตุการณ์

---

## 🤝 เรื่อง Contribute

### Q: อยากเพิ่ม skill ใหม่ทำยังไง?
**A:** Fork repo → สร้าง skill ตามโครงสร้าง (`SKILL.md` + `README.md` + `templates/` + `examples/`) → เปิด PR

### Q: อยากแก้ปรับปรุง skill ที่มีอยู่ทำยังไง?
**A:** Fork → แก้ → เปิด PR พร้อมอธิบายเหตุผลที่แก้

### Q: เจอ bug แจ้งที่ไหน?
**A:** เปิด Issue ใน repo นี้ พร้อมข้อมูล:
- ชื่อ skill ที่มีปัญหา
- Command ที่ใช้
- ผลลัพธ์ที่คาดหวัง vs ที่ได้จริง

### Q: อยากขอ skill ใหม่?
**A:** เปิด Issue label `feature-request` — skills ที่ได้ upvote เยอะจะถูกเพิ่มใน update ถัดไป

---

## 🔄 เรื่อง Update

### Q: รู้ได้ยังไงว่ามี update?
**A:** Watch repo นี้ใน GitHub / ติดตาม [aiunlock.co](https://aiunlock.co)

### Q: Update ใหม่ต้องจ่ายเพิ่มไหม?
**A:** ไม่ — ทุก version ฟรีตลอด ภายใต้ MIT License

---

## 💬 เกี่ยวกับ aiunlock.co

### Q: aiunlock.co คืออะไร?
**A:** คอมมูนิตี้คนไทยที่อยากปลดล็อกการใช้ AI ในชีวิตและการทำงาน — โครงการนี้เป็นหนึ่งใน contribution ให้ community

### Q: มีโครงการอื่นของ aiunlock.co ไหม?
**A:** ดูได้ที่ https://aiunlock.co

---

**ยังไม่เจอคำตอบ?** เปิด Issue ใน repo นี้ หรือติดต่อผ่าน [aiunlock.co](https://aiunlock.co) 💬
