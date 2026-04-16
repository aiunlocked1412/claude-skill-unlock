---
type: ecommerce-analysis
store: chic-fashion-online
focus: Full Audit
created: 2026-04-16
status: draft
---

# 🛍️ E-commerce Analysis — Chic Fashion Online

## 📊 Store Snapshot

| Field | Value |
|-------|-------|
| Category | Fashion (เสื้อผ้าผู้หญิง) |
| Channels | Shopee + Lazada + TikTok Shop + Line OA |
| GMV/เดือน | 1,500,000 |
| AOV | 480 |
| จำนวน SKU | 500 |
| Price range | 199 - 1,290 |
| Margin (gross) | 55% |
| Fulfillment | 3PL (Flash 60%, J&T 30%, EMS 10%) |
| Return rate | 22% 🔴 (above benchmark 15-25%) |
| Stage | Growth |
| ปัญหาหลัก | Return rate สูง + TikTok ไม่ scale + 11.11 prep |

---

## 📊 Conversion Funnel

| Stage | Volume | Rate | Benchmark | Status |
|-------|--------|------|-----------|--------|
| Impressions | 2,500,000 | - | - | - |
| Visits | 95,000 | 3.8% | 2-5% | ✅ |
| Cart | 11,400 | 12% | 5-15% | ✅ |
| Checkout | 5,700 | 50% | 50-70% | 🟡 |
| Purchase | 3,125 | 55% | 60-80% | 🔴 |
| **Overall CR** | | **3.3%** | 2-3% | ✅ |

### Drop-point Analysis

**Largest drop:** Cart → Checkout = 50% drop (industry low end)

**Root cause:**
- ค่า shipping surprise ที่ checkout (300+ บาท shipping)
- AOV 480 — ส่งฟรี threshold ที่ 500 ทำให้ลูกค้าหยุด

**Fix:**
- ลด free shipping threshold 500 → 399
- Show estimated shipping ที่ product page
- Upsell "เพิ่มอีก ฿X รับ free shipping" ที่ cart

**Expected lift:** Cart → Checkout 50% → 60% = **+625 orders/เดือน** (+300,000 GMV)

---

## 🛒 Cart Abandonment

| Metric | Value | Benchmark |
|--------|-------|-----------|
| Cart abandonment | 73% | 70% |
| Recovery rate (Line OA push) | 8% | 10-20% target |
| Email recovery (own site) | 12% | 15-25% |

### Top reasons (survey 100 customers)

1. **Shipping surprise** — 42% (ลด free ship threshold)
2. **Wait too long** — 22% (express option)
3. **Compare price** — 18% (price match guarantee)
4. **No guest checkout** — 12% (own site issue)
5. **Trust** — 6%

### Action

- [x] Show shipping cost on product page
- [ ] Free shipping threshold 500 → 399
- [ ] Guest checkout (own site)
- [ ] Express delivery option (next-day, +30 บาท)
- [ ] Recovery sequence: Line 1h, email 24h, SMS 72h
- [ ] Retargeting ads (FB, IG) — 7 day window

---

## 💰 Pricing Strategy (Multi-channel)

Unit cost avg: 215 บาท | Target margin: 50-55%

| Platform | Commission + voucher | Base Price | Net Revenue | Net Margin |
|----------|---------------------|-----------|-------------|-----------|
| Shopee | 11% (6% + 5% vou) | 480 | 427 | 50% |
| Lazada | 9% | 480 | 437 | 51% |
| TikTok Shop | 8% (5% + 3%) | 480 | 442 | 51% |
| Own site (Line OA) | 3% (gateway) | 432 (-10%) | 419 | 49% |

**Insight:** Line OA ราคาถูกกว่า ดึงลูกค้าออกจาก platform ได้ + margin ใกล้เคียง

---

## 📦 Fulfillment Performance

| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| Processing | 18 hours | < 24 | ✅ |
| BKK delivery | 1.5 days | 1-2 | ✅ |
| ตจว. delivery | 3.2 days | 2-4 | ✅ |
| On-time | 93% | > 95% | 🟡 |
| Damage rate | 0.6% | < 1% | ✅ |
| Lost rate | 0.2% | < 0.3% | ✅ |

### 3PL mix

| 3PL | % | Cost/order | On-time | Action |
|-----|---|-----------|---------|--------|
| Flash | 60% | 28 | 94% | maintain |
| J&T | 30% | 32 | 92% | maintain |
| EMS | 10% | 40 | 88% | สำหรับ ตจว. ห่างไกล only |

**Total fulfillment cost:** ~93,000/เดือน

---

## ↩️ Return Analysis (CRITICAL)

**Return rate: 22%** — ใน fashion benchmark 15-25% แต่อยู่ขอบบน

| Reason | % of returns |
|--------|-------------|
| **Size wrong** | **65%** 🔴 |
| Color/photo mismatch | 18% |
| Defect | 8% |
| Change mind | 6% |
| Other | 3% |

### Top SKU returned

| SKU | Return rate | Reason | Action |
|-----|------------|--------|--------|
| Bodycon dress S/M | 38% | size run small | redo size chart + measurement |
| Wide-leg pants | 32% | length issue | add length chart + model height |
| Knit sweater oversized | 28% | size confusing | rename + measurement |

### Action to reduce return (target 22% → 15%)

- [ ] **Detailed size chart** ที่มี actual measurement (ชิ้น × cm) ไม่ใช่แค่ S/M/L
- [ ] **Model height/size info** ในทุกรูป (เช่น "นางแบบสูง 168 cm ใส่ size M")
- [ ] **Multi-angle photo** + 360° + try-on video
- [ ] **Customer reviews with size feedback** highlight ใน product page
- [ ] **Pre-purchase Q&A** Line OA — answer ภายใน 30 นาที
- [ ] **Free first exchange** (vs return) → keep customer + reduce true return

**Expected impact:** 22% → 15% return = save ~150 orders × 480 = **72,000 บาท/เดือน**

---

## 🏪 Multi-channel Performance

| Channel | GMV | % | Margin | CAC | ROAS |
|---------|-----|---|--------|-----|------|
| Shopee | 750,000 | 50% | 50% | 35 | 5.2 |
| Lazada | 375,000 | 25% | 51% | 42 | 4.1 |
| TikTok Shop | 225,000 | 15% | 51% | 65 | 2.8 |
| Line OA + own | 150,000 | 10% | 49% | 22 | 8.5 |
| **Total** | **1,500,000** | 100% | 50.4% | | |

### Insight

- **Line OA** ROAS 8.5 — best, scale up
- **TikTok Shop** ROAS 2.8 — ต่ำ, ต้องปรับ content (live commerce vs ads)
- **Shopee** dominant แต่ commission กิน margin ลด
- **Risk:** ถ้า Shopee algorithm เปลี่ยน → 50% GMV กระทบ

### Recommendation

- **Shopee:** maintain spend, focus organic ranking (rating 4.6+)
- **Lazada:** optimize LazMall premium positioning
- **TikTok Shop:** เปลี่ยน strategy → live commerce 3 ครั้ง/สัปดาห์ (vs ads)
- **Line OA:** scale aggressive — บางเดือน 30% promo for repeat
- **เริ่ม own Shopify** Q3 2026 (สำหรับ premium line)

---

## ⭐ Review Performance

| Channel | Rating | Total Reviews | Response Rate | < 24h |
|---------|--------|--------------|---------------|-------|
| Shopee | 4.6 | 8,200 | 65% | 80% |
| Lazada | 4.5 | 3,100 | 70% | 85% |
| TikTok | 4.7 | 950 | 80% | 90% |

### Top negative themes

1. **Size wrong** (215 negative reviews) — แก้ด้วย size chart improvement
2. **Color หม่นกว่ารูป** (88) — true-to-life photo
3. **ส่งช้า** (52) — 3PL on-time ปรับ

### Action

- [x] Auto follow-up D+7 (Shopee + Lazada)
- [ ] Increase response rate Shopee 65% → 90%
- [ ] Insert "review = 5% off next" card ในกล่อง

---

## 💎 Customer Lifetime Value

| Metric | Value |
|--------|-------|
| AOV | 480 |
| Purchase frequency | 3.2 ครั้ง/ปี |
| Lifespan | 2.5 ปี |
| **CLV** | **3,840** |
| CAC blended | 38 |
| **CLV/CAC** | **101** ✅ excellent |
| Repeat rate | 35% (target 50%+) |

### Retention tactics

- [ ] Line OA loyalty tier (Bronze/Silver/Gold)
- [ ] Birthday discount 15%
- [ ] VIP early access (new collection 24h ก่อน public)
- [ ] Refer-a-friend: ทั้งคู่รับ 50 บาท

---

## 🎯 Promo Calendar Q2-Q3 2026

| Date | Event | Theme | Budget Ads | Expected GMV |
|------|-------|-------|-----------|--------------|
| 5.5 | Mid-month | flash 15% | 15,000 | +250k |
| 6.6 | Mid-year mega | flash 25% + free ship 299 | 30,000 | +800k |
| 7.7 | TikTok mega | live × 5 | 25,000 | +500k |
| 8.8 | Singles | bundle | 18,000 | +400k |
| 9.9 | Shopee birthday | brand push | 35,000 | +900k |
| 10.10 | Lazada | LazMall feature | 22,000 | +500k |
| **11.11** | **Singles Day** | **MEGA all-channel** | **80,000** | **+2,500k** 🚀 |
| 12.12 | Year-end | clearance | 30,000 | +1,200k |

### 11.11 Prep (T-30 days)

- [ ] Stock 40% extra (top 30 SKU)
- [ ] Pre-launch ads (T-14)
- [ ] Banner + 4 flash sale slots schedule
- [ ] Customer service +100% capacity (outsource)
- [ ] Fulfillment +60% capacity (talk Flash + J&T)
- [ ] Live commerce schedule TikTok (5 ครั้ง 11-13 พ.ย.)
- [ ] Email/Line teaser (T-14, T-7, T-1)
- [ ] Bundle ready (3-for-X)

---

## 🚀 Action Plan (90 วัน)

### Quick Wins (30 วัน)
1. **ลด free ship threshold 500 → 399** (recovery cart drop)
2. **Detailed size chart** + model height ทุก SKU
3. **Increase Line OA push** — daily story + weekly broadcast
4. **Response review Shopee 90%** target

### Mid-term (60 วัน)
5. **Launch loyalty program** Line OA tier
6. **TikTok Live commerce** 3 ครั้ง/สัปดาห์
7. **Pre-purchase Q&A SLA** 30 min response

### Long-term (90 วัน)
8. **11.11 prep** (เริ่ม T-30 = 12 ต.ค.)
9. **Build own Shopify** สำหรับ premium line
10. **Refer-a-friend** program launch

---

## 📊 KPI Dashboard

| KPI | Current | Target 6m | Frequency |
|-----|---------|-----------|-----------|
| GMV | 1.5 M | 2.2 M | Weekly |
| Conversion rate | 3.3% | 4.0% | Weekly |
| AOV | 480 | 550 | Weekly |
| Cart abandonment | 73% | 60% | Weekly |
| Return rate | 22% | 15% | Monthly |
| Rating (avg) | 4.6 | ≥ 4.7 | Monthly |
| Repeat customer | 35% | 50% | Monthly |
| ROAS blended | 4.5 | > 5.0 | Weekly |
| CLV/CAC | 101 | maintain | Monthly |

**Expected outcome 6 เดือน:**
- GMV +47%
- Net profit +60% (ลด return + better margin)

---

## ⚠️ Disclaimer

ตัวเลขในตัวอย่างเป็น scenario สมมติ — commission, policy, algorithm ของ Shopee/Lazada/TikTok เปลี่ยนได้ ตรวจล่าสุดใน Seller Center ก่อน implement

---

*Generated by /ecommerce-mgr — Claude Skill Unlock v1.1*
