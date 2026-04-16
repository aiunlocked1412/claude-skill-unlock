---
type: audit-document
area: Procure-to-Pay (P2P)
audit_type: internal
period: FY2026 Q1 (Jan-Mar)
created: 2026-04-16
status: draft
---

# 🔍 Audit — Procure-to-Pay Process

## ⚠️ Disclaimer

> **Audit จริงต้องดำเนินการโดย CPA/CIA ที่มีใบอนุญาต**

---

## 📋 Audit Snapshot

| Field | Value |
|-------|-------|
| Company | ABC Manufacturing (รายได้ 800 ลบ./ปี) |
| Audit Area | Procure-to-Pay (PR → PO → GR → AP → Payment) |
| Period covered | FY2026 Q1 (Jan-Mar 2026) |
| Audit Lead | Internal Audit Manager (CIA) |
| Standard | IIA + COSO + Internal SOP |
| Materiality threshold | 500,000 บาท (~0.06% revenue) |
| Audit days budget | 25 days |

---

## 🎯 Audit Objective & Scope

### Objective
1. ประเมินความเหมาะสมของ design ของ P2P controls
2. ทดสอบ operating effectiveness ของ key controls
3. ประเมิน fraud risk + segregation of duties
4. ประเมิน vendor master data integrity
5. ประเมิน compliance ตาม Procurement Policy

### Scope
- **In scope:** PR-PO-GR-Invoice-Payment ทุก vendor invoice > 50,000 บาท ในช่วง Q1
- **Out of scope:** Petty cash, P-card transactions, ค่าน้ำค่าไฟ (auto-debit)
- **Limitations:** ไม่ได้ audit foreign vendor (ทำใน Q2)

---

## 📊 Risk Assessment

| Risk | Inherent (L×I) | Existing Controls | Effective | Residual |
|------|---------------|-------------------|-----------|----------|
| Fictitious vendor / fraud payment | 3×5 = 15 H | Vendor onboarding + 2 approval | 3/5 | 12 H |
| Duplicate payment | 4×3 = 12 M | ERP duplicate check | 4/5 | 6 L |
| Approval bypass | 3×4 = 12 M | ERP workflow | 4/5 | 6 L |
| Price/quantity mismatch | 4×4 = 16 H | 3-way match | 4/5 | 8 M |
| Vendor master tampering | 2×5 = 10 M | DBA approval | 3/5 | 7 M |
| Late payment penalty | 3×2 = 6 L | AP aging report | 4/5 | 3 L |
| Missing tax invoice | 4×3 = 12 M | Manual scan | 2/5 | 10 M |

### Heat Map (Residual Risk)

```
Impact →
  5 |  .  .  X  .  .         X = Fictitious vendor (12)
  4 |  .  .  .  X  .         X = Price mismatch (8)
  3 |  .  X  X  .  .         X = Vendor tampering, Missing tax inv
  2 |  .  X  X  .  .         X = Duplicate, Approval bypass
  1 |  X  .  .  .  .         X = Late payment
    +─────────────────
       1  2  3  4  5  Likelihood
```

**Focus areas:** Fictitious vendor + Missing tax invoice + Price mismatch

---

## 🎯 Sampling Plan

| Test | Population | Method | Sample | Rationale |
|------|-----------|--------|--------|-----------|
| 3-way match | 1,200 invoices | Statistical random | 60 | 95% conf, 5% tolerable |
| Approval workflow | 1,200 invoices | Statistical | 60 | same |
| Vendor onboarding | 35 new vendors | 100% (small pop) | 35 | high risk |
| Vendor master changes | 88 changes | Judgmental | 25 | bank account changes |
| High-value invoices | 45 invoices > 500k | 100% | 45 | materiality |
| Duplicate payment | 1,200 | Data analytics | 100% | full population test |

---

## ✅ Test of Controls (Top 3)

### Control 1: 3-way Match (PO ↔ GR ↔ Invoice)

**Design:** Automated in ERP, blocks payment if mismatch > tolerance ±2%
**Test:** 60 invoices, inspection + re-performance
**Result:** 58/60 passed (97%) ✅
**Exceptions:** 2 invoices manual override โดย CFO (approved)
**Conclusion:** Effective with documented overrides

---

### Control 2: Vendor Onboarding 2-step approval

**Design:** AP request → Procurement Manager approve → Finance Director approve
**Test:** 35 new vendors (100%)
**Result:** 32/35 passed (91%) 🟡
**Exceptions:**
- 2 vendors missing Finance Director approval (timing)
- 1 vendor approved by Procurement Manager who later became employee of vendor (CONFLICT 🚨)

**Conclusion:** Operating with significant deficiency → Finding 1

---

### Control 3: Vendor Master Bank Account Change

**Design:** Bank change requires DBA + Finance Director approval + call-back to vendor
**Test:** 25/88 changes, judgmental
**Result:** 22/25 passed (88%) 🟡
**Exceptions:**
- 3 changes ไม่มี call-back evidence
- All 3 changes กระทำโดย AP clerk เดียวกัน

**Conclusion:** Control gap → Finding 2

---

## 📝 Audit Findings

### Finding 1: Conflict of Interest — Vendor Onboarding

**Severity:** 🔴 **HIGH**

**Condition:**
1 vendor (XYZ Trading) ถูก onboard เมื่อ ก.พ. 2026 โดย Procurement Manager (Mr. K) ซึ่งต่อมาในเดือน เม.ย. ลาออกไปเป็น Sales Director ของ XYZ Trading. ในช่วง 2 เดือน บริษัทจ่ายเงินให้ XYZ ไปแล้ว 3.2 ลบ.

**Criteria:**
- Procurement Policy section 4.3: "Approver ต้อง declare conflict of interest"
- Code of Conduct: "พนักงานต้อง disclose related party"

**Cause (5 Whys):**
- Why: Mr. K ไม่ disclose conflict
- Why: ไม่มี mandatory declaration form ตอน onboarding vendor
- Why: Vendor onboarding process ไม่ check conflict
- Why: HR data ไม่เชื่อมกับ Procurement
- Why: ไม่มี policy บังคับ rotation/cooling-off

**Consequence:**
- Financial: 3.2 ลบ. ที่จ่ายไปแล้ว — ต้อง investigate ราคาเทียบตลาด
- Compliance: ผิด Code of Conduct
- Reputation: risk media ถ้ามี leak
- Legal: อาจเข้าข่าย ม.157 ถ้าราคาสูงกว่าตลาด

**Recommendation:**
1. Immediate: Suspend payment to XYZ + investigate by external counsel
2. Within 30 days: Implement vendor conflict check (HR-Procurement integration)
3. Within 60 days: Add cooling-off period 6 เดือน หลังพนักงาน resign
4. Within 90 days: Mandatory annual COI declaration ทุกพนักงานที่มี approval authority

**Management Response:**
- Owner: CFO + HR Director
- Due date: 30 มิ.ย. 2026
- Action: External investigation + policy update — agreed

---

### Finding 2: Vendor Master Bank Change Without Call-Back

**Severity:** 🟡 **MEDIUM**

**Condition:**
3/25 vendor bank account changes ใน Q1 ไม่มี evidence ของ call-back verification กับ vendor (ทั้ง 3 ทำโดย AP clerk เดียวกัน)

**Criteria:**
- AP SOP section 7.2: "ทุก bank change ต้อง call-back to vendor primary contact + record audio/note"

**Cause:**
- Process step ไม่มีใน ERP — เป็น manual control
- AP clerk ไม่ทราบความสำคัญ (no training refresher)

**Consequence:**
- Financial: Risk fraudulent diversion ~50,000-200,000/transaction
- Operational: 3 transactions × avg 100k = 300,000 at risk

**Recommendation:**
1. Add ERP mandatory checkbox + upload call-back recording
2. Quarterly training refresher AP team
3. Independent reconciliation by Finance ทุกเดือน

**Management Response:**
- Owner: AP Manager
- Due date: 31 พ.ค. 2026

---

### Finding 3: Missing Tax Invoice for Input VAT Claim

**Severity:** 🟡 **MEDIUM**

**Condition:**
จาก review 60 invoices, พบ 8 invoices (13%) ไม่มี tax invoice ที่ถูกต้อง (ขาด TIN, ขาดที่อยู่, ขาดเลขลำดับ) แต่ถูก claim input VAT แล้ว ~180,000

**Criteria:**
- ประมวลรัษฎากร ม.86/4: "ใบกำกับภาษีต้องมีรายการครบถ้วน"

**Cause:**
- AP ไม่ตรวจ tax invoice format ก่อน post
- Vendor บางรายส่งเอกสารไม่ถูก format

**Consequence:**
- Financial: ถ้า สรรพากร audit → ปรับเงิน + ดอกเบี้ย ~250,000
- Compliance: high

**Recommendation:**
1. AP ใช้ checklist tax invoice ก่อน post
2. Vendor education — ส่ง template
3. ขอ replacement tax invoice ภายใน 30 วัน

**Management Response:**
- Owner: AP Manager + Tax Manager
- Due date: 31 พ.ค. 2026

---

## 📊 Summary

| Severity | Count |
|----------|-------|
| 🔴 High | 1 |
| 🟡 Medium | 2 |
| 🟢 Low | 4 |
| **Total** | **7** |

### Top 3 Risks Identified
1. **Conflict of Interest** in vendor onboarding (Finding 1)
2. **Bank account fraud risk** in vendor master (Finding 2)
3. **Tax compliance gap** in input VAT claim (Finding 3)

### Overall Audit Opinion
🟡 **NEEDS IMPROVEMENT** (1 high finding requires immediate attention)

---

## 🚀 Action Plan Tracking

| # | Action | Owner | Due | Status |
|---|--------|-------|-----|--------|
| F1 | External investigation XYZ Trading | CFO | 30 พ.ค. | Open |
| F1 | COI declaration policy | HR Director | 30 มิ.ย. | Open |
| F2 | ERP mandatory call-back upload | IT + AP | 31 พ.ค. | Open |
| F3 | Tax invoice checklist | Tax Manager | 31 พ.ค. | Open |

**Follow-up audit:** 30 ก.ย. 2026 (90 วันหลัง due dates)

---

## 📋 Workpapers

- WP-01: Risk assessment matrix (Excel)
- WP-02: Sample selection methodology
- WP-03: Test of controls — 3-way match (results)
- WP-04: Vendor onboarding test (35 records)
- WP-05: Bank account change test (25 records)
- WP-06: Tax invoice review (60 invoices)
- WP-07: COI investigation memo (preliminary)
- WP-08: Management response sign-off

---

## ⚠️ Disclaimer

> **Audit จริงต้องดำเนินการโดย CPA/CIA ที่มีใบอนุญาต**
>
> รายงานตัวอย่างนี้สำหรับการเรียนรู้ — ตัวเลขและ scenario เป็นสมมติ ก่อนใช้ template นี้กับการ audit จริง ต้องปรับให้เข้ากับ policy + standard ของบริษัท + กฎหมายไทย ออก audit opinion ทางการต้อง CPA/CIA + Audit Committee approval

---

*Generated by /auditor-pro — Claude Skill Unlock v1.1*
