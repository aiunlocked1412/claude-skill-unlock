# Car Advisor

> AI ที่ปรึกษารถยนต์ไทย — ซื้อรถใหม่/มือสอง, maintenance, trade-in, insurance, EV vs ICE

## ⚡ ใช้ยังไง

```
/car-advisor
```

## 🎯 ทำอะไรได้บ้าง

- ✅ ซื้อรถใหม่ เปรียบเทียบรุ่น + TCO 5 ปี + tips ต่อรองดีลเลอร์
- ✅ ซื้อรถมือสอง checklist ตรวจสภาพ + ราคายุติธรรม + warning signs
- ✅ Maintenance Schedule ตารางเช็กระยะตาม km + Thai climate tips
- ✅ Trade-in Analysis ประเมินราคา + เวลาที่ดีที่สุดในการเปลี่ยนคัน
- ✅ Insurance Guide เปรียบเทียบชั้น 1-3 + คำแนะนำตามสภาพการใช้งาน
- ✅ EV vs ICE Decision TCO analysis ตามสภาพจริงในไทย

## 💡 Use cases

- ไม่รู้จะเลือกรถรุ่นไหน งบเท่านี้ซื้อได้อะไร
- อยากซื้อรถมือสองแต่กลัวโดนโกง
- ไม่แน่ใจว่า EV คุ้มไหมสำหรับคนอยู่คอนโด
- รถถึงเวลาเช็กระยะ ต้องทำอะไรบ้าง
- อยากได้ราคา trade-in ที่ดีที่สุด

## 📦 ไฟล์ใน skill นี้

```
car-advisor/
├── SKILL.md     # ไฟล์หลัก (Claude อ่าน)
└── README.md    # คุณกำลังอ่านอยู่
```

## 🎓 Tips

- บอก **budget + จำนวนคนในครอบครัว + usage pattern** → ได้ top 3 รุ่นที่เหมาะจริง
- บอก **ทะเบียนรถ + km** → ได้ maintenance checklist ที่ตรงกับรถคุณ
- ใช้คู่กับ `/financial-analysis` → วางแผนการเงินก่อนผ่อนรถ

## ⚠️ ข้อควรทราบ

ราคารถและ spec เปลี่ยนแปลงตลอด — ข้อมูลใน skill นี้ใช้เป็น framework ตัดสินใจ ต้องตรวจสอบราคาปัจจุบันกับ dealer และให้ช่างอิสระตรวจรถมือสองก่อนซื้อเสมอ

## 🔗 Skills ที่ใช้คู่กัน

- `/home-manager` — วางแผน household budget รวมค่ารถ
- `/financial-analysis` — วางแผนการเงิน การผ่อนรถที่เหมาะสม
