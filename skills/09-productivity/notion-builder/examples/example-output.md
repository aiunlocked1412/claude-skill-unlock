---
type: notion-blueprint
mode: personal (PARA)
user_count: 1
created: 2026-04-16
status: draft
---

# 🗂️ Notion Workspace Blueprint — คุณนัท (Senior Product Manager)

## 📊 Workspace Overview

| Field | Value |
|-------|-------|
| ผู้ใช้ | Solo (1 คน) |
| อาชีพ | Senior PM ที่ B2B SaaS startup (50 คน) |
| Method | PARA (Tiago Forte) |
| Database count | 5 (Projects, Areas, Resources, Tasks, Notes) |
| Integration | Linear (work tasks), Gmail, Calendly |
| Budget | Notion Plus $10/เดือน |
| Pain point ปัจจุบัน | ข้อมูลกระจาย Apple Notes + Google Doc + Linear → หาไม่เจอ + ทำซ้ำ |

---

## 🏗️ Workspace Hierarchy

```
🏠 Nat's Brain
├── 🚀 Quick Capture (inbox)
├── 📁 Projects (DB) — งานที่มี deadline
├── 🎯 Areas (DB) — ความรับผิดชอบต่อเนื่อง
├── 📚 Resources (DB) — reference + reading list
├── 🗄️  Archives (DB) — projects/resources ที่จบ
├── ✅ Tasks (DB) — atomic todo
├── 📝 Notes (DB) — meeting + thinking
└── 🔍 Dashboard (page รวม view ที่ใช้บ่อย)
```

---

## 📋 Database Schemas

### Database 1: Projects (Active outcomes)

| Property | Type | Default | Options |
|----------|------|---------|---------|
| Name | Title | — | — |
| Status | Select | Active | Active / On Hold / Done / Cancelled |
| Type | Select | Work | Work / Personal / Side project |
| Area | Relation | — | → Areas DB |
| Tasks | Relation | — | → Tasks DB |
| Due | Date | — | — |
| Priority | Select | P2 | P0 / P1 / P2 / P3 |
| Outcome | Text | — | "ทำเสร็จแล้วได้อะไร" |
| Tasks Completed % | Rollup | — | Tasks where Status=Done / total |

**ตัวอย่าง entries (5 projects):**
1. "Launch Q2 Pricing Page" — Work — Due 30/04 — P0
2. "Hire Senior PM #2" — Work — Due 31/05 — P1
3. "Personal Website Refresh" — Side — Due 15/06 — P3
4. "Run Marathon Bangkok 2026" — Personal — Due 20/11 — P2
5. "House Renovation Phase 2" — Personal — Due 30/09 — P2

**Views:**
- 📊 Active Work (filter: Type=Work, Status=Active) — sort by Priority
- 📅 This Quarter (filter: Due ≤ 30/06)
- ✅ Completed Q1 (filter: Status=Done, Completed Q1)
- 📈 Timeline Gantt (by Start-Due)

### Database 2: Areas (Ongoing responsibilities)

| Property | Type | Options |
|----------|------|---------|
| Name | Title | — |
| Owner | Person | me |
| Health | Select | 🟢 Green / 🟡 Yellow / 🔴 Red |
| Review Cadence | Select | Weekly / Monthly / Quarterly |
| Last Reviewed | Date | — |
| Linked Projects | Relation | → Projects |

**ตัวอย่าง 8 Areas:**
1. **Career — Product Management** 🟢 (review weekly)
2. **Health & Fitness** 🟡 (review weekly) — vs marathon training
3. **Finance** 🟢 (review monthly)
4. **Family** 🟢 (review weekly)
5. **Personal Brand / Content** 🔴 (review weekly) — ไม่โพสต์มา 2 เดือน
6. **Continuous Learning** 🟡 (review monthly)
7. **Home & Property** 🟢 (review monthly)
8. **Friendships** 🟡 (review monthly) — ไม่ได้เจอเพื่อนสนิท 3 เดือน

### Database 3: Resources (Reference)

| Property | Type | Options |
|----------|------|---------|
| Name | Title | — |
| Type | Select | Article / Book / Video / Podcast / Course / Tool |
| Topic | Multi-select | PM / Leadership / SaaS / Marketing / Tech / Health |
| Source URL | URL | — |
| Author | Text | — |
| Read Status | Select | To Read / Reading / Read / Reference |
| Rating | Select | ⭐⭐⭐⭐⭐ / ⭐⭐⭐⭐ / ⭐⭐⭐ |
| Notes | Text | — |
| Date Added | Created Time | auto |

**Views:**
- 📚 Reading list (Status = To Read) — sort by Date Added desc
- ⭐ 5-star library (Rating = 5)
- 🏷️ By Topic (group by Topic)

### Database 4: Tasks (Atomic todos)

| Property | Type | Options |
|----------|------|---------|
| Name | Title | — |
| Status | Select | Inbox / Today / This Week / Waiting / Done |
| Project | Relation | → Projects |
| Area | Relation | → Areas (for "no project" tasks) |
| Due | Date | — |
| Priority | Select | P0 / P1 / P2 |
| Energy | Select | 🔥 High / 🟡 Medium / 🟢 Low |
| Context | Multi-select | @Computer / @Phone / @Errand / @Home |

**Views:**
- 🌅 Today (filter: Status=Today OR Due=today)
- 📋 This Week (filter: Status=This Week)
- ⏳ Waiting (filter: Status=Waiting) — chase up
- 📥 Inbox (filter: Status=Inbox) — process daily

### Database 5: Notes (Meeting + Thinking)

| Property | Type | Options |
|----------|------|---------|
| Title | Title | — |
| Type | Select | Meeting / 1:1 / Decision / Idea / Journal |
| Date | Date | today |
| Project | Relation | → Projects |
| Area | Relation | → Areas |
| Tags | Multi-select | strategy / hire / customer / personal |
| Action Items | Relation | → Tasks |

---

## 🔗 Relation Map

```
Areas ──→ Projects ──→ Tasks
            │
            └──→ Resources (related reading)
            
Notes ──→ Projects (meeting note linked to project)
       └──→ Tasks (action items from meeting)
```

**Key rollups:**
- Project.Tasks Completed % = Tasks(Status=Done) / total
- Area.Active Project Count = count(Projects where Status=Active)
- Project.Last Touched = max(Tasks.Modified Time)

---

## 📋 Templates

### Template 1: New Project Page
```
🎯 Outcome: ทำเสร็จแล้วได้อะไร (1 ประโยค)
📊 Success Metric: วัดยังไงว่าสำเร็จ
📅 Milestones:
- [ ] Milestone 1 — date
- [ ] Milestone 2 — date
🚧 Risks:
- ...
🧠 Notes:
- ...
```
Auto-create 5 default tasks: Kickoff, Plan, Build, Review, Launch

### Template 2: Weekly Review (every Sun 19:00)
```
📅 Week of: ...
🎯 Wins:
1. ...
2. ...
3. ...
😔 Misses:
- ...
🔄 What I learned:
- ...
🎯 Next week priorities (top 3):
1. ...
2. ...
3. ...
🟢🟡🔴 Areas health check:
- Career: 🟢
- Health: 🟡 — ทำไม
- ...
```

### Template 3: Daily Plan (every morning)
```
☀️ Today: DD/MM/YY
🎯 Top 3 (must do):
1. ...
2. ...
3. ...
📋 Should do (if time):
- ...
🚫 Won't do today (defer):
- ...
🧘 Energy: 🔥/🟡/🟢
📝 Reflection (end of day):
```

### Template 4: 1:1 Meeting
```
👥 With: <ชื่อ>
📅 Date: today
🎯 Their wins:
- ...
🚧 Their challenges:
- ...
💡 Career conversation:
- ...
🔄 Feedback (2-way):
- I → them: ...
- Them → me: ...
✅ Action items:
- [ ] ... (owner, due)
```

---

## 📊 Dashboard Page (Daily Use)

```
🌅 GOOD MORNING NAT — DD/MM/YY

📋 TODAY (3 tasks max)
[Linked view: Tasks where Status=Today]

📅 THIS WEEK
[Linked view: Tasks where Status=This Week]

🚀 ACTIVE PROJECTS (top 5)
[Linked view: Projects where Type=Work, Status=Active, sort Priority]

⏳ WAITING ON OTHERS
[Linked view: Tasks where Status=Waiting]

🟡🔴 AREAS NEEDING ATTENTION
[Linked view: Areas where Health ≠ Green]

📚 READING THIS WEEK
[Linked view: Resources where Status=Reading]
```

---

## ⚙️ Automation

| Trigger | Action | Tool |
|---------|--------|------|
| Task Status → Done | Set Completed Date = today | Native |
| Task created via inbox | Default Status = Inbox | Native |
| Sun 19:00 | Reminder "Weekly review" | Native |
| Linear ticket assigned to me | Create Task in Notion | Zapier |
| Gmail star ⭐ | Create Task with subject | Zapier |
| Calendly booking | Create Note (type=Meeting) | Zapier |
| Project Status → Done | Move to Archives DB | Make |

---

## 📈 Migration Plan

### Week 1: Setup
- สร้าง 5 databases + 4 templates
- Import 30 active tasks จาก Linear
- Import 50 reading list จาก Pocket

### Week 2: Daily habit
- ทำ Daily Plan ทุกเช้า 5 นาที
- Process inbox ทุกเย็น 10 นาที

### Week 3: Refine
- ปรับ view ที่ไม่ใช้
- เพิ่ม template ที่ขาด

### Week 4: Weekly review เริ่ม
- ทุกอาทิตย์ 19:00 — 30 นาที

---

## 📊 Success Metric

- ใช้ ≥ 5 วัน/สัปดาห์ ภายใน 30 วัน
- ลด time spent หาข้อมูล จาก 30 นาที/วัน → < 5 นาที/วัน
- 100% ของ commit work อยู่ใน Tasks (ไม่ใช่ใน head)
- Weekly review ไม่ขาดเกิน 1 ครั้ง/เดือน

---

## ⚠️ Risk + Mitigation

| Risk | Mitigation |
|------|-----------|
| ใช้ไม่ทันแล้วเลิก | Start with 1 DB (Tasks) — เพิ่มทีละอัน |
| Over-engineering | กฎ: ทุก property ต้องตอบ "ใช้ทำอะไร" |
| Notion ล่ม | Backup ZIP ทุกเดือน → Google Drive |
| Notion ขึ้นราคา | Export ได้ทุกเมื่อ → migrate Obsidian |

---

## 🎓 Pro tips สำหรับนัท

1. **Quick Capture หน้า home** — ปุ่มเดียวเพิ่ม task/note ได้ทันที (ไม่ต้องเข้า DB)
2. **Mobile widget** — Today's Tasks ใส่ home screen iOS
3. **Voice memo → Note** — บันทึกความคิดตอนเดิน → transcribe ทีหลัง
4. **Sunday review = sacred** — block calendar ทุกอาทิตย์ 19:00-19:30
5. **Archive aggressively** — Project ที่ไม่ touch 60 วัน → Archive (เปิดใหม่ได้)

---

*Generated by /notion-builder — Claude Skill Unlock v1.1*
