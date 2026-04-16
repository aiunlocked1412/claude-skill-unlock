---
type: crm-strategy
business: <ชื่อ>
customer_count: <num>
aov: <บาท>
purchase_frequency: <ต่อปี>
created: YYYY-MM-DD
status: draft
---

# 👥 CRM Strategy: <ชื่อธุรกิจ>

## 📊 Brief Summary

| Field | Value |
|-------|-------|
| Business model | <DTC/sub/B2B> |
| Total customer | <num> |
| Active 30d | <num> |
| AOV | <บาท> |
| Purchase frequency | <ครั้ง/ปี> |
| Margin % | <%> |
| Current LTV | <บาท> |
| Current CAC | <บาท> |
| LTV/CAC ratio | <x> |
| Goal | <...> |

---

## 🎯 RFM Segmentation

### Score Distribution

| Segment | RFM | Count | % of base | Avg LTV |
|---------|-----|-------|-----------|---------|
| Champions | 5,5,5 | <#> | <%> | <THB> |
| Loyal | 4-5,4-5,4-5 | <#> | <%> | <THB> |
| Potential loyalist | 5,3,3 | <#> | <%> | <THB> |
| New | 5,1,1 | <#> | <%> | <THB> |
| Promising | 4,1,1 | <#> | <%> | <THB> |
| Need attention | 3,3,3 | <#> | <%> | <THB> |
| About to sleep | 3,1,1-2 | <#> | <%> | <THB> |
| At risk | 2,2-3,3-5 | <#> | <%> | <THB> |
| Cannot lose | 1,4-5,4-5 | <#> | <%> | <THB> |
| Hibernating | 2,1-2,1-2 | <#> | <%> | <THB> |
| Lost | 1,1,1 | <#> | <%> | <THB> |
| **Total** | | **<#>** | **100%** | |

### Strategy per Segment

| Segment | Channel | Frequency | Offer | Goal |
|---------|---------|-----------|-------|------|
| Champions | Personal LINE + email | 2/wk | Early access + VIP perk + invite to refer | Increase referral |
| Loyal | Email + LINE | 1/wk | Cross-sell premium + community | Upgrade tier |
| Potential | Email | 2/wk | Bundle + frequency reward | Increase F |
| New | Welcome series 5 email | Day 0-14 | Onboarding + 2nd purchase | Activation |
| Promising | Nurture | 1/wk | Educational + free trial | Convert |
| Need attention | Email + survey | 1/wk | Personalized offer | Re-engage |
| About to sleep | Light email | 1/2wk | Value content + soft offer | Wake up |
| At risk | Email + retarget | 2/wk | Discount 15% + check-in | Save |
| **Cannot lose** | **Personal call + custom** | **Immediate** | **Custom offer + apology if needed** | **URGENT save** |
| Hibernating | Low-touch | 1/mo | Re-spark | Wake up |
| Lost | Final 3 email | 14d | Last call | Sunset clean |

---

## 🔄 AARRR Lifecycle Map

| Stage | Current KPI | Target KPI | Gap action |
|-------|------------|-----------|-----------|
| Acquisition | CAC <THB> | <THB> | <action> |
| Activation | First purchase % | <%> | <action> |
| Retention 30d | <%> | <%> | <action> |
| Retention 90d | <%> | <%> | <action> |
| LTV | <THB> | <THB> | <action> |
| LTV/CAC | <x> | 3+ | <action> |
| NPS | <num> | 50+ | <action> |
| Referral % | <%> | 15% | <action> |

---

## 📉 Churn Prediction Model

### Signals + Score

| Signal | Weight | Threshold |
|--------|--------|-----------|
| ไม่ซื้อ > 2x avg cycle | 30 | <#days> |
| ไม่เปิด email > 60d | 15 | 60d |
| Browse > 5x no purchase | 10 | 5 visit |
| AOV ลด > 30% | 15 | -30% |
| CS complaint | 20 | Per ticket |
| Refund | 10 | Per refund |
| Sub pause | 25 | Per pause |
| Login frequency ลด > 50% | 20 | -50% |

### Score Bucket Action

| Score | Status | Channel | Trigger |
|-------|--------|---------|---------|
| 0-30 | Healthy | Standard | None |
| 31-60 | Watch | +Email frequency | Personalized content |
| 61-85 | At-risk | Multi-channel save | 3-email + retarget |
| 86-100 | Critical | Personal call + custom | Within 24h |

---

## 💔 Win-Back Campaign (90-Day)

### Email Sequence

| # | Day | Subject | Body | Offer |
|---|-----|---------|------|-------|
| 1 | D+60 (lapsed) | "ไม่ได้คุยกันนานเลย" | Soft check-in + value | - |
| 2 | D+75 | "<Best content / new arrival>" | Inspiration | - |
| 3 | D+85 | "ของขวัญสำหรับคนที่กลับมา — 20%" | Personal note | Code 20% |
| 4 | D+88 | "48 ชม. สุดท้าย" | FOMO | + bonus |
| 5 | D+90 | "ยังอยากรับ email ไหม?" | Sunset survey | Y/N |

### Multi-channel
- Email (main)
- LINE OA personal message (Day 80, 88)
- SMS (only score 86+)
- Retargeting FB/Google (D+60 to D+90)

### Expected Recovery
- Reactivation rate: 8-15% of lapsed
- Net revenue / win-back cost ratio target: >5x

---

## 🏆 Loyalty Program Design

### Tier Structure

| Tier | Spend req/yr | Est % | Benefit | Cost % |
|------|-------------|-------|---------|--------|
| Silver | 0-5,000 | 70% | 1% cashback | 1% |
| Gold | 5,001-25,000 | 25% | 3% + birthday gift + early access | 3.5% |
| Platinum | 25,000+ | 5% | 5% + free ship + concierge | 6% |

### Economics
```
Loyalty cost (yearly): <THB>
Loyalty lift (incremental):
  - Repeat % +X% × Customers in loyalty × AOV × Frequency
  = <THB>

Net benefit: Lift - Cost = <THB>
ROI: <%>
```

### Reward Types Selected
- Primary: <Cashback / Point>
- Secondary: <Tier perks>
- Premium: <Experiential>

### Earning Rules
- 1 บาท spend = 1 point
- Birthday: 2x point
- Refer-a-friend: 500 point each
- Review submitted: 100 point

### Redemption
- 100 point = 10 บาท discount
- 500 point = free shipping
- 2,000 point = exclusive product

---

## 📊 LTV / CAC Analysis

### Current State
```
AOV: <บาท>
Purchase frequency/yr: <#>
Gross margin: <%>
Avg lifespan: <yr>
─────────────
LTV = AOV × Freq × Margin × Lifespan = <THB>

CAC: <THB>
LTV/CAC: <ratio>
Payback period: <months>
```

### Cohort Analysis (last 12 month)

| Cohort | M1 | M3 | M6 | M12 | LTV trajectory |
|--------|----|----|----|-----|----------------|
| Jan | 100 | 65 | 45 | 30 | <THB> |
| Feb | 100 | 68 | 48 | - | <THB> |
| ... | ... | ... | ... | ... | ... |

### Improvement Targets
- LTV: <current> → <target> (+%)
- CAC: <current> → <target> (-%)
- LTV/CAC: <current> → <target>
- Payback: <current> → <target>

---

## 📋 Customer Journey Orchestration

| Stage | Web | Email | LINE | SMS | App | In-store |
|-------|-----|-------|------|-----|-----|----------|
| Awareness | <touch> | - | <touch> | - | - | <touch> |
| Consider | <touch> | <touch> | <touch> | - | <touch> | <touch> |
| Purchase | <touch> | <touch> | <touch> | <touch> | <touch> | <touch> |
| Onboard | <touch> | <touch> | <touch> | - | <touch> | <touch> |
| Retain | <touch> | <touch> | <touch> | <touch> | <touch> | <touch> |
| Revenue | <touch> | <touch> | <touch> | <touch> | <touch> | <touch> |
| Refer | <touch> | <touch> | <touch> | - | <touch> | <touch> |

---

## 🛠️ Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| CDP | <...> | Single customer view |
| Email | <Klaviyo / Mailchimp> | Email automation |
| LINE OA | <...> | Broadcast + 1:1 |
| SMS | <...> | Critical alert |
| Loyalty | <...> | Point + tier |
| Analytics | <GA4 / Mixpanel> | Funnel + cohort |
| Survey | <Typeform / SurveyMonkey> | NPS + feedback |

---

## 🚀 90-Day Implementation Roadmap

### Month 1: Foundation
- [ ] Audit current data quality + dedup
- [ ] Build RFM scoring model
- [ ] Segment all customer
- [ ] Setup tracking + cohort analysis
- [ ] Launch Champions VIP program

### Month 2: Activation
- [ ] Welcome series automation (new)
- [ ] Win-back campaign (lapsed)
- [ ] Churn score live alerting
- [ ] Loyalty program launch (soft beta)

### Month 3: Optimize
- [ ] A/B test save campaign
- [ ] Cross-sell automation
- [ ] Loyalty full launch
- [ ] Quarterly cohort review

---

## 📊 KPI Dashboard

| Metric | Current | M1 | M3 | M6 |
|--------|---------|-----|-----|-----|
| Repeat purchase rate | <%> | <%> | <%> | <%> |
| 90-day retention | <%> | <%> | <%> | <%> |
| LTV | <THB> | <THB> | <THB> | <THB> |
| LTV/CAC | <x> | <x> | <x> | <x> |
| Churn rate | <%> | <%> | <%> | <%> |
| NPS | <#> | <#> | <#> | <#> |
| % Champions | <%> | <%> | <%> | <%> |
| % Lost | <%> | <%> | <%> | <%> |

---

## 📋 Launch Checklist

- [ ] Data quality audit complete
- [ ] RFM scoring model live
- [ ] All customers segmented
- [ ] Welcome series active
- [ ] Win-back automation active
- [ ] Churn score alerting (Slack/email)
- [ ] Loyalty program tested + launched
- [ ] Personal save playbook for Champions
- [ ] Cohort dashboard live
- [ ] Quarterly review meeting scheduled

---

*Generated by /crm-strategist — Claude Skill Unlock v1.1*
