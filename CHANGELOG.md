# Changelog

รูปแบบการบันทึก: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) + [Semantic Versioning](https://semver.org/)

---

## [1.2.0] - 2026-04-17

### 🎉 ขยายเป็น 150 skills + 2 หมวดใหม่ (Finance & Music)

เพิ่ม **50 skills** ใหม่ รวมเป็น **150 skills** ครอบคลุม **11 หมวดอาชีพ**

#### Added — 2 หมวดใหม่

**💵 หมวด 10: Finance & Accounting (8 skills)**
- `tax-consultant` — ที่ปรึกษาภาษีบุคคล + นิติบุคคล (ภ.ง.ด., ลดหย่อน, VAT, tax planning)
- `estate-planner` — วางแผนมรดก + พินัยกรรม + trust + ภาษีการรับมรดก
- `loan-officer` — เจ้าหน้าที่สินเชื่อธนาคาร (บ้าน/รถ/SME/personal)
- `debt-advisor` — จัดการหนี้ (รวมหนี้, refinance, เจรจา, หนี้เสีย)
- `mortgage-broker` — โบรกเกอร์สินเชื่อบ้าน (เปรียบเทียบ, ต่อรอง)
- `bookkeeper-pro` — นักบัญชีรายวัน (GL, journal, reconcile, AR/AP)
- `financial-analyst` — นักวิเคราะห์การเงิน (DCF, model, equity research)
- `retirement-planner` — วางแผนเกษียณ (RMF/SSF, withdrawal strategy)

**🎵 หมวด 11: Music & Arts (6 skills)**
- `musician-pro` — แต่งเพลง, chord progression, arrangement
- `songwriter` — เขียนเนื้อเพลง, hook, rhyme scheme (ไทย/อังกฤษ)
- `dj-pro` — setlist, mixing, BPM matching, gig planning
- `music-producer` — beat making, mixing/mastering, DAW workflow
- `artist-painter` — concept, color palette, series plan, exhibition
- `dance-choreographer` — choreography, 8-count, formation, music cut

#### Added — ขยาย 9 หมวดเดิม (36 skills, 4 ต่อหมวด)

**🎬 Content Creator (+4 → 15)**
- `live-streamer`, `voice-over-artist`, `screenplay-writer`, `book-author`

**📣 Marketing & Sales (+4 → 18)**
- `community-manager`, `growth-hacker`, `ads-strategist`, `conversion-optimizer`

**💻 Tech & Development (+4 → 17)**
- `blockchain-dev`, `cloud-architect`, `ml-engineer`, `embedded-engineer`

**🎨 Design & Creative (+4 → 17)**
- `sound-designer`, `calligrapher`, `packaging-designer`, `logo-designer`

**💼 Business & Service (+4 → 19)**
- `startup-founder`, `franchise-owner`, `import-export`, `business-coach`

**📚 Education & Health (+4 → 19)**
- `tcm-helper`, `thai-traditional-medicine`, `speech-therapist`, `study-planner`

**💰 Lifestyle & Personal (+4 → 11)**
- `pet-care`, `home-manager`, `gardening-pro`, `car-advisor`

**🍽️ Hospitality & Service (+4 → 9)**
- `barista-pro`, `bartender-pro`, `baker-pro`, `chef-pro`

**⚙️ Productivity & Modern Work (+4 → 11)**
- `time-manager`, `agile-coach`, `knowledge-manager`, `automation-builder`

#### Updated
- `install.sh` — banner 100 → 150
- `uninstall.sh` — เพิ่ม 50 slugs ใหม่ + 2 หมวด
- `README.md` — badge + stats 100 → 150, หมวด 9 → 11
- `index.html` — เพิ่ม 50 skill objects + 2 categories
- `docs/skill-catalog.md` — catalog ครบ 150 skills
- `docs/คู่มือใช้งาน.md` — quick reference ครบ

#### Notes
- Skill การเงินบางตัวอยู่ใน `05-business` เดิม (accountant-pro, stock-trader-pro, crypto-trader, financial-planner, insurance-advisor, auditor-pro) — ไม่ถูกย้ายเพื่อรักษา backwards compat
- Skill นี้ pass นี้ไม่มี `templates/` + `examples/` (จะตามในรุ่น 1.2.1) — SKILL.md ใช้งานได้เต็มแล้ว

---

## [1.1.0] - 2026-04-16

### 🎉 ขยายเป็น 100 skills + 3 หมวดใหม่

เพิ่ม **63 skills** ใหม่ รวมเป็น **100 skills** ครอบคลุม **9 หมวดอาชีพ**

#### Added — 3 หมวดใหม่ทั้งหมด

**💰 หมวด 7: Lifestyle & Personal (7 skills)**
- `personal-finance` — งบส่วนตัว, ลงทุน, วางแผนเกษียณ
- `resume-builder` — เขียน CV/Resume + cover letter
- `interview-coach` — เตรียมสัมภาษณ์งาน + behavioral Q&A
- `relationship-coach` — couple, family, dating
- `parenting-pro` — เลี้ยงลูก, child development
- `wedding-planner` — วางแผนงานแต่ง
- `travel-planner` — itinerary, booking, trip

**🍽️ หมวด 8: Hospitality & Service (5 skills)**
- `restaurant-owner` — F&B menu, pricing, marketing
- `hotel-concierge` — guest service, recommendation
- `tour-guide-pro` — itinerary, storytelling
- `salon-owner` — booking, service menu, retention
- `florist-pro` — arrangement, design brief

**⚙️ หมวด 9: Productivity & Modern Work (7 skills)**
- `meeting-notetaker` — สรุป meeting + action items
- `email-manager` — inbox zero, template
- `notion-builder` — workspace, database
- `project-manager-pro` — Gantt, sprint, retrospective
- `async-communicator` — RFC, doc-first
- `executive-assistant` — EA tasks, scheduling
- `presentation-designer` — slide design, pitch deck

#### Added — ขยาย 6 หมวดเดิม (44 skills)

**🎬 Content Creator (+6 → 11 ตัว)**
- `course-creator`, `newsletter-writer`, `ghostwriter-pro`, `comic-writer`, `game-narrative`, `tiktoker-pro`

**📣 Marketing & Sales (+8 → 14 ตัว)**
- `email-marketer`, `affiliate-marketer`, `brand-strategist`, `pr-manager`, `event-marketer`, `crm-strategist`, `sales-pro`, `market-researcher`

**💻 Tech & Development (+7 → 13 ตัว)**
- `mobile-app-builder`, `security-engineer`, `ai-engineer`, `database-architect`, `game-dev-pro`, `system-admin`, `tech-writer`

**🎨 Design & Creative (+7 → 13 ตัว)**
- `ux-designer`, `motion-designer`, `illustrator-pro`, `3d-modeler`, `interior-designer`, `jewelry-designer`, `tattoo-designer`

**💼 Business & Service (+8 → 15 ตัว)**
- `financial-planner`, `insurance-advisor`, `crypto-trader`, `supply-chain-mgr`, `procurement-pro`, `auditor-pro`, `restaurant-mgr`, `ecommerce-mgr`

**📚 Education & Health (+8 → 15 ตัว)**
- `tutor-pro`, `language-teacher`, `dentist-helper`, `pharmacist-helper`, `veterinarian-helper`, `yoga-instructor`, `meditation-coach`, `mental-wellness`

#### Updated
- `install.sh` — banner เปลี่ยนเป็น "100 skills"
- `uninstall.sh` — เพิ่ม 63 slugs ใหม่
- `README.md` — badge + stats เปลี่ยน 37 → 100
- `index.html` — เพิ่ม 63 skill objects + 3 categories
- `docs/skill-catalog.md` — catalog ครบ 100 skills
- `docs/คู่มือใช้งาน.md` — quick reference ครบ
- `docs/FAQ.md` — เพิ่ม Q เกี่ยว skills ใหม่

---

## [1.0.0] - 2026-04-16

### 🎉 เปิดตัว Bundle แรก — Claude Skill Unlock (แจกฟรี โดย aiunlock.co)

#### Added (37 Skills)

**🎬 หมวด Content Creator (5)**
youtuber-pro, blogger-pro, translator-pro, podcaster-pro, storyteller-pro

**📣 หมวด Marketing & Sales (6)**
digital-marketer, social-media-admin, seo-specialist, copywriter-pro, online-seller, influencer-marketing

**💻 หมวด Tech & Development (6)**
programmer-pro, data-analyst-pro, web-designer-pro, qa-tester-pro, no-code-builder, devops-helper

**🎨 หมวด Design & Creative (6)**
graphic-designer-pro, photographer-pro, video-editor-pro, architect-pro, fashion-designer-pro, product-designer-pro

**💼 หมวด Business & Service (7)**
business-consultant, accountant-pro, hr-officer-pro, customer-service-pro, stock-trader-pro, lawyer-pro, real-estate-pro

**📚 หมวด Education & Health (7)**
teacher-pro, coach-pro, nutritionist-pro, fitness-trainer-pro, doctor-helper, psychologist-helper, researcher-pro

#### Infrastructure
- `install.sh` / `uninstall.sh` — ติดตั้งและถอนอัตโนมัติ
- `docs/คู่มือใช้งาน.md` — คู่มือใช้งานภาษาไทย
- `docs/FAQ.md` — คำถามที่พบบ่อย
- `docs/skill-catalog.md` — catalog 37 skills
- `LICENSE.txt` — MIT License
- `index.html` — interactive showcase page

---

## แผนอนาคต (Roadmap)

### v1.2.0 (วางแผนไว้)
- เพิ่ม 5-10 skills จาก feedback ผู้ใช้
- เพิ่มตัวอย่าง output หลายรูปแบบในแต่ละ skill

### v2.0.0
- รองรับ integrations (Notion, Google Drive, Sheets)
- Dashboard HTML รวมผลลัพธ์จาก skills ต่างๆ
- Team sharing (หลายคนในทีมใช้ร่วม)

---

*รายงาน bug หรือขอ feature ใหม่ — เปิด Issue ใน repo นี้*

*Made with ❤️ by [aiunlock.co](https://aiunlock.co)*
