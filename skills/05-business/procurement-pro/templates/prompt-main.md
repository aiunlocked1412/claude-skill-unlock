# Prompt Formula — Procurement Pro

## Template คำถาม context

```
Category: <Direct/Indirect>
ประเภท: <วัตถุดิบ / IT / office / service / construction>
มูลค่า: <บาท>
ความถี่: <one-time / recurring monthly/yearly>
Stakeholder: <ใครใช้, ใครอนุมัติ>
Spec: <clear / draft / unclear>
Timeline: <กี่วัน RFP → award>
จำนวน supplier ในตลาด: <> 3 / 1-3 / sole>
ปัญหาเดิม: <vendor lock-in / price creep / quality issue>
```

## RFP Recipe

```
สร้าง RFP สำหรับ <category>:
1. Executive Summary (1 หน้า)
2. Background + Objective
3. SOW + Deliverables + Spec
4. Functional + Non-functional requirements
5. Evaluation criteria + weights
6. Commercial terms (pricing, payment, warranty, SLA)
7. Submission instructions
8. Timeline
9. Appendices (pricing template, NDA, standard terms)
```

## RFQ (สั้นกว่า) Recipe

```
RFQ template:
- Item description + spec
- Quantity (with tier discount tier)
- Delivery date + location
- Payment terms required
- Warranty
- INCOTERMS (ถ้านำเข้า)
- Bid validity (60-90 วัน)
- Submission format (sealed envelope / e-bid)
```

## Vendor Scorecard Recipe

```
QCDFS+R weights:
- Quality 25% (spec compliance, defect rate, cert)
- Cost 25% (TCO not just unit price)
- Delivery 15% (LT, on-time %)
- Financial 15% (DBD financial statement, credit rating)
- Service 10% (response, support)
- Risk 10% (geographic, ESG, compliance, single source)

Score 1-5 each KPI → weighted total
- > 4.0: Strategic
- 3-4: Approved
- 2-3: Watch
- < 2: Phase out
```

## TCO Recipe

```
TCO over <N> years:
Acquisition:
- Unit price × qty
- Freight (FOB/CIF/DDP)
- Import duty + VAT
- Installation + commissioning

Operating (per year × N):
- Maintenance contract
- Spare parts
- Energy/utility
- Training
- Downtime cost (lost revenue)

Disposal:
- Decommissioning
- Recycling
- Residual value (negative)

Compare 2-3 options → choose lowest TCO
```

## Negotiation Recipe

```
ก่อนเจรจา:
- BATNA ของเรา: ...
- BATNA ของ vendor (estimate): ...
- ZOPA: range ที่ทั้งคู่ยอมรับได้
- Walk-away point ของเรา: ...

8 levers ที่ใช้ได้:
1. Price tier (volume discount)
2. Payment terms (net 30 → net 60)
3. Volume commit (1y vs 3y)
4. Lead time
5. Warranty extension
6. SLA penalty
7. Exclusivity
8. Termination clause

Win-Win:
- ไม่ใช่กดราคาอย่างเดียว
- หา value pool ที่ทั้งคู่ได้
```

## Tips

- TCO > unit price เสมอ
- ≥ 3 vendor เพื่อ benchmark (ยกเว้น sole source ต้อง document)
- Technical evaluation ก่อน open commercial (ป้องกัน bias)
- Audit trail ทุก decision
- Conflict of interest disclose
