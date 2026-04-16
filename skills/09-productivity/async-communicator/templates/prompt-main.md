# Prompt Formula — Async Communicator

## Template เก็บ context (RFC)

```
RFC ID: RFC-XXX
หัวข้อ: <ชื่อสั้น>
Author: <ชื่อ>
Reviewers (ขอ comment): <ชื่อ 3-5 คน>
Decision deadline: <DD/MM>
Current state: <สถานการณ์ปัจจุบัน>
Pain point: <ปัญหาที่ต้องแก้>
Constraints: <budget, time, tech, people>
```

## RFC Structure (7 sections)

```
1. TL;DR (3 ประโยค: ปัญหา / แนวทาง / ขออะไร)
2. Context (background + why now)
3. Problem Statement (ชัด + impact)
4. Proposal (รายละเอียด + diagram)
5. Alternatives Considered (table: option / pros / cons / why not)
6. Decision (เมื่อ status=Accepted)
7. Open Questions (@คน ที่ต้องตอบ)
```

## Decision Doc Recipe

```
1. What we decided (1 ประโยค)
2. Why (3-5 reasons)
3. Alternatives considered
4. Reversibility (one-way / two-way door)
5. Implications (ทีม / cost / timeline)
```

## Status Update Recipe (TLDR-D-D-B)

```
1. TL;DR (1-2 ประโยค)
2. ✅ Done (สัปดาห์ที่ผ่าน — concrete)
3. 🚧 Doing (สัปดาห์นี้ — เป้าหมายชัด)
4. 🚫 Blocked (ขอความช่วยเหลือ + @คน)
5. 📊 Metrics (optional)
```

## Async Meeting Alternative Patterns

### Pattern 1: RFC + comment thread (24-48 hr)
- ใช้สำหรับ: technical decision, process change
- Tool: Notion / Google Doc

### Pattern 2: Loom video + slack thread
- ใช้สำหรับ: design review, demo, walk-through
- Tool: Loom + Slack

### Pattern 3: Threaded Slack discussion
- ใช้สำหรับ: quick decision, brainstorm
- Tool: Slack thread

### Pattern 4: Collaborative doc (live cursor)
- ใช้สำหรับ: writing review, planning
- Tool: Notion / Figma / Google Doc

### Pattern 5: Async standup (text-based)
- ใช้สำหรับ: daily team sync
- Tool: Slack #daily-standup channel

### เมื่อต้อง sync จริง:
- Brainstorm + creativity
- Sensitive feedback (1:1)
- Relationship (team retreat)
- Crisis / urgent
- Onboarding new person

## Async Culture Norms (10 ข้อ)

```
1. Default async — meeting = exception
2. Doc-first — no doc = didn't happen
3. Response SLA: P0=ASAP, P1=4h, P2=24h
4. DM ≠ phone (no expected immediate response)
5. Time zone respect
6. Loom for context (>3 min explain)
7. Status visible (Slack/calendar)
8. Update in public channel (not DM)
9. Decisions over discussions
10. Quality > speed
```

## PRD Recipe

```
1. TL;DR (1 ประโยค)
2. Problem (user pain + business impact + evidence)
3. Goals (primary / secondary / non-goals)
4. User Stories (As a __, I want __, so that __)
5. Solution (UX flow + tech approach links)
6. Success Metric (leading + lagging)
7. Risks & Mitigations
8. Timeline (Design / Build / Launch)
```

## Tech Spec Recipe

```
1. TL;DR
2. Context & Goals
3. Non-Goals
4. Architecture (diagram)
5. Data Model
6. API Design
7. Edge Cases
8. Failure Modes
9. Performance & Scalability
10. Security
11. Migration Plan (if applicable)
12. Open Questions
```

## Tips

- **Write the TL;DR first** — forces clarity
- **Cut 30%** — ทุก doc ตัด 30% ของคำหลัง draft
- **Link, don't paste** — context ที่มีอยู่แล้ว → link
- **Comment > revise** — ให้ reviewer comment ก่อน revise
- **Decision deadline** — ไม่มี = เลื่อนไม่จบ
- **Numbered RFC** — RFC-001, 002 → searchable + reference ได้
- **Status field** — Draft / Open / Accepted / Rejected / Superseded
