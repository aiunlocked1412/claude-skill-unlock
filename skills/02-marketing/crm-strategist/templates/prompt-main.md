# CRM Strategist — Framework & Math

## Recipe: Full CRM Strategy

```
/crm-strategist full
Business model: <DTC / subscription / B2B / marketplace>
Customer count: <total + active 30d>
AOV: <บาท>
Purchase frequency: <ครั้ง/ปี>
Avg margin: <%>
Existing tool: <CRM ปัจจุบัน>
Goal: <retention / LTV / churn reduction>
Timeline: <when to launch>
```

---

## RFM Scoring Method

### Step 1: Score แต่ละ dimension 1-5

```
Recency (R): จำนวนวันตั้งแต่ซื้อล่าสุด
- R5: <30d
- R4: 30-60d
- R3: 60-120d
- R2: 120-180d
- R1: 180+d

Frequency (F): จำนวนครั้งที่ซื้อใน 12 เดือน
- F5: 6+ ครั้ง
- F4: 4-5
- F3: 2-3
- F2: 1
- F1: 0 (lapsed)

Monetary (M): ยอดรวมที่จ่ายใน 12 เดือน
- M5: Top 20% spender
- M4: 21-40%
- M3: 41-60%
- M2: 61-80%
- M1: Bottom 20%
```

### Step 2: Map RFM combo → 11 segment

| Segment | RFM | % of base | Strategy |
|---------|-----|-----------|----------|
| **Champions** | 5,5,5 / 5,4,5 / 5,5,4 | 5-10% | VIP + early access + referral incentive |
| **Loyal** | 4-5, 4-5, 4-5 | 10-15% | Cross-sell + community + upgrade |
| **Potential loyalist** | 5,3,3 / 4-5, 3, 4-5 | 10-15% | Frequency drive + bundle + sub |
| **New** | 5, 1, 1 | 5-15% | Onboarding sequence + 2nd purchase push |
| **Promising** | 4, 1, 1 | 5-10% | Educational nurture + free trial |
| **Need attention** | 3, 3, 3 | 5-10% | Personalized offer + survey "anything we can do?" |
| **About to sleep** | 3, 1, 1-2 | 5-10% | Re-engage + value content + light incentive |
| **At risk** | 2, 2-3, 3-5 | 10-15% | Retention discount + personal touch |
| **Cannot lose** | 1, 4-5, 4-5 | 1-3% | URGENT — personal call + custom offer |
| **Hibernating** | 2, 1-2, 1-2 | 10-20% | Low-touch nurture |
| **Lost** | 1, 1, 1 | 10-25% | Final win-back × 3 then sunset |

---

## AARRR Lifecycle Map

```
[Acquisition]
  ↓ Visit → Trial / First purchase
[Activation]
  ↓ Aha moment / Habit formed
[Retention]
  ↓ Repeat purchase / Active usage
[Revenue]
  ↓ Upgrade / Cross-sell / Subscription
[Referral]
  → New acquisition (loop)
```

### Stage Metrics

| Stage | Primary KPI | Healthy | Concerning |
|-------|------------|---------|------------|
| Acquisition | CAC | < LTV/3 | > LTV/3 |
| Activation | First-action rate | >40% | <25% |
| Retention | 90-day retention | >35% | <20% |
| Revenue | LTV / Repeat % | LTV/CAC>3 | <2 |
| Referral | NPS / Referral % | NPS>50 | <30 |

---

## Churn Prediction Model

### Signal Weights

| Signal | Weight | Trigger |
|--------|--------|---------|
| ไม่ซื้อ > 2x avg cycle | 30 | Critical |
| ไม่เปิด email > 60d | 15 | Watch |
| Browse > 5x no purchase | 10 | Watch |
| AOV ลด > 30% | 15 | Concern |
| CS complaint logged | 20 | Concern |
| Refund/return | 10 | Concern |
| Subscription pause | 25 | Critical |
| Login frequency ลด > 50% | 20 | Concern |

### Score Bucket

| Score | Status | Action |
|-------|--------|--------|
| 0-30 | Healthy | Standard nurture |
| 31-60 | Watch | Increase touchpoint frequency |
| 61-85 | At-risk | Trigger save campaign |
| 86-100 | Critical | Personal outreach + offer |

---

## Win-Back Campaign (90-Day)

### Email Sequence (5 email)

| # | Day | Subject pattern | Offer |
|---|-----|----------------|-------|
| 1 | D-60 (lapsed) | "ไม่ได้คุยกันนานเลย" | Soft check-in + value |
| 2 | D-75 | "นี่คือสิ่งที่คุณพลาด" | New arrival + content |
| 3 | D-85 | "ของขวัญสำหรับคนที่กลับมา — 20%" | Discount code |
| 4 | D-90 | "48 ชม. สุดท้าย" | FOMO + bonus |
| 5 | D+0 (sunset) | "ยังอยากรับ email ไหม?" | Survey + remove |

### Multi-channel
- Email (main)
- LINE OA personal message
- SMS (only critical 86+)
- Retargeting ads (FB/Google)

---

## Loyalty Program Design

### 3-Tier Standard

| Tier | Spend req/yr | % customer | Benefit |
|------|-------------|-----------|---------|
| Silver | 0-5,000 | 70% | 1% cashback / point |
| Gold | 5,000-25,000 | 25% | 3% + birthday + early access |
| Platinum | 25,000+ | 5% | 5% + free ship + concierge |

### Economics Check
```
Loyalty cost = Avg reward % × revenue from loyalty members
Loyalty lift = (Repeat % loyalty - Repeat % non) × AOV × Frequency

Net = Loyalty lift × Members - Loyalty cost
ต้อง > 0 (after operating cost)
```

### Reward Types
- **Cashback** (simple, easy)
- **Point** (gamification, tier feeling)
- **Tier perks** (status > monetary)
- **Experiential** (dinner, event — premium feel)
- **Charitable** (donate in name — millennial/Gen Z love)

---

## LTV Calculation

### Simple LTV
```
LTV = AOV × Purchase frequency/yr × Gross margin × Avg lifespan (yr)

Example:
AOV: 1,500 / Frequency: 4 / Margin: 60% / Lifespan: 3 yr
LTV = 1,500 × 4 × 0.60 × 3 = 10,800 บาท
```

### Predictive LTV (cohort-based)
```
1. แบ่ง customer ตาม month of acquisition
2. Track retention 1/3/6/12 month
3. Curve fit (often exponential decay)
4. Predict cumulative spend
```

### LTV/CAC Ratio Bench
| Ratio | Status |
|-------|--------|
| <1 | Losing money — stop scaling |
| 1-3 | Marginal — improve before scale |
| 3-5 | Healthy — scale aggressive |
| >5 | Under-investing — could grow faster |

### Payback Period
```
Payback = CAC / (Monthly recurring revenue × Margin)

Healthy: <12 months
Subscription: <6 months ideal
```

---

## Customer Journey Map Template

```
Stage     | Web         | Email       | LINE       | App        | In-store
─────────────────────────────────────────────────────────────────────────
Awareness | Landing     | -           | Welcome    | -          | Pop-up
Consider  | Product     | Newsletter  | Q&A        | Browse     | Demo
Purchase  | Checkout    | Confirm     | Receipt    | Order      | Greeting
Onboard   | Tutorial    | Welcome 5   | Tip        | Setup      | Class
Retain    | Personal    | Bi-weekly   | Promo      | Push       | Loyalty
Revenue   | Cross-sell  | Bundle      | Flash      | Premium    | VIP
Refer     | Friend link | Referral kit| Share      | Invite     | WoM
```

---

## Common Mistakes

1. ส่งทั้ง list ทุกครั้ง — segment ไม่ใช้
2. Loyalty reward ใหญ่กว่า margin — ขาดทุนทุกออเดอร์
3. ไม่มี cohort tracking — bias on recent
4. รอ churn จริงค่อย save — late
5. ตั้ง tier req สูงเกิน — 90% ไม่เคยถึง
6. Champions ได้ discount เหมือน new — เสีย margin
7. ไม่มี sunset rule — list pollute reputation
