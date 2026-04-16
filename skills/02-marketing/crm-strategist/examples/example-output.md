---
type: crm-strategy
business: "GlowLab — D2C Skincare brand"
customer_count: 25000
aov: 1850
purchase_frequency: 3.2
created: 2026-04-16
status: draft
---

# 👥 CRM Strategy: GlowLab

## 📊 Brief Summary

| Field | Value |
|-------|-------|
| Business model | D2C e-commerce skincare |
| Total customer | 25,000 (3 ปีย้อนหลัง) |
| Active 30d | 4,200 |
| AOV | 1,850 บาท |
| Purchase frequency | 3.2 ครั้ง/ปี |
| Margin % | 65% |
| Current LTV | 11,544 บาท (3-yr) |
| Current CAC | 480 บาท |
| LTV/CAC ratio | 24:1 (under-investing in growth) |
| Goal | Repeat 28% → 42%, NPS 35 → 55, ขยาย Champions × 2 |

---

## 🎯 RFM Segmentation (Snapshot Apr 2026)

### Score Distribution

| Segment | RFM | Count | % | Avg LTV | Revenue contribution |
|---------|-----|-------|---|---------|---------------------|
| **Champions** | 5,5,5 | 1,250 | 5% | 28,500 | 31% (35.6M) |
| Loyal | 4-5,4-5,4-5 | 2,800 | 11% | 14,800 | 23% (41.4M) |
| Potential loyalist | 5,3,3 | 3,200 | 13% | 6,800 | 12% (21.7M) |
| New | 5,1,1 | 2,100 | 8% | 1,850 | 2% (3.9M) |
| Promising | 4,1,1 | 1,800 | 7% | 2,500 | 2% (4.5M) |
| Need attention | 3,3,3 | 2,000 | 8% | 5,200 | 6% (10.4M) |
| About to sleep | 3,1,1-2 | 2,500 | 10% | 2,400 | 3% (6.0M) |
| At risk | 2,2-3,3-5 | 3,500 | 14% | 8,200 | 14% (28.7M) |
| **Cannot lose** | 1,4-5,4-5 | 450 | 2% | 22,000 | 5% (9.9M) |
| Hibernating | 2,1-2,1-2 | 2,200 | 9% | 2,100 | 1% (4.6M) |
| Lost | 1,1,1 | 3,200 | 13% | 1,500 | 1% (4.8M) |
| **Total** | | **25,000** | **100%** | | **100% (171.5M)** |

### Key Insight
- **Champions (5%) + Loyal (11%) = 16% ของ customer ทำ 54% ของ revenue**
- **Cannot lose 450 คน = 5% revenue → if churn = 9.9M revenue หายต่อปี**
- **Lost 13% = ลบออกจาก list active เพื่อรักษา deliverability**

---

## 🎯 Strategy per Segment

| Segment | Channel | Frequency | Offer | Goal |
|---------|---------|-----------|-------|------|
| **Champions (1,250)** | Personal LINE + email | 2/wk | Early access ใหม่ + VIP box ฟรีปีละ 2 ครั้ง + refer-friend 1,000 บาท | เพิ่ม referral 25% |
| **Loyal (2,800)** | Email + LINE | 1/wk | Cross-sell บำรุง premium (serum, eye cream) + community | Upgrade ไป Champion |
| **Potential loyalist (3,200)** | Email | 2/wk | Bundle 3-step + subscription -10% | เพิ่ม F จาก 2 → 4/yr |
| **New (2,100)** | Welcome series 5 email | D0-14 | Onboarding + 2nd purchase 15% off | Activation rate 60% |
| **Promising (1,800)** | Educational nurture | 1/wk | Skin quiz + free sample bundle | Convert ภายใน 60 วัน |
| **Need attention (2,000)** | Email + survey | 1/wk | Personalized offer + "ทำไมไม่ซื้อ?" | Diagnose → fix |
| **About to sleep (2,500)** | Light email | 1/2wk | Value content (skincare tip) + soft 10% | Re-spark |
| **At risk (3,500)** | Email + FB retarget | 2/wk | 15% discount + check-in personal | Save 25% |
| **Cannot lose (450)** | **Personal call + custom box** | **Within 7d** | Custom curated box + 1-on-1 consult ฟรี | **URGENT save 50%** |
| Hibernating (2,200) | Low-touch | 1/mo | Re-spark "เรามีอะไรใหม่" | Wake up 5% |
| Lost (3,200) | Final 3-email then sunset | 14d | Last call 25% then remove | Clean list |

---

## 🔄 AARRR Lifecycle Map

| Stage | Current | Target | Gap Action |
|-------|---------|--------|-----------|
| Acquisition | CAC 480 | 480 (rebalance) | เพิ่ม organic (TikTok, SEO) |
| Activation (1st purchase 30d) | 38% | 60% | Welcome offer 15% + sample bundle |
| Retention 30d | 22% | 35% | Onboard email + LINE check-in |
| Retention 90d | 28% (=repeat rate) | 42% | Subscription nudge + cross-sell |
| LTV | 11,544 | 16,500 (+43%) | Loyalty + premium upsell |
| LTV/CAC | 24:1 | 30:1 | Maintain by efficient retention |
| NPS | 35 | 55+ | Survey + close-the-loop CS |
| Referral % | 8% | 18% | Champion refer program |

---

## 📉 Churn Prediction Model

### Signals (apply weekly via Klaviyo flow)

| Signal | Weight | Threshold (skincare context) |
|--------|--------|------------------------------|
| ไม่ซื้อ > 2x avg cycle | 30 | >225 วัน (2x 112d) |
| ไม่เปิด email > 60d | 15 | 60d |
| Browse > 5x no purchase | 10 | 5 visit ใน 30d |
| AOV ลด > 30% | 15 | -30% เทียบ 6m avg |
| CS complaint logged | 20 | Per ticket |
| Refund/return | 10 | Per refund |
| Subscription pause | 25 | Per pause |
| LINE OA leave | 20 | Unfollow event |

### Score Action

| Score | Action | Owner |
|-------|--------|-------|
| 0-30 | Standard nurture | Email auto |
| 31-60 | Increase to 2/wk + personalized content | Email auto |
| 61-85 | Trigger 5-email save campaign + LINE personal message | CRM team |
| 86-100 | **Personal LINE/call within 24h + custom offer** | **CRM Manager** |

### Expected Reduction
- Churn rate: 35% → 22% ใน 6 เดือน
- Save rate at-risk: 30% (vs 5% baseline)

---

## 💔 Win-Back Campaign (90-Day Program)

### Email Sequence — Lapsed Customer (D+60+)

**Email 1 (D+60):** "เราคิดถึงคุณ"
> สวัสดีค่ะ <ชื่อ>, สังเกตว่าไม่ได้สั่งจาก GlowLab สักพักแล้ว
> สบายดีไหมคะ? นุ้ยแอบกังวลว่าผิวเปลี่ยนไหม
> [ดู serum ตัวใหม่ที่ลูกค้าซื้อซ้ำที่สุด]

**Email 2 (D+75):** "ของใหม่ที่ออกขณะที่คุณไม่อยู่"
> [New arrivals + best seller + content article]

**Email 3 (D+85):** "ของขวัญพิเศษ — 20% สำหรับคุณคนเดียว"
> [Personal code valid 7 วัน]

**Email 4 (D+88):** "48 ชม. สุดท้าย — โค้ด WELCOME20 ปิด"
> [+ free shipping bonus]

**Email 5 (D+90):** "ยังอยากรับ email จาก GlowLab ไหม?"
> [Y/N — ถ้าไม่ตอบใน 7d → sunset]

### Multi-channel Add-on
- LINE OA personal message Day 80 + Day 88 (CS team manual for spend > 5k)
- SMS Day 88 (only critical 86+)
- Retargeting FB/Google (D+60 to D+90)

### Expected Recovery
- Email reactivation: 12% (industry avg 8-15%)
- Multi-channel boost: +5% = 17% total
- ROI: 7-10x cost

---

## 🏆 Loyalty Program: GlowClub

### Tier Structure

| Tier | Spend/yr | Est customer | Benefit | Cost % |
|------|---------|-------------|---------|--------|
| **Glow Silver** | 0-3,000 | 70% (17,500) | 1% cashback (point) + birthday 50 บาท | 1.2% |
| **Glow Gold** | 3,001-10,000 | 22% (5,500) | 3% + birthday 200 + early access ใหม่ | 3.8% |
| **Glow Platinum** | 10,000+ | 8% (2,000) | 5% + free ship + concierge LINE + Quarterly box ฟรี | 6.5% |

### Economics
```
Loyalty cost (yearly):
- Silver: 17,500 × 1,000 spend × 1.2% = 210,000
- Gold: 5,500 × 6,000 spend × 3.8% = 1,254,000
- Platinum: 2,000 × 18,000 spend × 6.5% = 2,340,000
─────────────────────
Total cost: 3,804,000 บาท

Loyalty lift (incremental purchase from members):
- Repeat % +14% (28% → 42%) × 25,000 customer × 1,850 AOV × 0.5 (6 month conservative)
= 3,237,500 incremental revenue/half-year
- × 65% margin = 2,104,375 incremental margin

Net first 6 months: 2,104k margin - 1,902k cost (half) = 202k net positive
After 12 months: 4,209k margin - 3,804k cost = 405k net + brand equity
```

### Earning Rules
- 1 บาท = 1 point
- Birthday month: 2x point
- Refer-a-friend converts: 500 point ทั้งสองฝ่าย
- Review with photo: 100 point
- Survey complete: 50 point

### Redemption
- 100 point = ส่วนลด 10 บาท (cap 200 บาท/order)
- 500 point = ส่งฟรี
- 2,000 point = exclusive serum 30ml limited

---

## 📊 LTV / CAC Analysis

### Current
```
AOV: 1,850 บาท
Frequency: 3.2/yr
Margin: 65%
Lifespan: 3 yr
─────────────
LTV = 1,850 × 3.2 × 0.65 × 3 = 11,544 บาท

CAC: 480 บาท (organic 60% / paid 40%)
LTV/CAC: 24:1
Payback period: 30 วัน (excellent)
```

### Cohort Analysis (last 12 month)

| Cohort | M1 retention | M3 | M6 | M12 |
|--------|-------------|----|----|-----|
| Apr 25 | 100% | 38% | 26% | 19% |
| Jul 25 | 100% | 41% | 28% | 21% |
| Oct 25 | 100% | 44% | 30% | - |
| Jan 26 | 100% | 47% | - | - |

**Trend:** Retention เพิ่ม 9 percentage point YoY → onboarding ดีขึ้น แต่ M6+ ยัง drop 70% — ตรงนี้คือ opportunity

### Targets (6 months)

| Metric | Current | Target |
|--------|---------|--------|
| LTV | 11,544 | 16,500 (+43%) |
| CAC | 480 | 480 (maintain) |
| LTV/CAC | 24:1 | 34:1 |
| 90-day retention | 28% | 42% |
| 12-month retention | 19% | 30% |

---

## 📋 Customer Journey Orchestration

| Stage | Web | Email | LINE | SMS | App |
|-------|-----|-------|------|-----|-----|
| Awareness | Landing + skin quiz | - | Welcome auto + freebie | - | - |
| Consider | Personalized recommend | Newsletter weekly | Q&A bot | - | Browse history |
| Purchase | Checkout simple | Order confirm | Receipt | Delivery | Order |
| Onboard | Tutorial card | Welcome 5 (D0-14) | Day 3 LINE check-in | - | First-use guide |
| Retain | Personalized homepage | Bi-weekly nurture | Promo + new arrival | - | Push reminder |
| Revenue | Cross-sell at PDP | Bundle email | Flash sale | - | Premium tier |
| Refer | Refer-friend page | Referral kit Day 30 | Share template | - | Invite |

---

## 🛠️ Tech Stack

| Layer | Tool | Status |
|-------|------|--------|
| CDP / source of truth | Klaviyo Segmentation | Existing |
| Email | Klaviyo | Existing |
| LINE OA | LINE OA + Tagshop integration | Need integration |
| SMS | Thaibulksms | Need setup |
| Loyalty | LoyaltyLion | New — Q2 launch |
| Analytics | GA4 + Klaviyo cohort | Existing |
| Survey | Typeform (NPS) | Existing |

---

## 🚀 90-Day Implementation Roadmap

### Month 1: Foundation (Apr 16 - May 15)
- [x] Data quality audit + email dedup
- [x] RFM scoring model build (Klaviyo segment)
- [x] All 25k customer segmented
- [ ] Setup cohort tracking (M1/3/6/12)
- [ ] Champions VIP LINE group launch (450 + 1,250)

### Month 2: Activation (May 16 - Jun 15)
- [ ] Welcome series 5-email automation live
- [ ] Win-back 5-email automation live
- [ ] Churn score live + Slack alerting (score 86+)
- [ ] LoyaltyLion soft beta (Champions only)
- [ ] LINE OA integration

### Month 3: Optimize (Jun 16 - Jul 15)
- [ ] A/B test save campaign (subject + offer)
- [ ] Cross-sell automation (post-purchase)
- [ ] Loyalty full launch + tier announcement
- [ ] Quarterly cohort review meeting

---

## 📊 KPI Dashboard (Target trajectory)

| Metric | Now | M1 | M3 | M6 |
|--------|-----|-----|-----|-----|
| Repeat purchase rate | 28% | 30% | 35% | 42% |
| 90-day retention | 28% | 30% | 35% | 42% |
| LTV | 11,544 | 12,000 | 13,800 | 16,500 |
| LTV/CAC | 24 | 25 | 28 | 34 |
| Churn rate | 35% | 33% | 28% | 22% |
| NPS | 35 | 38 | 45 | 55+ |
| % Champions | 5% | 5.5% | 7% | 10% |
| % Lost (cleaned) | 13% | 13% | 8% | 5% |

---

## 📋 Launch Checklist

- [x] Data quality audit complete (1,200 dup removed)
- [x] RFM scoring model live in Klaviyo
- [x] 25,000 customer segmented + tagged
- [ ] Welcome series 5 email tested (sent to internal)
- [ ] Win-back automation live
- [ ] Churn score alerting (Slack #crm-alerts)
- [ ] LoyaltyLion installed + tier configured
- [ ] Personal save playbook PDF for CS team (Cannot lose 450)
- [ ] Cohort dashboard Looker Studio live
- [ ] Quarterly review (1st Wed each month)

---

*Generated by /crm-strategist — Claude Skill Unlock v1.1*
