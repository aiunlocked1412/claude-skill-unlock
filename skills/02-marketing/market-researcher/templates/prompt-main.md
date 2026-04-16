# Market Researcher — Methods & Frameworks

## Recipe: Full Research Project

```
/market-researcher full
Decision: <สิ่งที่จะตัดสินใจหลัง research>
Research question: <5W1H>
Target audience: <ใคร / กี่คน / where to find>
Budget: <บาท>
Timeline: <weeks>
Existing data: <มี data อะไรอยู่แล้ว>
```

---

## Method Selection Matrix

| Question type | Best method | n | Time |
|--------------|------------|----|------|
| "ทำไม เขาทำแบบนี้?" | In-depth interview | 8-15 | 2-3 wk |
| "เขาคิดยังไงกับ X?" | Focus group | 6-10 × 3 | 2 wk |
| "กี่ % เป็น Y?" | Survey | 200-500 | 2-4 wk |
| "Of A vs B prefer ไหน?" | A/B test / conjoint | 100/var | 1-2 wk |
| "อะไรคือ pain?" | Mixed (interview + survey) | 12 + 200 | 4-6 wk |
| "Pricing เท่าไหร่?" | Van Westendorp | 200+ | 2 wk |
| "Feature priority?" | MaxDiff / Kano | 200+ | 2-3 wk |
| "Customer satisfaction?" | NPS + open-ended | 500+ | ongoing |

---

## Survey Design Rules

### Length & Drop-off
| Length | Completion rate |
|--------|----------------|
| < 5 min | 70-85% |
| 5-10 min | 50-65% |
| 10-15 min | 30-45% |
| > 15 min | <30% (avoid) |

### Question Type Mix
- Demographic: 3-5 ข้อ (จบ — ไม่ทำต้น)
- Behavioral: 5-8 ข้อ
- Attitudinal: 3-5 ข้อ (Likert)
- Open-ended: 1-2 ข้อ (rich data)
- Total: 15-25 ข้อ ideal

### Question Construction
✅ DO:
- Single concept per question
- Specific time frame ("ใน 7 วันที่ผ่านมา")
- Neutral wording
- "Other (specify)" option

❌ DON'T:
- Leading: "คุณชอบ feature X ใช่ไหม?"
- Double-barrel: "Fast + cheap?" → แยก
- Negative + double negative: "คุณไม่คิดว่าไม่..."
- Jargon: ใช้ภาษาคนทั่วไป

### Likert Scale
| Type | When use |
|------|---------|
| 1-5 | Simple consumer survey |
| 1-7 | Academic / detailed |
| 0-10 | NPS standard |
| 1-5 + N/A | When some don't apply |

**Avoid even (4, 6):** force choice — context อาจไม่เหมาะ

---

## Standard Question Bank

### NPS
> ในระดับ 0-10 คุณจะแนะนำ <X> ให้เพื่อนแค่ไหน?

### CSAT
> คุณพึงพอใจกับ <experience> แค่ไหน? (1-5)

### CES (Customer Effort Score)
> ใช้งาน <service> ง่ายแค่ไหน? (1-7)

### Brand Awareness (Aided)
> รายชื่อ brand ต่อไปนี้ คุณรู้จักแบรนด์ไหนบ้าง? (multi-select)

### Brand Awareness (Unaided)
> เมื่อพูดถึง <category> brand ไหนนึกถึงเป็น 3 อันดับแรก?

### Purchase Intent
> ถ้า <product> มีขายในตลาดวันนี้ — คุณจะซื้อแน่นอน (5) ... ไม่ซื้อแน่นอน (1)

### Price Sensitivity (Van Westendorp 4 Q)
1. ราคาเท่าไรที่ "แพงเกินไป" (จะไม่ซื้อ)
2. ราคาเท่าไรที่ "แพง — แต่จะคิดดู"
3. ราคาเท่าไรที่ "คุ้มมาก"
4. ราคาเท่าไรที่ "ถูกเกินไป" (สงสัยคุณภาพ)

### Importance + Satisfaction
> 1. <Feature X> สำคัญแค่ไหน? (1-5)
> 2. <Feature X> ปัจจุบันทำได้ดีแค่ไหน? (1-5)

---

## Sampling Math

### Sample Size Formula
```
n = (Z² × p × (1-p)) / e²

Z = 1.96 (95% CI)
p = 0.5 (max variance)
e = 0.05 (±5% margin)

n = (3.84 × 0.25) / 0.0025 = 384

Rule of thumb:
- Market research: 384 (95% CI, ±5%)
- Pilot: 30
- Qualitative: 12-15 (until saturation)
```

### Sampling Methods

**Probability:**
- Random: เท่ากันทุกคน (true representative)
- Stratified: แบ่ง group แล้วสุ่ม (เช่น เพศ × อายุ × ภูมิภาค)
- Cluster: สุ่มกลุ่มแล้วทุกคนใน cluster

**Non-probability:**
- Convenience: คนที่หาได้ง่าย (high bias)
- Purposive: เลือกตามเกณฑ์ specific
- Snowball: บอกต่อ (niche audience)

---

## Interview Guide Structure (60 min)

### 0-5 min: Warm-up
- Self intro + study purpose + consent
- "ไม่มีคำตอบผิด — เราอยากรู้ความคิดจริงๆ"
- Permission to record

### 5-15 min: Background
- "Tell me about yourself" (open)
- Daily routine related to topic
- Last week's behavior

### 15-45 min: Core
- 5-7 main themes
- Probe with "tell me more", "why", "ตัวอย่าง"
- Use silence to encourage depth
- Avoid leading

### 45-55 min: Specific scenarios
- "ลองนึกถึงครั้งล่าสุดที่..."
- Show stimuli (concept, ad, prototype)
- Reaction + emotion

### 55-60 min: Wrap
- "อะไรที่ผมไม่ได้ถามแต่ควรถาม?"
- Thank + incentive

---

## Focus Group Facilitation

### Setup
- 6-10 participant (homogeneous group)
- 90 min duration
- Round table — equal voice
- Recording (audio + video)
- Note-taker + facilitator (2 person)

### Phase
1. **Warm-up (10 min):** Intro, ground rules, ice breaker
2. **Exploration (30 min):** Topic open-ended
3. **Focus (30 min):** Specific concept / stimuli
4. **Prioritization (15 min):** Ranking / voting
5. **Wrap (5 min):** Thank + incentive

### Facilitator Skills
- Equal airtime (กระตุ้นคนเงียบ)
- Manage dominator (politely)
- Probe but not lead
- Watch group dynamics + avoid groupthink

---

## Persona Template

```
Name: [สมมติชื่อ + นามสกุล + เล่นกับ alliteration]
Age: [ตัวเลข specific]
Job: [ตำแหน่ง + บริษัทประเภท]
Location: [เขต + เมือง]
Income: [ช่วง]
Family: [single / married + kids]

Quote: "[1 ประโยคที่สะท้อน mindset]"

Daily routine:
- เช้า: ...
- กลางวัน: ...
- เย็น: ...

Tech comfort: [low / mid / high + tools used]

Media consumption:
- Social: [list]
- News: [list]
- Entertainment: [list]

Goals (3):
1. ...
2. ...
3. ...

Pain points (3):
1. ...
2. ...
3. ...

Decision drivers:
- ...
- ...

Objections:
- ...
- ...

Buying journey: [where they discover, research, decide, purchase]
```

---

## JTBD (Jobs-to-be-Done) Framework

### Formula
> "When <situation>, I want to <motivation>, so I can <expected outcome>"

### 3 Layer
- **Functional:** what they do (objective)
- **Emotional:** how they want to feel (subjective)
- **Social:** how they want to be seen (relational)

### Example
- **Situation:** เช้าวันจันทร์ก่อนเข้า meeting
- **Functional job:** ดื่มกาแฟเพื่อตื่น
- **Emotional job:** รู้สึกพร้อมและมั่นใจ
- **Social job:** เห็นเป็นคนทำงานหนักและเอาจริง

### Outcome Statement Template
> "Minimize the <metric> needed to <task>"
> "Maximize the <metric> from <task>"

---

## Customer Journey Map

| Stage | Awareness | Consider | Purchase | Use | Loyalty |
|-------|-----------|----------|---------|-----|---------|
| Action | <what they do> | | | | |
| Touchpoint | <where they interact> | | | | |
| Thought | <what they think> | | | | |
| Emotion | <feeling 😊😐😡> | | | | |
| Pain point | <friction> | | | | |
| Opportunity | <how to improve> | | | | |

---

## Competitive Analysis Template

### 10 Dimension Matrix

| Dimension | Comp A | Comp B | Comp C | Us | Insight |
|-----------|--------|--------|--------|----|---------| 
| Positioning | ... | ... | ... | ... | ... |
| Pricing tier | ... | ... | ... | ... | ... |
| Product/Feature | ... | ... | ... | ... | ... |
| Target audience | ... | ... | ... | ... | ... |
| Distribution | ... | ... | ... | ... | ... |
| Marketing msg | ... | ... | ... | ... | ... |
| Strength | ... | ... | ... | ... | ... |
| Weakness | ... | ... | ... | ... | ... |
| Recent move (6m) | ... | ... | ... | ... | ... |
| Est. market share | ... | ... | ... | ... | ... |

### SWOT (US)
- **S**trength: ...
- **W**eakness: ...
- **O**pportunity: ...
- **T**hreat: ...

---

## Bias to Avoid

| Bias | What it is | How to mitigate |
|------|-----------|-----------------|
| Leading question | "คุณชอบ X ใช่ไหม?" | Open-ended phrasing |
| Social desirability | Answer "what's right" | Anonymize, indirect Q |
| Confirmation | Look for proof of belief | Pre-register hypothesis |
| Sampling | Bias source (FB group only) | Stratified random |
| Hawthorne | Behavior changes when watched | Field observation, less intrusive |
| Survivorship | Only ask survivors | Include lapsed/dropped users |
| Recency | Recent answer overweighted | Time-bound + diverse Q |

---

## Recommendation Framework

ทุก finding → 4 element:

1. **Insight** — what we learned (data + quote)
2. **Implication** — so what (business impact)
3. **Action** — do what (specific + measurable)
4. **Owner + timeline** — who + when

---

## Common Mistakes

1. ไม่มี decision driver — research exists เฉยๆ
2. Leading question — bias ตั้งแต่ design
3. Sample bias (convenience only) — generalize ไม่ได้
4. Skip pilot test — bug ใน real launch
5. Persona ที่ไม่ใช้ — สร้างแล้วไม่มีใครเปิด
6. Quant ไม่มี qual — ไม่เข้าใจ "ทำไม"
7. JTBD จำกัดแค่ functional — พลาด emotional + social
