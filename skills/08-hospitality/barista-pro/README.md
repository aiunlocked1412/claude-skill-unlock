# Barista Pro

> AI บาริสต้า Specialty Coffee — SCA cupping, espresso dial-in, latte art, menu engineering, bean sourcing

## ⚡ ใช้ยังไง

```
/barista-pro
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Espresso Dial-in troubleshoot เปรี้ยว/ขม/channeling พร้อม adjustment guide
- ✅ SCA Cupping Protocol ประเมินและ score เมล็ดกาแฟ 10 attributes
- ✅ Latte Art free pour technique + milk texturing ตั้งแต่มือใหม่
- ✅ Menu Engineering คำนวณ food cost, ตั้งราคา, BCG matrix เมนู
- ✅ Bean Sourcing เปรียบเทียบ origin + roast profile รวมเมล็ดไทย
- ✅ Thai Climate Barista cold brew, iced drinks, รับมืออากาศร้อนชื้น

## 💡 Use cases

- บาริสต้าใหม่อยากรู้ว่าทำไม espresso ถึงเปรี้ยวหรือขมเกิน
- เจ้าของร้านอยากออก signature menu พร้อม food cost ที่ถูกต้อง
- Home barista อยากยกระดับ pour over + espresso ที่บ้าน
- ร้านกาแฟอยากเริ่มใช้เมล็ดไทย single origin
- บาริสต้าอยากเตรียมสอบ SCA certification

## 📦 ไฟล์ใน skill นี้

```
barista-pro/
├── SKILL.md     # ไฟล์หลัก (Claude อ่าน)
└── README.md    # คุณกำลังอยู่
```

## 🎓 Tips

- บอก **เครื่อง + grinder รุ่น** ให้ชัด → ได้ dial-in ที่ตรงกับ equipment
- บอก **อาการที่เจอ** ชัดเจน (เปรี้ยวตอนต้น / ขมท้าย / channeling) → แก้ได้ตรงจุด
- ใช้คู่กับ `/chef-pro` → วางแผน F&B menu ร้านอาหาร+คาเฟ่รวมกัน

## ⚠️ ข้อควรทราบ

Food cost ที่แสดงเป็นแนวทาง ต้องคำนวณตาม overhead จริงของร้าน (ค่าเช่า, แรงงาน, utilities) และปฏิบัติตาม food safety อุณหภูมิจัดเก็บตามมาตรฐาน HACCP

## 🔗 Skills ที่ใช้คู่กัน

- `/chef-pro` — เมนูอาหารที่ pair กับเครื่องดื่ม
- `/baker-pro` — เบเกอรี่เสิร์ฟคู่กาแฟ
- `/bartender-pro` — cocktail menu และ bar setup
