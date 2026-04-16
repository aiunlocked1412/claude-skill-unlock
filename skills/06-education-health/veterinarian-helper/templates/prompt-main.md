# Prompt Patterns สำหรับ Veterinarian Helper

## 1. Pattern: DDx List (Species-Specific)

```
Species: <canine/feline/rabbit/avian/reptile/etc.>
Signalment: breed, age, sex, neuter status
Presenting complaint: <chief complaint>
Duration: <acute / chronic>
Significant findings: <PE, lab, history>

Output:
- Common DDx (rank by likelihood)
- Less common
- Rare but emergencies (must rule out)

Each DDx:
- Supporting clinical signs
- Diagnostic plan (CBC, chem, U/A, imaging, biopsy)
- Treatment overview
- Prognosis

Approach:
- History focus questions
- PE focus
- Stepwise diagnostics
- Red flags

⚠️ REFERENCE ONLY
```

## 2. Pattern: Drug Dosing (Weight + Species)

```
Drug: <name>
Indication: <...>
Species: <...>
Patient weight: ... kg

Output:
- Standard dose by species (mg/kg + frequency + route)
- Calculated dose for this patient
- Formulation / volume
- Duration
- Species-specific cautions
- Contraindicated species (if any)
- Monitoring parameters
- Reference: Plumb's / BSAVA / Carpenter (year)
```

## 3. Pattern: Toxicity Reference

```
Substance: <name>
Species: <...>

Output:
- Toxic dose (mg/kg or per kg)
- Mechanism of toxicity
- Clinical signs (timeline)
- Diagnostic confirmation
- Treatment:
  * Decontamination (induce emesis? AC? lavage?)
  * Antidote (if any)
  * Supportive care
- Prognosis
- Owner counseling (prevention)

⚠️ Species-specific differences
```

## 4. Pattern: Anesthesia Protocol

```
Species + procedure + ASA score

Output structure:
- Pre-op assessment
- Pre-medication (sedative + opioid + anticholinergic)
- Induction agent + dose
- Maintenance (gas + flow rate)
- Monitoring (mandatory + recommended)
- Fluids
- Local block (if applicable)
- Reversal agents
- Recovery protocol
- Post-op pain management

Special considerations by species:
- Cat: hypothermia, hypotension
- Rabbit: GI stasis, regurg
- Bird: rapid metabolism, hypothermia
- Reptile: prolonged recovery
```

## 5. Pattern: Reference Range

```
Species: <...>
Test category: CBC / Chemistry / Endocrine / U/A

Output:
- Standard reference range
- Lab variation note
- Breed variation (if applicable — greyhound, sighthound)
- Age variation (puppy/kitten vs adult vs geriatric)
- Pregnancy adjustment

Source: lab manuals
```

## 6. Pattern: Vaccine Protocol

```
Species + age + Thailand context

Core vaccines:
- Schedule (week × week)
- Booster
- Legal requirement (rabies — กรมปศุสัตว์)

Non-core (lifestyle-based):
- Indications
- Risk assessment

Source: WSAVA Vaccine Guidelines + Thai law
```

## 7. Pattern: Clinical Pearl

```
Topic: <species-specific>

Pearl: 1-2 sentences
Why: pitfall + relevance
Evidence: study/guideline
Remember: mnemonic / rule

⚠️ ไม่แทน clinical judgment
```
