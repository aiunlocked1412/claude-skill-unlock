# Interior Designer

> ออกแบบภายใน — layout, furniture, lighting, material palette + render prompt

## ⚡ ใช้ยังไง

```
/interior-designer
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Functional zoning + layout (ASCII plan)
- ✅ Furniture spec (size, material, brand example, price tier)
- ✅ Material palette 5-7 ตัว พร้อม HEX
- ✅ Lighting plan 3 layers (ambient/task/accent)
- ✅ Color palette 60-30-10
- ✅ 3D render prompt 3 variants (Midjourney)
- ✅ Cost estimate breakdown

## 💡 Use cases

- Bedroom (master / kids / guest)
- Living room
- Kitchen + Dining
- Bathroom
- Home office / Study
- Commercial (cafe / retail / office)
- ครบบ้าน (whole house package)

## 📦 ไฟล์ใน skill นี้

```
interior-designer/
├── SKILL.md                  # ไฟล์หลัก
├── README.md                 # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md        # Render prompt + style ref
│   └── output-template.md    # โครงสร้าง spec
└── examples/
    └── example-output.md     # Japandi master bedroom 16 ตร.ม.
```

## 🎓 Tips

- ระบุ **size + budget + lifestyle** ตั้งแต่ต้น → spec แม่น
- ส่งรูป existing room ได้ (ใช้ Claude vision)
- ใช้ `/architect-pro` คู่ถ้าต้องเปลี่ยน shell/wall
- ใช้ `/3d-modeler` ต่อยอด custom furniture

## 🔗 Skills ที่ใช้คู่กัน

- `/architect-pro` — shell + structure
- `/3d-modeler` — custom furniture 3D
- `/graphic-designer-pro` — brand for commercial space
- `/photographer-pro` — final shoot
