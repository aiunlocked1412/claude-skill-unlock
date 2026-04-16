# Prompt Patterns สำหรับ Pharmacist Helper

## 1. Pattern: Drug Lookup (Standard Monograph)

```
Drug query: <generic name or trade or Thai name>

Output sections:
1. Names (Generic / Trade TH / Trade US/EU / ATC)
2. Class + Mechanism
3. Indications (FDA + off-label common)
4. Dosing (adult / pediatric / renal / hepatic / geriatric)
5. Contraindications (absolute / relative)
6. Black Box Warnings
7. Common ADRs (≥ 1%)
8. Serious ADRs
9. PK profile (F, Vd, t½, CYP, excretion)
10. Major drug interactions
11. Food / lifestyle
12. Pregnancy / lactation
13. Thai context (NLEM, ราคา, อย.)
14. References
```

## 2. Pattern: Interaction Matrix

```
INPUT: list ของยา 2-10 ตัว

OUTPUT:
- Matrix table (✓ / ! / ✗ / ✗✗)
- Each interaction:
  * Mechanism (PK or PD)
  * Effect
  * Onset (rapid / delayed)
  * Severity (major / moderate / minor)
  * Management (avoid / adjust / monitor / spacing)
  * Reference

- Recommendations summary
- Verify with Lexicomp/Micromedex reminder
```

## 3. Pattern: Pediatric Dose

```
INPUT:
- Drug
- Indication
- Age, weight, height (BSA if needed)
- Renal function

OUTPUT:
- Standard dose: mg/kg/day ÷ frequency
- Calculated for this patient: mg/dose × frequency
- Max daily dose
- Duration
- Formulation conversion (mg → ml of suspension)
- Bottle size needed for course
- Special considerations (neonate, premature)

Reference: Nelson's, BNF for Children
```

## 4. Pattern: Renal Adjustment

```
INPUT:
- Drug
- Patient: SCr, age, sex, weight, race
- Calculate CrCl (Cockcroft-Gault) and eGFR (CKD-EPI)

OUTPUT:
- Standard dose
- Adjustment by CrCl ranges (>50, 30-50, 10-29, <10/HD)
- TDM if available
- Monitoring parameters
- Reference: Lexicomp Renal, KDIGO
```

## 5. Pattern: Counseling Script (5-7 Key Points)

```
Drug + indication

Script structure:
1. ชื่อยา + วัตถุประสงค์
2. วิธีกิน + เวลา (ก่อน/หลัง อาหาร)
3. ระยะเวลาคอร์ส
4. ผลข้างเคียงที่พบบ่อย + how to manage
5. ผลข้างเคียงรุนแรง — หยุดยา + ไป รพ.
6. การเก็บรักษา
7. ข้อห้าม + ระวัง

ทุกข้อใช้ภาษาง่าย — ผู้ป่วยเข้าใจได้

Teach-back questions:
- "ลองทวน..."
- "ถ้ามีอาการ X จะทำยังไง?"

Hotline: ...
```

## 6. Pattern: ADR + Naranjo

```
Drug + suspected ADR

Output:
- Common (≥ 1%) / Uncommon (0.1-1%) / Rare-serious
- Naranjo causality assessment (10 questions, score):
  - Definite (≥ 9)
  - Probable (5-8)
  - Possible (1-4)
  - Doubtful (≤ 0)
- Management
- Report HPVC (if applicable)
```

## 7. Pattern: Herbal-Drug Interaction (Thai)

```
Herb (Thai): <ชื่อไทย>
Western drug: <generic>

Output:
- Active compound ของสมุนไพร
- Mechanism interaction (CYP induction/inhibition, pharmacodynamic)
- Effect: increase / decrease drug level or effect
- Onset
- Severity
- Recommendation (avoid / space / monitor)
- Evidence quality (RCT / case report / theoretical)
- Source: NCCIH, มหิดล, ตำรายาไทย
```

## 8. Pattern: TDM (Therapeutic Drug Monitoring)

```
Drug + indication

Output:
- Target concentration (peak / trough / AUC)
- Sampling time
- Population PK parameters
- Dose adjustment formula
- Toxic threshold
- Clinical correlation
- Reference: AAC, Sanford Guide
```
