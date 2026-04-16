---
type: procurement-document
category: erp-system
method: RFP
budget: 5,000,000
created: 2026-04-16
status: draft
---

# 🛒 Procurement — ERP System for Mid-size Manufacturer (5 ลบ.)

## 📋 Project Snapshot

| Field | Value |
|-------|-------|
| Category | IT / Enterprise software |
| Type | Indirect (Strategic) |
| มูลค่าโดยประมาณ | 5,000,000 (license + implementation) |
| Method | RFP (complex, ต้องการ solution) |
| Stakeholder | CFO (sponsor), IT Director, Plant Manager, Sales Director |
| Award timeline | 90 วัน |

---

## 📝 RFP Document

### 1. Executive Summary

ABC Manufacturing (โรงงานผลิตชิ้นส่วนยานยนต์, รายได้ 800 ลบ./ปี, พนักงาน 250 คน) ต้องการเปลี่ยนจากระบบบัญชี + Excel ที่ใช้อยู่เป็น ERP เต็มรูปแบบ ครอบคลุม Finance, Inventory, Production, Sales, HR ภายใน 12 เดือน

### 2. Background & Objective

**ปัญหาปัจจุบัน:**
- ข้อมูลกระจายในหลายระบบ (Express + Excel + Google Sheets)
- ปิดงบช้า 15 วันหลังสิ้นเดือน
- Inventory ไม่ realtime → stock-out + dead stock
- Production schedule ไม่เชื่อมกับ sales order

**เป้าหมาย (12 เดือนหลัง go-live):**
1. ปิดงบรายเดือนภายใน 5 วันทำการ
2. Real-time inventory accuracy ≥ 98%
3. Sales-to-production lead time -30%
4. Reduce manual entry 50%
5. ROI ภายใน 36 เดือน

### 3. Scope of Work

#### Modules ที่ต้องการ
- Finance & Accounting (GL, AP, AR, Asset, Budget)
- Inventory & Warehouse Management
- Production Planning (MRP)
- Sales & CRM (Order to Cash)
- Procurement (Purchase to Pay)
- HR & Payroll (พื้นฐาน)
- Reporting & BI dashboard

#### Deliverables
- D1: ERP license + cloud hosting (3 ปี)
- D2: Implementation + data migration
- D3: User training (250 users, 5 sessions)
- D4: Go-live support 90 วัน
- D5: Post go-live support 1 ปี

#### Acceptance Criteria
- UAT pass 95% test cases
- Parallel run 1 เดือนไม่มี discrepancy > 1%
- Performance: report ออกใน < 30 วินาที

### 4. Requirements

#### Mandatory (Must-have)
- [ ] รองรับภาษาไทย (UI + report)
- [ ] รองรับมาตรฐานบัญชีไทย (TFRS for SME / NPAEs)
- [ ] ส่ง e-Tax / e-Invoice ตามกฎหมายสรรพากร
- [ ] Multi-currency (THB, USD, JPY)
- [ ] On-cloud + multi-tenant
- [ ] Mobile app (iOS + Android)
- [ ] User management + role-based access

#### Important (Should-have)
- [ ] AI/automation features
- [ ] Pre-built dashboard for manufacturing KPI
- [ ] Integration กับ Bank API (KTB, SCB, Bangkok Bank)
- [ ] Barcode/QR scanning warehouse

#### Nice-to-have
- [ ] EDI integration กับ customer
- [ ] Predictive maintenance
- [ ] Sustainability reporting (ESG)

### 5. Evaluation Criteria

| Criteria | Weight | Description |
|----------|--------|-------------|
| Functional fit | 35% | ครอบคลุม mandatory + important |
| Vendor capability | 20% | Track record, TH local team, training |
| Implementation | 15% | Methodology, timeline, project mgmt |
| Total Cost (5y TCO) | 20% | License + impl + maintenance + ops |
| Support & SLA | 10% | 24/7 support, response time, SLA% |

### 6. Commercial Terms

- **Pricing:** Subscription per user/month + one-time implementation
- **Payment:** Implementation 30%/40%/30% (kick-off / UAT / go-live), subscription billed quarterly
- **Warranty:** 12 เดือนหลัง go-live (bug fix + minor enhancement)
- **SLA penalty:** Service credit 5% ถ้า uptime < 99.5%
- **IP ownership:** Customizations เป็นของ ABC, base product เป็นของ vendor
- **Exit clause:** Data export ในรูปแบบ open standard (CSV, JSON)

### 7. Submission

- Format: Technical + Commercial แยกซอง (sealed envelope หรือ encrypted PDF)
- Deadline: 15 พ.ค. 2026, 17:00 น.
- Contact: procurement@abc-mfg.co.th

### 8. Timeline

| Milestone | Date |
|-----------|------|
| RFP issued | 16 เม.ย. 2026 |
| Q&A deadline | 30 เม.ย. 2026 |
| Site visit (vendor visit ABC plant) | 5-9 พ.ค. 2026 |
| Bid submission | 15 พ.ค. 2026 |
| Technical evaluation | 16-22 พ.ค. 2026 |
| Vendor demo (top 3) | 23-29 พ.ค. 2026 |
| Commercial open | 1 มิ.ย. 2026 |
| Reference check | 2-7 มิ.ย. 2026 |
| Award decision | 15 มิ.ย. 2026 |
| Contract signing | 30 มิ.ย. 2026 |

---

## 🏭 Vendor Scorecard (Top 4 ที่ shortlist)

| Vendor | Q (25%) | C (25%) | D (15%) | F (15%) | S (10%) | R (10%) | Total | Rank |
|--------|---------|---------|---------|---------|---------|---------|-------|------|
| **SAP B1** | 4.5 | 3.0 | 4.0 | 5.0 | 4.5 | 4.5 | **4.13** | 1 |
| **Oracle NetSuite** | 4.5 | 3.5 | 3.5 | 5.0 | 4.0 | 4.5 | **4.13** | 1 |
| **Odoo Enterprise** | 4.0 | 4.5 | 3.5 | 3.5 | 3.5 | 4.0 | **3.85** | 3 |
| **Local TH ERP** | 3.0 | 5.0 | 4.5 | 3.0 | 4.5 | 3.0 | **3.65** | 4 |

---

## 💰 TCO Comparison (5 ปี, 200 users)

| Cost | SAP B1 | NetSuite | Odoo Ent. | Local TH |
|------|--------|----------|-----------|----------|
| License (5y) | 8,000,000 | 9,000,000 | 4,500,000 | 2,500,000 |
| Implementation | 3,500,000 | 3,000,000 | 2,500,000 | 1,500,000 |
| Cloud hosting (5y) | 1,500,000 | included | 1,200,000 | 800,000 |
| Training | 500,000 | 400,000 | 400,000 | 300,000 |
| Maintenance/customization | 1,500,000 | 1,500,000 | 2,000,000 | 1,000,000 |
| **Total TCO 5y** | **15,000,000** | **13,900,000** | **10,600,000** | **6,100,000** |

⚠️ **Insight:** Local TH ERP TCO ต่ำสุด แต่ score รวมต่ำสุด (Q + F + R risk) — ต้องชั่งน้ำหนัก

---

## ⚖️ Negotiation Strategy (กับ Top 2: NetSuite vs SAP)

### BATNA
- ของเรา: เลือก Odoo Enterprise (TCO ถูกกว่า 25%)
- ของ NetSuite/SAP: ตลาด ERP TH competitive — มี deal ที่อื่นได้
- ZOPA: License 30-40% discount จาก list price

### Levers
1. **3-year commit (vs 1-year):** ขอ license discount 30%
2. **Reference site:** ABC ยอมเป็น case study → ขอ free training
3. **Payment 30/40/30:** vs vendor ขอ 50/30/20 → cash flow flexibility
4. **SLA 99.5% + 5% credit:** standard
5. **Implementation fixed-price** (ไม่ใช่ T&M) → ลด risk over-budget

### Walk-away
- TCO 5y > 12,000,000
- Implementation > 4,000,000
- ไม่มี TH-language support

---

## 🚀 Award Recommendation (สมมติหลัง evaluation)

**Selected vendor:** Oracle NetSuite (รองชนะ + commercial advantage หลัง negotiate)

**Rationale:**
- Score เท่ากับ SAP B1 (4.13)
- TCO ต่ำกว่า SAP 7%
- Cloud-native (ไม่ต้องลงทุน infra)
- Strong financial — low vendor risk
- มี case study TH manufacturing ใกล้เคียง

**Conditions:**
- 3-year contract, ทบทวนปีที่ 2
- License discount 32% (ได้จาก negotiate)
- Implementation fixed-price 2,800,000
- SLA 99.5% + 5% service credit
- Free training ปีที่ 2 (เพิ่ม users)

---

## 📋 Contract Checklist

- [x] Scope: 7 modules ชัดเจน
- [x] Payment: 30/40/30
- [x] Warranty: 12 เดือน post go-live
- [x] SLA: 99.5% + credit
- [x] IP: Customizations เป็นของ ABC
- [x] Termination: 90-day notice + data export
- [x] NDA: signed
- [x] Dispute: Thai Arbitration Institute
- [x] Force majeure standard clause
- [x] Insurance: Professional Indemnity ≥ 50 ลบ.

---

## ⚠️ Disclaimer

ตัวอย่างนี้เป็น scenario สมมติเพื่อการเรียนรู้ — ตัวเลข license/TCO เป็นการประมาณการตลาดทั่วไป ไม่ใช่ official quote การจัดซื้อจริงต้องผ่าน RFP process + นิติกรตรวจสัญญา + CFO approval

---

*Generated by /procurement-pro — Claude Skill Unlock v1.1*
