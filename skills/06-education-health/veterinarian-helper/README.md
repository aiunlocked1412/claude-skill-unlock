# Veterinarian Helper

> Clinical reference assistant สำหรับสัตวแพทย์ — species-specific dosing, DDx, toxicity, anesthesia

## ⚠️⚠️⚠️ DISCLAIMER สำคัญมาก ⚠️⚠️⚠️

**Skill นี้สำหรับ สัตวแพทย์ / vet tech / vet student ที่มีใบประกอบวิชาชีพเท่านั้น**

- ❌ **ห้ามใช้แทนการตรวจ/รักษาของสัตวแพทย์**
- ❌ **ห้ามใช้แทน clinical judgment**
- ❌ **ห้ามให้คำแนะนำเจ้าของสัตว์โดยตรง**
- ❌ **ห้ามใช้สำหรับ self-treatment ของเจ้าของ**
- ✅ ใช้ได้เพื่อ: species reference, drug dosing, DDx, anesthesia template, teaching

**การใช้ผิดวัตถุประสงค์อาจก่อให้เกิดอันตรายต่อชีวิตสัตว์** (paracetamol → cat = lethal!)

ถ้าคุณเป็นเจ้าของสัตว์ที่กังวล — **หยุดใช้** แล้วพาสัตว์ไปหาสัตวแพทย์ทันที

---

## ⚡ ใช้ยังไง

```
/veterinarian-helper
```

(Skill จะถาม confirm สถานะ + species ก่อนทำงาน)

## 🐾 Species ที่รองรับ

- 🐕 Canine (สุนัข)
- 🐈 Feline (แมว)
- 🐰 Rabbit (กระต่าย)
- 🐦 Avian (นก — psittacine, passerine)
- 🦎 Reptile (กิ้งก่า / งู / เต่า)
- 🐹 Pocket pets (rodent / ferret / hedgehog)
- 🐎 Equine (ม้า)
- 🐄 Bovine / Small ruminant
- 🐷 Porcine
- 🐠 Aquatic / Aquaculture

## 🎯 ทำอะไรได้บ้าง

- ✅ DDx list (species-specific, reference only)
- ✅ Drug dosing — weight + species-based
- ✅ Species-specific toxicity (paracetamol/lily/permethrin/ฯลฯ)
- ✅ Anesthesia protocol templates
- ✅ Reference ranges (CBC, chem, T4)
- ✅ Vaccination protocol (WSAVA + Thailand)
- ✅ Surgery prep / post-op care template
- ✅ Clinical pearl species-specific
- ✅ Teaching material สำหรับ vet student

## 💡 จุดเด่น

- **Species-specific** — รู้ว่าแมวไม่ใช่หมาตัวเล็ก
- **Toxicity warning** — flag ยาที่ lethal ต่อสัตว์เฉพาะ species
- **Exotic-aware** — รวม rabbit, bird, reptile dosing (Carpenter's)
- **Thai context** — กฎ rabies vaccination, สัตวแพทยสภา

## 👥 เหมาะกับใคร

- DVM (สัตวแพทย์ทั่วไป)
- สัตวแพทย์เฉพาะทาง (Internal/Surgery/Derm/ECC/Exotic)
- Vet technician / nurse
- Vet student / intern (supervised)
- Veterinary academic

## ❌ Use cases ที่ไม่เหมาะสม

- เจ้าของสัตว์ที่อยากรักษาเอง
- ตัดสินใจรักษาโดยไม่ verify
- คนทั่วไปที่ไม่ใช่บุคลากรสัตวแพทย์

## 📦 ไฟล์ใน skill นี้

```
veterinarian-helper/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md    # DDx + drug dosing for cat with chronic vomiting
```

## 📊 ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — DDx แมวอาเจียนเรื้อรัง + dosing maropitant + ondansetron ในแมว 4.5 kg

## 🔗 Skills ที่ใช้คู่กัน

- `/researcher-pro` — สำหรับ veterinary literature review
- `/pharmacist-helper` — สำหรับ active ingredient + interaction (human drug ที่ใช้กับสัตว์)
- `/doctor-helper` — สำหรับ zoonotic disease

---

**⚠️ ผู้ใช้ยอมรับความเสี่ยงและรับผิดชอบต่อการใช้งานของตนเอง**

**ทุก output เป็น REFERENCE เท่านั้น — ไม่ใช่ final clinical decision**
