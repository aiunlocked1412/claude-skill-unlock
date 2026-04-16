---
type: meeting-notes
meeting: Kickoff Project — แอป "FoodFast" Delivery สำหรับออฟฟิศ
meeting_type: kickoff
date: 2026-04-16
duration_min: 60
chair: คุณกานต์ (PM)
created: 2026-04-16
status: draft
---

# 📝 Kickoff Project — แอป "FoodFast" Delivery สำหรับออฟฟิศ

## 📊 Meeting Header

| Field | Value |
|-------|-------|
| วันที่ | 16/04/26 10:00 - 11:00 |
| รูปแบบ | hybrid (3 คนใน office, 5 คน Zoom) |
| Chair | คุณกานต์ (Product Manager) |
| Note-taker | คุณนิว (Associate PM) |
| Attendees (8 คน) | กานต์ (PM), นิว (APM), บอย (Tech Lead), จิน (Backend), แก้ม (Frontend), เจ (Designer), หนิง (Marketing), เอ๋ (Ops) |
| Absent | คุณตู่ (CEO — ติด board meeting) |

---

## 🎯 Objectives

ที่ประชุมนัดมาเพื่อ:
1. Align scope MVP ของ FoodFast (delivery สำหรับออฟฟิศ)
2. ตัดสินใจ tech stack หลัก
3. กำหนด timeline + milestone 12 สัปดาห์
4. แบ่ง role + ownership

---

## 📋 Agenda & Discussion

### วาระที่ 1: Product Scope MVP

**Presenter:** คุณกานต์

**Discussion:**
- กานต์เสนอ MVP มี 5 features: ลงทะเบียน, browse menu, สั่งล่วงหน้า, payment (PromptPay), tracking
- บอย แย้ง: tracking realtime ใช้เวลา dev 4 สัปดาห์ ต่อ MVP 12 สัปดาห์ เสี่ยงเกิน
- เจ (Designer): tracking สำคัญต่อ UX — แต่ใช้แบบ "status update" (รอครัว / กำลังส่ง / ถึงแล้ว) แทน realtime map ได้
- เอ๋ (Ops): ลูกค้า B2B ออฟฟิศ ไม่ต้องการ realtime — ต้องการแค่ "รู้ว่ากี่โมงถึง"

**Key quote:**
> "เราไม่ได้แข่งกับ Grab — เราแข่งกับ HR สั่งข้าวกล่องแบบเดิม" — คุณกานต์

**Outcome:** ✅ Decided — MVP 5 features แต่ tracking เป็น status update (ไม่ใช่ map)

---

### วาระที่ 2: Tech Stack

**Presenter:** คุณบอย (Tech Lead)

**Discussion:**
- บอย เสนอ: Next.js (web) + React Native (mobile) + NestJS backend + PostgreSQL + Redis
- จิน แย้ง: NestJS overkill สำหรับ MVP — เสนอ Express + Prisma เร็วกว่า 30%
- บอย: NestJS structure ดีกว่า ทีมโตได้ในระยะยาว
- กานต์: เลือกเร็วก่อน scale ทีหลังได้

**Outcome:** ✅ Decided — Express + Prisma สำหรับ MVP, ย้าย NestJS ตอน Series A

---

### วาระที่ 3: Timeline 12 สัปดาห์

**Presenter:** คุณกานต์

**Discussion:**
- เสนอ 4 milestones: Design (W1-2), Backend (W3-6), Frontend (W5-10), Testing + Soft launch (W11-12)
- หนิง (Marketing): pre-launch waitlist เริ่ม W8 จะมี user 500 คนพร้อม
- แก้ม: frontend เริ่ม W5 ดี — ออกแบบ design system ก่อน W4

**Outcome:** ✅ Decided — Timeline ตามเสนอ + waitlist เริ่ม W8

---

### วาระที่ 4: Pricing Model

**Discussion:**
- เอ๋ เสนอ: free สำหรับ user, charge ร้านค้า 15% commission
- หนิง: คู่แข่ง Grab 30% — เรา 15% ดึงร้านง่าย แต่ margin ต่ำ
- กานต์: ยังไม่ตัดสิน — ต้องคุยกับร้าน 5 ร้าน pilot ก่อน

**Outcome:** 🅿️ Parking lot — รอข้อมูลจาก pilot

---

## 🗳️ Decisions Made

### Decision 1: MVP Scope = 5 features (Auth, Menu, Order, Payment, Status Update)
- **What:** MVP ตัด realtime tracking ออก ใช้ status update แทน
- **Why:** ลด dev effort 4 สัปดาห์, ตอบ user need (B2B office) ได้พอ
- **Alternatives considered:** (A) Full tracking realtime (B) ไม่มี tracking เลย
- **Supports:** ทุกคน (8/8)
- **Objects:** —
- **Effective:** 16/04/26
- **Reversibility:** 🚪 Two-way door — เพิ่ม realtime ทีหลังได้

### Decision 2: Tech Stack = Express + Prisma + PostgreSQL + Redis
- **What:** ใช้ Express ไม่ใช่ NestJS สำหรับ MVP
- **Why:** เร็วกว่า 30%, ทีม 2 คนพอ, ย้าย NestJS ทีหลังได้
- **Alternatives considered:** (A) NestJS (B) FastAPI Python
- **Supports:** จิน, กานต์, แก้ม, เจ
- **Objects:** บอย (concern: tech debt)
- **Effective:** 22/04/26 (เริ่ม sprint 1)
- **Reversibility:** 🚪🔒 One-way door — refactor framework cost สูง

### Decision 3: Timeline 12 สัปดาห์ + 4 milestones
- **What:** Soft launch 9/07/26
- **Effective:** 22/04/26
- **Reversibility:** 🚪 Two-way door — slip ได้ 1-2 สัปดาห์

---

## ✅ Action Items

| # | Action | Owner | Due Date | Definition of Done | Channel |
|---|--------|-------|----------|---------------------|---------|
| 1 | สร้าง Notion workspace + invite ทีม 8 คน | นิว | 18/04 | ทุกคน access ได้ + เห็น 5 page | Slack #foodfast |
| 2 | Design system v1 (color, typo, component) | เจ | 24/04 | Figma file + share link | Figma |
| 3 | DB schema design + ER diagram | จิน | 25/04 | dbdiagram.io link + review by บอย | Notion DB page |
| 4 | List ร้านค้า pilot 5 ร้าน + นัดคุย | เอ๋ | 23/04 | Spreadsheet 5 ร้าน + ติดต่อแล้ว 3 | Email + Sheet |
| 5 | Marketing pre-launch landing page | หนิง | 30/04 | Landing live + analytics setup | Webflow |
| 6 | Tech architecture doc | บอย | 22/04 | RFC ใน Notion + review meeting | Notion + meeting 22/04 |
| 7 | Sprint 1 plan + Jira board setup | กานต์ | 21/04 | Jira board + 12 tickets ใน sprint 1 | Jira |
| 8 | Schedule weekly standup ทุกอังคาร 9:30 | นิว | 17/04 | Google Calendar invite ส่งให้ทุกคน | Google Cal |

---

## 🅿️ Parking Lot

1. **Pricing model (commission %)** — รอข้อมูลจาก pilot 5 ร้าน → ตัดสินใจใน week 4
2. **Loyalty program** — เจเสนอ stamp card, แต่ยกไป phase 2 หลัง MVP
3. **B2B subscription model** (ออฟฟิศ subscribe เดือนละ X บาท) — รอ market research

---

## 📅 Next Meeting

- **Sprint 1 Planning:** 22/04/26 10:00 (60 นาที)
- **Agenda:**
  - Review action items จาก kickoff
  - Tech architecture review (RFC ของบอย)
  - Sprint 1 backlog grooming
  - Parking lot: pricing (ถ้ามีข้อมูลจากเอ๋)

- **Weekly Standup เริ่ม:** 23/04/26 9:30 ทุกอังคาร

---

## 📧 Follow-up Email

```
Subject: [สรุป] FoodFast Kickoff Meeting - 16/04/26

สวัสดีทีม FoodFast ทุกท่าน 🚀

ขอบคุณที่ร่วม kickoff meeting วันนี้ครับ — energy ดีมาก
สรุปสาระสำคัญที่ตัดสินใจ:

🎯 Decisions
1. MVP scope = 5 features (ตัด realtime tracking, ใช้ status update)
2. Tech stack = Express + Prisma + PostgreSQL + Redis
3. Timeline 12 สัปดาห์ — soft launch 9/07/26

✅ Action Items (full list ใน Notion)
- @นิว — สร้าง Notion workspace — 18/04
- @เจ — Design system v1 — 24/04
- @จิน — DB schema + ER diagram — 25/04
- @เอ๋ — List + นัดร้านค้า pilot 5 ร้าน — 23/04
- @หนิง — Pre-launch landing — 30/04
- @บอย — Tech architecture RFC — 22/04
- @ผม — Sprint 1 plan + Jira — 21/04

🅿️ Parking Lot
- Pricing model (รอ pilot data)
- Loyalty program (phase 2)
- B2B subscription (รอ research)

📅 Next meeting: Sprint 1 Planning — 22/04 10:00 (60 นาที)
📅 Weekly Standup: ทุกอังคาร 9:30 เริ่ม 23/04

หากมีจุดใดเข้าใจคลาดเคลื่อน รบกวนแจ้งใน Slack #foodfast ภายใน 48 ชม.

Let's ship something great! 💪
กานต์
```

---

## 📋 Note-taker Checklist

- [x] ส่ง follow-up email ภายใน 24 ชม. (ส่ง 16/04 18:00)
- [x] Action items push เข้า Jira (8 tickets in "Kickoff Actions" epic)
- [x] Decision log บันทึกใน Notion → Decisions DB
- [x] Parking lot ใส่ใน agenda ครั้งหน้า (Sprint 1 Planning)
- [x] Zoom recording เก็บใน Google Drive — permission: ทีม FoodFast only

---

*Generated by /meeting-notetaker — Claude Skill Unlock v1.1*
