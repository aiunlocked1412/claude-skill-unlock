# Prompt Formula — Auditor Pro

## Template คำถาม context

```
บริษัท: <listed SET / private / SME>
อุตสาหกรรม: <manufacturing / banking / retail / IT>
รายได้/ปี: <บาท>
พนักงาน: <จำนวน>
Audit type: <internal / external / IT / compliance>
Standard: <SOX / SET / ISO / PDPA / TFRS>
Audit universe size: <จำนวน auditable areas>
Resources: <audit days available>
```

## Audit Plan Recipe

```
1. List audit universe (process, unit, system)
2. Risk score แต่ละ (likelihood × impact)
3. Categorize: High / Medium / Low
4. Cycle:
   - High: yearly
   - Medium: 2-year
   - Low: 3-year
5. Allocate audit days proportional to risk
6. Get audit committee approval
```

## Risk Assessment Recipe

```
แต่ละ audit area:
- Inherent risk score (no controls): 1-25
- Existing controls list
- Control effectiveness rating: 1-5
- Residual risk = Inherent - Control effectiveness
- Heat map: plot likelihood vs impact
- Action threshold: residual > 12 → audit ทันที
```

## Sampling Recipe

```
Population size: N
Confidence level: 90% / 95% / 99%
Tolerable error rate: 5% / 10%

Statistical (small pop < 250): table-based
Statistical (large pop): n = (Z² × p × (1-p)) / E²

Test of controls (TOC): 25-60 items
Substantive: based on materiality
```

## Finding Recipe (5C)

```
Condition: [สิ่งที่พบ — fact, จำนวน]
Criteria: [SOP / policy / law / standard]
Cause: [root cause — ทำ 5 Whys]
Consequence: [impact financial + non-financial + risk]
Corrective Action: [SMART recommendation + due date + owner]
+ Severity: High / Medium / Low
+ Management Response: [agreement + commitment]
```

## SOX Recipe

```
Entity-level:
- Tone at top, audit committee, whistleblower

Process-level (significant accounts):
- Revenue: cut-off, completeness, occurrence
- Inventory: existence, valuation
- Payroll: accuracy
- Tax: completeness

ITGC:
- Access (provisioning, termination, review)
- Change (DEV-UAT-PROD)
- Operations (backup, monitoring)
- SDLC
```

## ISO 27001 Recipe

```
PDCA:
- Plan: scope, policy, risk assessment, SoA
- Do: implement controls
- Check: monitoring, internal audit, mgmt review
- Act: corrective action, continual improvement

Annex A (93 controls in 2022 version):
- A.5 Organizational: 37
- A.6 People: 8
- A.7 Physical: 14
- A.8 Technological: 34
```

## PDPA Recipe

```
Gap analysis:
- DPO appointed?
- ROPA maintained?
- Lawful basis identified?
- Privacy notice published?
- Consent mechanism?
- Data subject rights process?
- Breach notification (72hr)?
- DPA with processors?
- Cross-border transfer?
- Training program?
```

## Tips

- Risk-based > checklist
- Always 5 Whys for root cause
- Evidence > inquiry alone
- Independent — declare conflict
- Document audit trail (workpapers)
- Tone professional แต่ honest
