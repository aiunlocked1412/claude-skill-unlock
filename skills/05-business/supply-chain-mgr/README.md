# Supply Chain Manager

> AI ผู้ช่วยจัดการ supply chain — inventory, demand forecast, supplier, 3PL

## ⚡ ใช้ยังไง

```
/supply-chain-mgr
```

## 🎯 ทำอะไรได้บ้าง

- ✅ ABC Analysis (Pareto จัดกลุ่ม SKU)
- ✅ EOQ Calculator
- ✅ Safety Stock + Reorder Point
- ✅ Demand Forecast (SMA, Exponential, Seasonal)
- ✅ Supplier Scorecard (QCDFS)
- ✅ 3PL Selection (Kerry, Flash, J&T, EMS)
- ✅ JIT vs Buffer strategy
- ✅ S&OP planning cycle
- ✅ Bullwhip effect mitigation
- ✅ Warehouse layout

## 💡 Use cases

- ร้านค้าปลีกที่ stock มากเกิน → cash ค้าง
- E-commerce ที่ stock-out บ่อย
- โรงงานเลือก supplier
- ร้านที่ขายของ seasonal — วาง forecast
- Online seller จะใช้ 3PL ค่ายไหน
- Owner ที่อยากตั้ง S&OP cycle

## 📦 ไฟล์ใน skill นี้

```
supply-chain-mgr/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md
│   └── output-template.md
└── examples/
    └── example-output.md       # ร้านเสื้อผ้าออนไลน์ 500 SKU
```

## 🔗 Skills ที่ใช้คู่กัน

- `/procurement-pro` — RFQ + supplier negotiation
- `/ecommerce-mgr` — fulfillment + return mgmt
- `/accountant-pro` — inventory accounting
- `/business-consultant` — strategic supply chain
