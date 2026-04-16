# Prompt Patterns สำหรับ Doctor Helper

**⚠️ Reminder: ทุก prompt ต้องใช้กับ บุคลากรการแพทย์ที่มีใบประกอบวิชาชีพ เท่านั้น**

## 1. Pattern: Research Summary

```
สรุป paper/guideline:
- Title: <...>
- Source: <journal, year>
- PMID / DOI: <...>

Template PubMed-style:
1. Study type + level of evidence
2. PICO
3. Methods + N + population
4. Results (primary, secondary, subgroup)
5. Strengths + Limitations
6. Clinical implication (reference only)
7. Conflicts of interest

หลัก:
- ใช้ medical terminology แม่นยำ
- ระบุ effect size + CI + p-value
- ชี้ limitation ชัดเจน
- ห้าม overstate finding
- End with: "Verify with primary source"
```

## 2. Pattern: Differential Diagnosis

```
สร้าง DDx list สำหรับ:
- Presenting complaint: <...>
- Patient age/sex: <...>
- Key features: <...>
- Red flags present: <...>

จัดเป็น 3 groups:
1. Common (≥10% prevalence in that presentation)
2. Less common (1-10%)
3. Rare but can't miss (<1%, ถ้าพลาด = อันตราย)

แต่ละ diagnosis:
- Supporting features
- Key distinguishing history
- Key PE finding
- First-line investigation
- Clinical decision rule (ถ้ามี)

⚠️ Include: "REFERENCE ONLY — treating clinician makes final decision"
```

## 3. Pattern: Drug Interaction Check

```
ตรวจ interaction ของ drug list:
- Drug A: <name, dose, indication>
- Drug B: <name, dose, indication>
- Drug C (ถ้ามี): <...>

Pairwise analysis:
A + B:
- Mechanism (PK/PD)
- Severity (Major/Moderate/Minor)
- Clinical effect
- Evidence level
- Management

⚠️ Always flag:
- CYP450 interactions (inducer/inhibitor)
- QTc prolongation risk
- Bleeding risk (anticoagulant)
- Serotonin syndrome risk

Sources reference:
- Lexicomp
- Stockley's
- Micromedex
- UpToDate Interactions

End with: "Verify with Lexicomp/clinical pharmacist before prescribing"
```

## 4. Pattern: Clinical Pearl

```
สร้าง clinical pearl เรื่อง <topic>:

Structure (1 หน้า max):
1. The Pearl (1-2 sentences, memorable)
2. Why it matters (clinical scenario)
3. Evidence (1-2 key studies or guideline)
4. Remember (mnemonic or rule of thumb)
5. Caveat / exception

หลัก:
- ตัดน้ำออก — ทุกคำต้องมีความหมาย
- ใช้ mnemonic ถ้าได้
- Visual representation ถ้าช่วย (ASCII diagram)
- Target: attending/senior resident teaching intern
```

## 5. Pattern: Guideline Summary

```
สรุป <society> guideline <year> สำหรับ <condition>:

Output:
1. Issuing body + year + version
2. Key recommendations (graded by class of evidence)
   - Class I (Strong): ...
   - Class IIa (Moderate): ...
   - Class IIb (Weak): ...
   - Class III (Against): ...
3. Changes from previous version (NEW / CHANGED / REMOVED)
4. Practical pearls (how to apply day-to-day)
5. Controversies / limitations

⚠️ Include year of guideline + when next update expected
```

## 6. Pattern: Teaching Material

```
สร้างสื่อสอนสำหรับ <level> (medical student / intern / resident)
เรื่อง <topic>

Format:
1. Learning objectives (3 ข้อ)
2. Case presentation (realistic)
3. Teaching point 1: ... (with pathophysiology)
4. Teaching point 2: ... (with clinical application)
5. Teaching point 3: ... (with pitfall)
6. Quick quiz (3 ข้อ + เฉลย)
7. Further reading (2-3 sources)
8. Common exam question style (USMLE / Thai medical board)

ต้อง:
- เหมาะกับ level ของคนเรียน
- Balance ทฤษฎี + practical
- มี case จริง (de-identified)
```
