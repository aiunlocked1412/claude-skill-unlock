---
type: rfc
title: Migrate Primary Database from PostgreSQL to MongoDB for User Activity Service
author: คุณบอย (Tech Lead)
status: Open
created: 2026-04-16
deadline: 2026-04-30
---

# 📄 RFC-042: Migrate Primary Database from PostgreSQL to MongoDB for User Activity Service

**Status:** Open (accepting comments until 30/04)
**Author:** คุณบอย <boy@foodfast.io>
**Reviewers:** @คุณจิน (Backend Eng), @คุณกานต์ (PM), @คุณตู่ (CTO), @คุณแก้ม (Frontend), @คุณเอ๋ (DevOps)
**Created:** 2026-04-16
**Decision deadline:** 2026-04-30

---

## 📌 TL;DR

1. **ปัญหา:** User Activity table (60M rows, growing 5M/เดือน) ทำให้ PostgreSQL query slow (p95 850ms) และ schema migration เริ่มกินเวลา 2-4 ชั่วโมง = downtime
2. **เสนอ:** Migrate User Activity service ไป MongoDB Atlas — schema-flexible, horizontally scalable, time-series collection support
3. **ขอ:** Review proposal + alternatives + risks ภายใน 30/04 → ตัดสินใจใน meeting 02/05

> **หมายเหตุ:** RFC นี้ขอเปลี่ยนเฉพาะ **User Activity service** เท่านั้น — ส่วน Order, Payment, User Auth ยังใช้ PostgreSQL

---

## 🌍 Context

### Background
- FoodFast launch ตุลาคม 2024 — ใช้ PostgreSQL 15 บน RDS เป็น primary DB
- User Activity service เก็บ event ทุก action ใน app (browse, click, add cart, checkout, abandon)
- ปัจจุบัน 60M rows ใน table `user_activities` — growing 5M/เดือน (1.7M/สัปดาห์)
- Use case หลัก: analytics, recommendation, abandoned cart re-engagement

### Why now?
- **Trigger 1:** Q1 2026 — query p95 ขึ้นจาก 280ms → 850ms (+200%)
- **Trigger 2:** Schema migration ครั้งล่าสุด (เพิ่ม column `device_fingerprint`) ใช้เวลา 3.5 ชม. → downtime
- **Trigger 3:** Product roadmap Q2 จะเพิ่ม 8 event types ใหม่ → schema เปลี่ยนบ่อย
- **Cost of waiting:** ทุกเดือนที่รอ + 5M rows → migrate ยากขึ้น 8% (cost compound)

### Constraints
- **Budget:** ≤ THB 80k/เดือน สำหรับ DB infra (ปัจจุบัน RDS = 35k)
- **Timeline:** ต้อง migrate เสร็จก่อน Q2 launch (15/06)
- **Team capacity:** Backend 2 คน (จิน + บอย) — มีงานอื่นรวม 60% capacity
- **Technical:** Service ห้าม downtime > 5 นาที — ลูกค้า active 24/7
- **Compliance:** Activity data มี PII บางส่วน → encryption at rest required

---

## ❓ Problem Statement

User Activity service มี 3 ปัญหาที่กระทบ business:

1. **Slow query** — Recommendation engine ที่ query last-30-day activity ใช้เวลา 850ms p95 → API timeout 4% ของ request → user เห็นหน้า empty recommendations
2. **Schema rigidity** — ทุก event type ใหม่ต้อง ALTER TABLE → 2-4 ชม. downtime → ปัจจุบันเลื่อน 3 features เพราะรอ migration window
3. **Scaling cost** — RDS cost จะขึ้นเป็น 95k/เดือน ใน 6 เดือน (vertical scale) — เกิน budget

**Impact ถ้าไม่แก้:**
- Q2 features ขัดถึง 6 features (ค่าเสียโอกาส ~2 ลบ. revenue)
- Recommendation accuracy ลด 15% = revenue/user ลด ~8%
- Infra cost เกิน budget Q3 = ต้อง re-allocate budget

---

## 💡 Proposal

### High-level approach

Migrate **User Activity service** จาก PostgreSQL → **MongoDB Atlas (M30 cluster)** ด้วย dual-write strategy เพื่อ zero-downtime cutover

### Detailed plan

**Phase 1: Setup MongoDB (Week 1)**
- Provision MongoDB Atlas M30 cluster (Singapore region)
- Setup VPC peering + IAM auth
- Enable encryption at rest + audit log

**Phase 2: Dual-write (Week 2-3)**
- Implement write to both PostgreSQL + MongoDB simultaneously
- Read still from PostgreSQL
- Run for 1 week → verify data consistency (target ≥ 99.99%)

**Phase 3: Backfill (Week 3-4)**
- Backfill 60M historical rows ใช้ Atlas Data Federation
- Estimate: 18 hours, runs in background
- Verify: row count + sample integrity check

**Phase 4: Switch read traffic (Week 5)**
- Feature flag: route 1% → 10% → 50% → 100% reads to MongoDB
- Monitor: latency, error rate, business metric
- Rollback plan: flip flag back to PostgreSQL (< 1 min)

**Phase 5: Decommission PostgreSQL writes (Week 6)**
- Confirm 100% read from MongoDB for 7 days
- Remove dual-write code
- Snapshot + drop PostgreSQL `user_activities` table

### Diagram

```
Before:                     After (Phase 5):

[App]                       [App]
  │                           │
  ▼                           ▼
[PostgreSQL]                [MongoDB Atlas]
  user_activities             user_activities
  60M rows                    60M rows + new events
  
                            [PostgreSQL]
                              orders, payments, users
                              (unchanged)
```

### Cost / Effort

- **Engineering:** 6 person-weeks (จิน 4 wk, บอย 2 wk)
- **Infrastructure:**
  - MongoDB Atlas M30: $0.54/hr × 730 hr = $394/เดือน ≈ THB 14,000
  - Save: PostgreSQL downsize from db.r6g.xlarge → db.r6g.large = save THB 12k/เดือน
  - **Net cost: +THB 2k/เดือน** (vs current)
  - 6 เดือนข้างหน้า: **save THB 50k/เดือน** (vs vertical scale PostgreSQL)
- **Timeline:** 6 weeks (start 22/04, complete 03/06)

---

## 🔄 Alternatives Considered

| Option | Pros | Cons | Why not |
|--------|------|------|---------|
| **A: MongoDB Atlas (proposed)** | Schema flex, horizontal scale, time-series support, managed | Team learning curve, 2 DBs to maintain | ✅ Best fit |
| **B: PostgreSQL partition + scale up** | Same tech stack, no migration risk | Doesn't solve schema rigidity, cost ขึ้น 60% in 12 mo | Doesn't address core pain |
| **C: ClickHouse (analytics DB)** | Best for OLAP, super fast aggregation | Limited write throughput, no good for OLTP-ish use, ทีมไม่มีประสบการณ์ | Wrong fit for use case |
| **D: DynamoDB** | Fully managed, auto-scale, cheap at low scale | Vendor lock-in AWS, query flexibility ต่ำ, cost predict ยาก | Lock-in concern + query needs |
| **E: TimescaleDB (extension)** | Stays in PostgreSQL, time-series optimized | Schema rigidity ยังอยู่, vertical scale cost issue | Doesn't solve schema problem |
| **F: Do nothing** | Zero effort | Problem worsens, blocks Q2 features | Cost of inaction > migration cost |

---

## 🗳️ Decision

(จะ fill เมื่อ status = Accepted หลัง meeting 02/05)

**Decision:** TBD

**Reasoning:** TBD

**Reversibility:** 🚪🔒 One-way door — ย้ายแล้วย้ายกลับ cost สูงมาก (rewrite + data migration อีกรอบ)

---

## ❓ Open Questions

| # | Question | Owner | Status |
|---|----------|-------|--------|
| 1 | จำเป็นต้องเก็บ historical data > 12 เดือนไหม? ถ้าไม่ → archive policy = save cost | @คุณกานต์ (PM) | Open |
| 2 | Monitoring/observability tool ไหนสำหรับ MongoDB? (Datadog / NewRelic) | @คุณเอ๋ (DevOps) | Open |
| 3 | Backup/DR strategy MongoDB? RPO/RTO target? | @คุณเอ๋ + @คุณตู่ | Open |
| 4 | Compliance review — encryption + PII handling ผ่าน? | @คุณตู่ + Legal | Open |
| 5 | จำเป็นต้องมี read replica สำหรับ analytics workload แยกไหม? | @คุณบอย | Open |

---

## 💬 Discussion / Comments

### Round 1 — 17/04 (เริ่ม collect)

> @คุณจิน: "Phase 2 dual-write — เราจะใช้ transactional outbox pattern หรือ best-effort? ถ้า MongoDB write fail แล้วทำยังไง?"
>
> **Author response (บอย):** Transactional outbox + retry queue — ถ้า MongoDB fail → retry 3 ครั้ง → flag for manual review ใน Slack alert

> @คุณตู่ (CTO): "Like the proposal. แต่ concern คือ team สามารถ maintain 2 DBs ได้จริงไหม? เสนอให้ assign 1 person เป็น MongoDB owner"
>
> **Author response (บอย):** Agree — เสนอ @คุณจิน เป็น MongoDB owner + ผมเป็น backup → ทั้งคู่ต้องผ่าน MongoDB University M001 + M201 ก่อน Phase 1

> @คุณกานต์ (PM): "Q2 launch 15/06 ตึง — ถ้า slip 1 wk จะ block อะไร?"
>
> **Author response:** Buffer 12 วันก่อน Q2 launch → slip ได้ ≤ 1 wk โดยไม่กระทบ launch

### Round 2 — TBD

---

## ✅ Approval

| Reviewer | Status | Date | Comment |
|----------|--------|------|---------|
| @คุณตู่ (CTO) | ⏳ Pending | — | จะ review weekend 26-27/04 |
| @คุณกานต์ (PM) | ⏳ Pending | — | — |
| @คุณจิน (Eng) | 🔄 Requested changes | 17/04 | See Q1 above |
| @คุณเอ๋ (DevOps) | ⏳ Pending | — | จะ feedback หลังคุยเรื่อง monitoring |
| @คุณแก้ม (Frontend) | ✅ Approved | 17/04 | ไม่กระทบ frontend ตราบที่ API contract เหมือนเดิม |

---

## 📚 References

- [RFC-031: Initial DB choice for FoodFast](internal-link)
- [RFC-038: Caching strategy with Redis](internal-link)
- [MongoDB Time Series Collections — official doc](https://www.mongodb.com/docs/manual/core/timeseries-collections/)
- [Stripe engineering: Online migration of large tables](https://stripe.com/blog/online-migrations)
- [GitHub: How we migrated MySQL to Vitess](https://github.blog/...)

---

## 📅 Decision Process

- **17/04 - 28/04:** Open for comments (12 วัน)
- **30/04:** Author summarize comments + revise
- **02/05 14:00 (1 ชม.):** Decision meeting
  - Attendees: บอย, จิน, ตู่, กานต์, เอ๋
  - Outcome: Accept / Reject / Defer
- **03/05:** Update RFC status + announce ใน #engineering channel

---

*Generated by /async-communicator — Claude Skill Unlock v1.1*
