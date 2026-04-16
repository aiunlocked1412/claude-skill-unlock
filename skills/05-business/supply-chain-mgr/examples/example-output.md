---
type: supply-chain-analysis
business: chic-fashion-online
focus: ABC + Forecast + 3PL
created: 2026-04-16
status: draft
---

# 🚚 Supply Chain Analysis — Chic Fashion Online (เสื้อผ้า 500 SKU)

## 📊 Business Snapshot

| Field | Value |
|-------|-------|
| ประเภทธุรกิจ | E-commerce เสื้อผ้าผู้หญิง (Shopee + Lazada + own site) |
| จำนวน SKU | 500 (3 size × ~167 design) |
| มูลค่า inventory | 4,500,000 บาท |
| Turnover ปัจจุบัน | 4 ครั้ง/ปี (target: 8) |
| Supplier | 12 ราย (10 ในไทย, 2 จีน — 1688) |
| Avg lead time | 14 วัน (TH) / 35 วัน (จีน) |
| Demand pattern | Seasonal สูง (สิ้นปี + กลางปี + back-to-school) |
| ปัญหาหลัก | Dead stock 30% + stock-out best-seller |

---

## 📦 ABC Analysis

| Class | จำนวน SKU | % SKU | มูลค่า | % มูลค่า | Strategy |
|-------|-----------|-------|--------|----------|----------|
| A | 75 | 15% | 3,375,000 | 75% | นับสัปดาห์, ROP alert |
| B | 150 | 30% | 900,000 | 20% | นับเดือน |
| C | 275 | 55% | 225,000 | 5% | นับ 6 เดือน, clearance |

### Top 10 Class A (Best Sellers)

| Rank | SKU | Annual Value | Action |
|------|-----|-------------|--------|
| 1 | Top สีขาว Basic | 280,000 | Auto reorder weekly |
| 2 | กางเกง Wide-leg ดำ | 240,000 | Stock 2 month buffer |
| 3 | เดรส Mini ครีม | 195,000 | Multi-supplier |
| ... | | | |

---

## 📐 EOQ — Top 3 Class A SKU

| SKU | D/ปี | Order Cost | Holding Cost | EOQ | Order/ปี |
|-----|------|-----------|-------------|-----|---------|
| Top สีขาว | 4,000 | 1,500 | 80 | 388 | 10 |
| กางเกง Wide-leg | 3,200 | 1,500 | 75 | 358 | 9 |
| เดรส Mini | 2,500 | 1,500 | 90 | 289 | 9 |

**Annual cost optimization:**
- ปัจจุบัน: ~180,000 (over-order)
- หลัง EOQ: ~115,000
- **ประหยัด: 65,000/ปี** ✅

---

## 🛡️ Safety Stock & ROP (Service Level 95%)

| SKU | Avg/วัน | Avg LT | Safety Stock | ROP |
|-----|---------|--------|-------------|-----|
| Top สีขาว | 11 | 14 | 32 | 186 |
| กางเกง Wide-leg | 9 | 14 | 26 | 152 |
| เดรส Mini | 7 | 14 | 22 | 120 |

(Z = 1.65 สำหรับ 95%, σ จาก demand variability ราย SKU)

---

## 📈 Demand Forecast — Q3 2026 (เม.ย.-มิ.ย.)

### Method: Seasonal Exponential Smoothing

| Month | Total Forecast | Best Seller | Mid | New Arrival |
|-------|---------------|-------------|-----|-------------|
| เม.ย. | 3,200 units | 1,800 | 950 | 450 |
| พ.ค. | 3,500 units | 1,950 | 1,000 | 550 |
| มิ.ย. | 4,200 units | 2,300 | 1,200 | 700 (mid-year sale) |

**MAPE (last 3 months):** 18% — good ✅

### Seasonal Index (จาก 2 ปีย้อนหลัง)

| เดือน | Index | เหตุผล |
|------|-------|-------|
| Jan | 1.05 | ปีใหม่ |
| Feb | 0.85 | low |
| Mar | 0.90 | |
| Apr | 0.95 | songkran |
| May | 1.05 | |
| **Jun** | **1.30** | mid-year sale 6.6 |
| **Jul** | **1.25** | 7.7 |
| Aug | 0.90 | |
| Sep | 0.95 | |
| Oct | 1.10 | |
| **Nov** | **1.50** | 11.11, BF |
| **Dec** | **1.40** | 12.12, year-end |

---

## 🏭 Supplier Scorecard (Top 5)

| Supplier | Q (30%) | C (25%) | D (20%) | F (15%) | S (10%) | Total | Status |
|----------|---------|---------|---------|---------|---------|-------|--------|
| โรงงาน A (TH) | 4.5 | 3.5 | 4.5 | 4.0 | 4.5 | **4.18** | 🟢 Strategic |
| โรงงาน B (TH) | 4.0 | 4.0 | 4.0 | 3.5 | 4.0 | **3.93** | 🟢 Approved |
| 1688 จีน X | 3.5 | 5.0 | 3.0 | 4.5 | 2.5 | **3.78** | 🟡 Approved |
| โรงงาน C (TH) | 3.0 | 4.5 | 2.5 | 3.0 | 3.5 | **3.30** | 🟡 Watch |
| 1688 จีน Y | 2.5 | 5.0 | 2.0 | 3.5 | 2.0 | **3.00** | 🔴 Phase out |

### Action
- **โรงงาน A** — เพิ่ม allocation 50% (จาก 30%) สำหรับ Class A
- **โรงงาน B** — maintain backup
- **1688 X** — ใช้สำหรับ Class C (volume + cheap)
- **โรงงาน C** — improvement plan 90 วัน (เน้น on-time)
- **1688 Y** — phase out ภายใน 3 เดือน

---

## 🚛 3PL Recommendation

Volume: 3,500 order/เดือน, weight ~0.4 kg/shipment

| 3PL | Price/order | COD fee | API | Score |
|-----|------------|---------|-----|-------|
| **Flash** | 28 | 12 | ✅ | **9/10** |
| **J&T** | 32 | 15 | ✅ | 8/10 |
| Kerry | 38 | 15 | ✅ | 8/10 |
| EMS (ตจว. ห่างไกล) | 40 | n/a | ❌ | 6/10 |

**Recommended mix:**
- Flash 60% — best price + API ดี (ในเขตเมือง)
- J&T 30% — backup + premium customer
- EMS 10% — ตจว. ห่างไกล (Flash/J&T ไม่ครอบ)

**ประหยัดค่าส่ง:** ลดได้ ~25,000/เดือน vs Kerry ทั้งหมด

---

## ⚖️ JIT vs Buffer

| Class | Strategy |
|-------|---------|
| A best seller | JIT (สั่งทุกสัปดาห์ จากโรงงาน A) |
| A new arrival | Buffer 1 เดือน (uncertainty สูง) |
| B | Standard EOQ |
| C | Bulk order ทุก 6 เดือน + clearance ที่ขายไม่ออก |

---

## 🚀 Action Plan (90 วัน)

### Quick Wins (30 วัน)
1. **Clearance Class C dead stock** — ลด 50% sell-out → recover ~400,000 cash
2. **Setup ROP alerts** ใน Shopify backend สำหรับ Class A 75 SKU
3. **Switch 60% volume → Flash** (ประหยัด 25k/เดือน)
4. **Negotiate โรงงาน A** — ขอ payment term 60 วัน + volume discount

### Mid-term (60 วัน)
5. **Phase out 1688 Y** + onboard supplier ทดแทน 1 ราย
6. **Implement bi-weekly inventory count** Class A

### Long-term (90 วัน)
7. **Setup S&OP monthly cycle** กับ marketing (campaign forecast)
8. **เตรียม inventory peak** Nov-Dec (11.11, 12.12) — เพิ่ม buffer 30%

---

## 📊 KPI Tracking

| KPI | ปัจจุบัน | Target 6m | Frequency |
|-----|---------|----------|-----------|
| Inventory turnover | 4×/ปี | 8×/ปี | Monthly |
| DIO (days inventory) | 91 | 45 | Monthly |
| Stock-out rate (Class A) | 12% | < 2% | Weekly |
| Fill rate | 88% | > 95% | Weekly |
| Forecast MAPE | 18% | < 15% | Monthly |
| On-time supplier delivery | 78% | > 95% | Monthly |
| Cash tied in inventory | 4.5M | 2.5M | Monthly |

**Expected outcome:** Cash freed up ~2 ลบ. + เพิ่ม sale 15% (ลด stock-out)

---

## ⚠️ Disclaimer

ตัวเลขทั้งหมดเป็นสมมติฐานสำหรับการเรียนรู้ — ตัวเลขจริงต้องดึงจากระบบ POS/ERP ของธุรกิจจริง + วัด lead time จริง + holding cost ที่รวมต้นทุนจัดเก็บจริง

---

*Generated by /supply-chain-mgr — Claude Skill Unlock v1.1*
