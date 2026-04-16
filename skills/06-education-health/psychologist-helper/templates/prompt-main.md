# Prompt Patterns สำหรับ Psychologist Helper

**⚠️ Reminder: ทุก prompt ใช้กับ นักจิตวิทยา / จิตแพทย์ / นักจิตบำบัดที่มีใบประกอบวิชาชีพ เท่านั้น**

## 1. Pattern: Session Note (SOAP)

```
สร้าง session note สำหรับ:
- Client code (de-identified): <CL-XXX>
- Session #: <X>
- Diagnosis (working): <ICD-10 code + DSM-5-TR>
- Modality: individual / couple / family / group
- Session goals: <...>
- Interventions used: <...>

Template SOAP:
S — Subjective (client's words, mood scale, sleep, stressor)
O — Objective (MSE: appearance, behavior, speech, mood/affect, thought, insight)
A — Assessment (dx, progress, risk)
P — Plan (intervention, homework, next session, referrals)

ต้อง:
- ใช้ professional language
- Person-first (person with depression ≠ depressive)
- Include risk assessment (SI/HI/abuse)
- Document informed consent for notable changes
- De-identify — ไม่ใช้ชื่อจริง/รายละเอียดที่ระบุตัวได้
```

## 2. Pattern: CBT Thought Record

```
สร้าง thought record worksheet สำหรับ <disorder>:

Columns:
1. Situation (factual, objective)
2. Automatic thought
3. Emotion (label + intensity 0-100)
4. Evidence for the thought
5. Evidence against
6. Balanced alternative thought
7. Re-rate emotion (0-100)

ต้องมี:
- คำอธิบาย 2-3 บรรทัดว่าใช้ยังไง
- Example filled-in (1 row)
- Blank rows 5-7 rows สำหรับ client
- ด้านล่าง: list of 10 cognitive distortions (reference)
- Thai + English (สำหรับ bilingual client)

⚠️ Worksheet เป็น template — therapist ต้อง tailor ก่อนให้ client
```

## 3. Pattern: Case Conceptualization (Beck)

```
สร้าง case conceptualization สำหรับ:
- Presenting problem: <...>
- Demographics: <age, sex, occupation, culture>
- Relevant history: <trauma, loss, family>

Beck model:
1. Core beliefs (I am / Others are / World is)
2. Intermediate beliefs (rules, assumptions, attitudes)
3. Compensatory strategies
4. Situation → Automatic Thought → Emotion → Behavior → Reinforcement

Include:
- Hypothesized origins (developmental)
- Current triggers
- Maintaining factors
- Protective factors
- Treatment implications

ต้อง disclaimer: "Working hypothesis — refine with client data"
```

## 4. Pattern: DSM-5-TR Criteria Reference

```
แสดง DSM-5-TR criteria สำหรับ <diagnosis>:

Output:
1. ICD-10-CM code
2. DSM-5-TR name
3. Criteria A-E (numbered verbatim structure — paraphrase, don't quote)
4. Specifiers (e.g., with/without psychotic features)
5. Severity criteria (mild/moderate/severe)
6. Duration requirement
7. Exclusion criteria
8. Differential diagnosis (top 3-5)
9. Common comorbidity
10. Prevalence (lifetime + 12-mo)
11. Culture/gender/age considerations
12. Course + prognosis

⚠️ ระบุ edition year (DSM-5-TR = 2022)
⚠️ Reminder: diagnosis requires full clinical interview, not checklist
```

## 5. Pattern: DBT Skills Handout

```
สร้าง DBT skills handout เรื่อง <skill module>:

Module options:
1. Mindfulness (observe/describe/participate, non-judgmentally, one-mindfully, effectively)
2. Distress Tolerance (TIPP, ACCEPTS, IMPROVE, self-soothe, radical acceptance)
3. Emotion Regulation (PLEASE, opposite action, check the facts)
4. Interpersonal Effectiveness (DEAR MAN, GIVE, FAST)

Format per skill:
- Skill name + acronym meaning
- When to use
- How-to (step-by-step)
- Example scenario (realistic)
- Practice exercise (homework)
- Common pitfall

ลงท้ายด้วย:
- Quick reference card (printable)
- Self-monitoring form
```

## 6. Pattern: ACT Worksheet

```
สร้าง ACT worksheet เรื่อง <topic>:

Topics:
1. Defusion techniques (10 exercises)
2. Values clarification (10 life domains)
3. Committed action (SMART + values)
4. Self-as-context (observer self)
5. Present moment (mindfulness for ACT)
6. Acceptance of unwanted internal experience

Structure:
- Brief rationale (2-3 lines)
- Exercise instructions (5-7 steps)
- Space for client to write
- Reflection questions (3-5)
- Home practice

⚠️ Emphasize: workability > truth (ACT-specific)
```

## 7. Pattern: Suicide Risk Assessment Template

```
⚠️ CRITICAL PROTOCOL ⚠️

สร้าง SI assessment template ตามมาตรฐาน Columbia Protocol (C-SSRS) หรือ SAD PERSONS:

Domains:
1. Ideation
   - Wish to die
   - Non-specific active
   - With method (no plan)
   - With some plan
   - With plan + intent

2. Behavior
   - Preparatory behavior
   - Aborted attempt
   - Interrupted attempt
   - Actual attempt

3. Risk factors
   - Previous attempt
   - Mental disorder
   - Substance use
   - Social isolation
   - Recent loss

4. Protective factors
   - Family support
   - Religious beliefs
   - Children at home
   - Future orientation

Risk stratification: low / moderate / high / imminent

Action algorithm:
- Low → safety plan + follow-up
- Moderate → safety plan + frequent contact + refer psychiatrist
- High → higher level of care (ER, inpatient)
- Imminent → immediate hospitalization

⚠️ Always include: 1323, 02-113-6789 (Samaritans)
```
