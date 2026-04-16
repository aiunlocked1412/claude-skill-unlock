# Claude Skill Unlock — AI Career Skills Bundle

> **ปลดล็อกการใช้ AI ช่วยทำงานทุกอาชีพ** ด้วย Claude Code Skills **150 ตัว** ครอบคลุม **11 หมวดอาชีพ** พร้อมใช้งานทันที

[![Live Demo](https://img.shields.io/badge/🌐_live_demo-claude--skill--unlock.vercel.app-black)](https://claude-skill-unlock.vercel.app/)
[![Skills](https://img.shields.io/badge/skills-150-blue)](./docs/skill-catalog.md)
[![Categories](https://img.shields.io/badge/หมวด-11-purple)](./docs/skill-catalog.md)
[![Language](https://img.shields.io/badge/language-ภาษาไทย-red)](.)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE.txt)
[![Free](https://img.shields.io/badge/ฟรี-100%25-brightgreen)](.)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-orange)](https://claude.com/claude-code)

> 🎁 **โปรเจคนี้แจกฟรี** — สร้างโดย [aiunlock.co](https://aiunlock.co) เพื่อคอมมูนิตี้คนไทยที่อยากใช้ AI ในสายอาชีพ

## 🌐 ลองดูก่อน

**👉 [claude-skill-unlock.vercel.app](https://claude-skill-unlock.vercel.app/)**

หน้าเว็บแสดง 150 skills ครบทุกตัว — มี search, filter 11 หมวด, และตัวอย่างผลลัพธ์ของแต่ละ skill

---

## 🎯 Bundle นี้เหมาะกับใคร?

- **ฟรีแลนซ์ / ครีเอเตอร์** ที่อยากใช้ AI เพิ่ม productivity 5-10 เท่า
- **เจ้าของธุรกิจ SME** ที่อยากให้ทีมทำงานเร็วขึ้น
- **พนักงานประจำ** ที่อยากทำงานส่วนตัวนอกเวลาให้ได้มากขึ้น
- **นักเรียน/นักศึกษา** ที่อยากเรียนรู้วิธีใช้ AI ในสายอาชีพ
- **ทุกคน** ที่อยากใช้ AI ในชีวิตประจำวัน

## 📦 มีอะไรบ้าง?

**150 Claude Code Skills** ครอบคลุม **11 หมวด**:

| หมวด | จำนวน | ตัวอย่าง Skills |
|------|-------|-----------------|
| 🎬 Content Creator | 15 | YouTuber, Blogger, Podcaster, Live Streamer, Screenplay Writer |
| 📣 Marketing & Sales | 18 | Digital Marketer, SEO, Copywriter, Growth Hacker, Ads Strategist |
| 💻 Tech & Development | 17 | Programmer, Data Analyst, AI Engineer, Blockchain, Cloud Architect |
| 🎨 Design & Creative | 17 | Graphic, UX, Motion, Logo, Packaging, Sound Designer |
| 💼 Business & Service | 19 | Consultant, HR, Lawyer, Startup Founder, Franchise Owner |
| 📚 Education & Health | 19 | Teacher, Coach, Doctor, TCM, แพทย์แผนไทย, Speech Therapist |
| 💰 Lifestyle & Personal | 11 | Resume, Interview, Wedding, Travel, Pet Care, Gardening |
| 🍽️ Hospitality & Service | 9 | Hotel, Tour Guide, Barista, Bartender, Chef, Baker |
| ⚙️ Productivity & Modern Work | 11 | Meeting, Notion, PM, Agile Coach, PKM, Automation |
| 💵 Finance & Accounting | 8 | **NEW** — Tax, Estate, Loan Officer, Bookkeeper, Financial Analyst |
| 🎵 Music & Arts | 6 | **NEW** — Musician, Songwriter, DJ, Music Producer, Painter |

> 📌 Skill การเงินกระจายอยู่ทั้งใน `05-business` (accountant, crypto, stock, insurance) และ `10-finance-accounting` (tax, loan, mortgage, estate)

ดูรายการครบ → [`docs/skill-catalog.md`](./docs/skill-catalog.md) | [`index.html`](./index.html) (interactive)

## ⚡ ติดตั้ง 3 ขั้นตอน

```bash
# 1. clone repo นี้
git clone <repo-url> claude-skill-unlock
cd claude-skill-unlock

# 2. รัน install script
./install.sh

# 3. เปิด Claude Code แล้วลอง
# พิมพ์ /youtuber-pro, /copywriter-pro, /teacher-pro ได้เลย
```

> **ข้อกำหนด:** macOS/Linux, ติดตั้ง [Claude Code](https://claude.com/claude-code) แล้ว

## 🚀 ใช้งานอย่างไร

แต่ละ skill เรียกด้วย slash command ในหน้าต่าง Claude Code:

```
/youtuber-pro                    # เปิดเมนู
/youtuber-pro สคริปต์ 10 นาที    # สั่งตรง
/copywriter-pro headline          # headline ads
/teacher-pro แผนการสอนม.ปลาย      # lesson plan
/personal-finance วางแผนเงินล้าน  # planning
/notion-builder workspace ทีม    # Notion workspace
```

ดูวิธีใช้แบบละเอียด → [`docs/คู่มือใช้งาน.md`](./docs/คู่มือใช้งาน.md)

## 📁 โครงสร้าง

```
claude-skill-unlock/
├── index.html              # Interactive showcase (เปิดใน browser)
├── install.sh              # ติดตั้ง skills ทั้งหมด
├── uninstall.sh            # ถอนการติดตั้ง
├── docs/                   # คู่มือ + FAQ + catalog
└── skills/
    ├── 01-content-creator/      # 15 skills
    ├── 02-marketing/            # 18 skills
    ├── 03-tech/                 # 17 skills
    ├── 04-design/               # 17 skills
    ├── 05-business/             # 19 skills
    ├── 06-education-health/     # 19 skills
    ├── 07-lifestyle/            # 11 skills
    ├── 08-hospitality/          # 9 skills
    ├── 09-productivity/         # 11 skills
    ├── 10-finance-accounting/   # 8 skills (NEW v1.2.0)
    └── 11-music-arts/           # 6 skills (NEW v1.2.0)
```

## 🗑️ ถอนการติดตั้ง

```bash
./uninstall.sh
```

## 💝 ใช้ฟรี — แจกต่อได้

Bundle นี้ **แจกฟรี** ภายใต้ MIT License — คุณสามารถ:
- ✅ ใช้งานส่วนตัว + เชิงพาณิชย์ได้
- ✅ แก้ไข skills ให้เหมาะกับตัวเอง
- ✅ แจกจ่าย/แชร์ต่อได้
- ✅ นำไปทำ fork / derivative work ได้

ดูรายละเอียด → [`LICENSE.txt`](./LICENSE.txt)

## 🤝 Contribute

อยากช่วยพัฒนา bundle นี้ให้ดีขึ้น?
- 🐛 เจอ bug → เปิด issue ใน repo นี้
- 💡 อยากเพิ่ม skill ใหม่ → เปิด PR
- 📢 แชร์ bundle นี้ให้เพื่อนในสายอาชีพคุณ

## 💬 ติดต่อ

- 🌐 เว็บไซต์: [aiunlock.co](https://aiunlock.co)
- 📧 Issues / Feature request → เปิด issue ใน repo นี้

---

**Made with ❤️ by [aiunlock.co](https://aiunlock.co) for Thai creators, freelancers, and small businesses**

*v1.2.0 — อัปเดตล่าสุด: 2026-04-17 — 150 skills, 11 categories*
