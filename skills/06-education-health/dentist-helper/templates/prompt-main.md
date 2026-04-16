# Prompt Patterns สำหรับ Dentist Helper

## 1. Pattern: Dental Code Lookup

```
Query: <ICD-10 / CDT / สปส. + keyword>

Output 3 ระบบ:
1. ICD-10-CM (Diagnosis):
   - Code, name, description
2. CDT (Procedure):
   - Code, descriptor, fee guide range
3. รหัสประกันสังคม (สปส. ไทย):
   - หมวด รหัส บริการ ค่าธรรมเนียม

ระบุ:
- Latest year of codebook
- Verify with official source
```

## 2. Pattern: Treatment Plan (Phased)

```
INPUT:
- Patient profile (de-identified): age, sex, MH significant, allergy
- Chief complaint
- Clinical findings (extra/intra-oral)
- Radiographic findings
- Insurance coverage

OUTPUT phased plan:
- Phase 1: Emergency/Pain control
- Phase 2: Disease control (caries, perio)
- Phase 3: Definitive (crown, implant, ortho)
- Phase 4: Maintenance

Each phase:
- Procedures (with CDT code)
- Sequencing rationale
- Estimated cost
- Risks
- Alternative

Plus:
- Informed consent points
- Recall schedule
- Reference (guideline)
```

## 3. Pattern: Materia Medica

```
Query: <วัสดุ / ยา> ที่ทันตแพทย์ใช้

Output:
- Type / Class
- Indications
- Contraindications
- Setting / preparation
- Dose / amount (if drug)
- Onset / duration
- Side effects
- Drug interactions (if any)
- Pearls / tips
- Reference (manufacturer + guideline)
```

## 4. Pattern: Clinical Pearl

```
Topic: <...>

The Pearl: <1-2 sentences>

Why it matters:
- Common pitfall
- Clinical relevance

Evidence:
- Key study / RCT / guideline

Remember:
- Mnemonic
- Rule of thumb
- Exception

Caveat: ไม่ทดแทน individual judgment
```

## 5. Pattern: Guideline Summary

```
Guideline: <Society + year + topic>

Issuing body: ...
Year: ...
Source: ...

Key recommendations (graded):
- Strong recommendation
- Conditional / weak

Changes from previous version:
- New
- Changed
- Removed

Practical pearls:
- ...
```

## 6. Pattern: Differential Diagnosis (Dental Pain)

```
Presenting: <pain quality + duration + trigger>

Common (must consider):
1. <Diagnosis>
   - Supporting features
   - Diagnostic test (cold, percussion, palpation, EPT)
   - Treatment

Less common:
2. ...

Rare but serious:
3. ...

Approach:
- Pulp vitality testing
- Radiograph (PA, BWX, CBCT?)
- Selective anesthesia (if confused source)

Red flags (refer ER):
- Airway compromise
- Facial cellulitis spreading
- Trismus + drooling

⚠️ REFERENCE ONLY — ทันตแพทย์ที่ตรวจคนไข้เป็น final
```

## 7. Pattern: Charting Template

```
Type: Perio / Endo / Ortho / Pedo / Implant

Periodontal:
- Tooth × 32: PD (6 sites), CAL, BoP, mobility, furcation
- Diagnosis: 2017 World Workshop staging/grading

Endodontic:
- Pulp vitality (cold, EPT)
- Periapical (percussion, palpation, radiograph)
- Diagnosis: pulpal + periapical (AAE 2020)

Orthodontic:
- Skeletal: ANB, SNA, SNB, Wits
- Dental: overjet, overbite, midline
- Soft tissue: profile, lip competence
```
