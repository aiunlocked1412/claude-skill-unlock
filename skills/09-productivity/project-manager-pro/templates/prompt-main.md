# Prompt Formula — Project Manager Pro

## Template เก็บ context

```
ชื่อ project: <ชื่อ>
ประเภท: <construction / software / event / migration / launch>
Sponsor: <ชื่อ + ตำแหน่ง>
PM: <ชื่อ>
Team size: <X คน + roles>
Budget: <จำนวน>
Deadline: <วันที่ + กี่สัปดาห์>
Success criteria (3-5 ข้อ):
  1. ...
  2. ...
Out of scope: <สิ่งที่ "ไม่ทำ" ระบุชัด>
Constraints: <limitation ตั้งแต่ต้น>
Methodology: <waterfall / agile / hybrid>
```

## WBS Recipe

```
แตก project เป็น hierarchy 3-4 ระดับ ตามแบบ MECE:

Level 1: Project (1.0)
Level 2: Phases (1.1, 1.2, 1.3, ...)
Level 3: Deliverables (1.1.1, 1.1.2, ...)
Level 4: Work packages (atomic — assign + estimate ได้)

Rule:
- 1 work package = 8-80 hours effort
- ครอบคลุม 100% ของงาน (no gap, no overlap)
- 1 task = 1 verb at start (สร้าง, ทดสอบ, ส่ง, อนุมัติ)
```

## Gantt Recipe

```
ตาราง 8 คอลัมน์:
| Task ID | Task | Owner | Effort (h) | Start | End | Predecessor | Critical? |

Critical Path identification:
1. List ทุก task + predecessor
2. คำนวณ Earliest Start (ES) + Earliest Finish (EF)
3. คำนวณ Latest Start (LS) + Latest Finish (LF)
4. Slack = LS - ES
5. Critical = Slack 0 (delay = project delay)

Buffer:
- ใส่ที่ project level 15-25% (ไม่ใส่แต่ละ task)
```

## Sprint Recipe (Agile)

```
Sprint length: 1-2 สัปดาห์ (default 2)

Capacity calculation:
- ทีม X คน × Y วันใน sprint × 6 ชม. productive = total hours
- ลด 20% สำหรับ meeting + interruption
- = Sprint Capacity

Backlog:
- User stories (Format: As a __, I want __, so that __)
- Acceptance criteria (Given/When/Then)
- Story points (Fibonacci: 1, 2, 3, 5, 8, 13, 21)

Selection:
- เริ่มจาก highest priority (P0 → P1 → P2)
- ใส่จนเต็ม capacity — STOP

Daily standup (15 นาที):
1. Done เมื่อวาน
2. Plan วันนี้
3. Blocker
```

## Retrospective Recipe (Mad/Sad/Glad)

```
60-90 นาที หลังจบ sprint:

Round 1: ทุกคนเขียน sticky notes (5 นาที)
- 😊 Glad: 3 things
- 😞 Sad: 3 things
- 😡 Mad: 3 things

Round 2: Group + dot-vote (15 นาที)
- รวม theme คล้ายกัน
- Vote 3 dots/คน → top items

Round 3: Discuss top 3-5 (30 นาที)
- Root cause (5 Whys)
- Action items

Round 4: Commit Top 3 actions (15 นาที)
- Owner + Due + Definition of Done
- Track ใน sprint หน้า
```

## RAID Recipe

```
Risk:
- Impact (1-5) × Likelihood (1-5) = Score (1-25)
- ≥ 15 = High → mitigation plan ทันที
- 8-14 = Medium → monitor weekly
- ≤ 7 = Low → monitor monthly

Risk response:
- Avoid (เลี่ยง) — เปลี่ยน plan
- Mitigate (ลด impact) — backup plan
- Transfer (โอน) — insurance / contract
- Accept (ยอมรับ) — มี contingency

Issue (เกิดแล้ว):
- Severity: P0 (block project) / P1 (slow) / P2 (annoying)
- ต้องมี Owner + Due

Decision:
- One-way door = เปลี่ยนยาก → discuss นาน
- Two-way door = เปลี่ยนได้ → ตัดสินเร็ว
```

## Stakeholder Comm Recipe

```
Power × Interest Matrix:
- High Power + High Interest → Manage closely (weekly 1:1)
- High Power + Low Interest → Keep satisfied (monthly summary)
- Low Power + High Interest → Keep informed (bi-weekly update)
- Low Power + Low Interest → Monitor (quarterly)

Communication artifacts:
- Weekly status (1-page)
- Monthly steering committee (1 ชม.)
- Quarterly review (2 ชม.)
- Ad-hoc: หาก trigger event (milestone, blocker)
```

## Status Report Format

```
🚦 Overall: 🟢 On Track / 🟡 At Risk / 🔴 Off Track

✅ Done This Week (3-5 bullets)
🚧 Doing Next Week (3-5 bullets)
⚠️ Blockers / Risks (top 3)
📅 Milestone Status (table)
💰 Budget Burn (% spent vs % time)
👥 Team Health (🟢🟡🔴)
🆘 Need from Leadership (specific ask)
```

## Tips

- **3-point estimate** — best/likely/worst → use weighted (B + 4×L + W)/6
- **Slip detection** — ถ้า > 10% slip ใน 2 sprint ติดกัน → escalate
- **Change Request** — ทุก scope change ต้องมี CR (impact analysis)
- **Lessons Learned** — เก็บทุก project → reuse ใน project ถัดไป
