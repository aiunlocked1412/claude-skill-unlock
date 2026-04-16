# Financial Planner

> AI ผู้ช่วยวางแผนการเงินส่วนบุคคลสำหรับคนไทย — emergency fund, asset allocation, retirement, FIRE

## ⚡ ใช้ยังไง

```
/financial-planner
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Emergency Fund Calculator (6-12 เดือน)
- ✅ Asset Allocation ตามอายุ + risk tolerance
- ✅ Retirement Plan (4% Rule + เงินที่ต้องมี)
- ✅ Tax Optimization (RMF/SSF/ThaiESG/ประกันบำนาญ)
- ✅ 50/30/20 Budget Rule
- ✅ FIRE Roadmap (Lean/Normal/Fat/Coast/Barista)
- ✅ Debt Payoff (Avalanche vs Snowball)
- ✅ Financial Health Check

## 💡 Use cases

- คนวัยทำงานอยากเริ่มลงทุน
- Freelance ที่รายได้ไม่แน่นอน — ตั้ง emergency fund
- พนักงาน 30+ วางแผนเกษียณ
- คนที่อยากลดภาษี (รายได้ > 1 ลบ./ปี)
- ครอบครัวมีหนี้หลายก้อน — เลือกปิดอันไหนก่อน
- คนที่ฝัน FIRE — คำนวณ savings rate จริง

## 📦 ไฟล์ใน skill นี้

```
financial-planner/
├── SKILL.md                          # ไฟล์หลัก (Claude อ่าน)
├── README.md                         # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md                # prompt formula
│   └── output-template.md            # โครงสร้างไฟล์ output
└── examples/
    └── example-output.md             # ตัวอย่าง: คนวัย 32 รายได้ 80k/เดือน
```

## ⚠️ Disclaimer

ไม่ใช่คำแนะนำลงทุน — ปรึกษา CFP / IC License / ตัวแทนที่มีใบอนุญาตจาก ก.ล.ต. ก่อนตัดสินใจซื้อผลิตภัณฑ์การเงินจริง

## 🎓 Tips

- บอกอายุ + รายได้ + หนี้สิน → แผนแม่นขึ้น
- ใช้คู่กับ `/accountant-pro` → คำนวณภาษีจริง
- ใช้คู่กับ `/insurance-advisor` → วางแผน protection
- ใช้คู่กับ `/stock-trader-pro` → เลือกหุ้น/กองทุน

## 🔗 Skills ที่ใช้คู่กัน

- `/accountant-pro` — บัญชี + ภาษี
- `/insurance-advisor` — ประกัน
- `/stock-trader-pro` — วิเคราะห์หุ้น
- `/real-estate-pro` — ลงทุนอสังหา
