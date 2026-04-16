# Mobile App Builder

> AI Mobile Developer — สร้าง iOS/Android ด้วย React Native, Flutter, Swift, Kotlin

## ใช้ยังไง

```
/mobile-app-builder
```

## ทำอะไรได้บ้าง

- ช่วยเลือก stack (React Native vs Flutter vs Native)
- Setup project (Expo, Flutter, Xcode, Android Studio)
- เขียน feature ครบ — auth, list, camera, push notification, payment
- State management — Zustand, Redux Toolkit, Provider, Riverpod
- Debug crash + performance issue
- Deploy checklist ไป App Store + Play Store

## รองรับ

- **Cross-platform:** React Native (Expo + bare), Flutter
- **Native iOS:** Swift + SwiftUI/UIKit
- **Native Android:** Kotlin + Jetpack Compose
- **Backend:** Firebase, Supabase, REST/GraphQL
- **Deploy:** EAS Build, Fastlane, TestFlight, Play Console

## Use cases

- เริ่ม project ใหม่ ไม่รู้เลือก stack อะไร
- มี web app อยากทำ mobile version
- ต้องส่ง app ขึ้น store ภายในเดือนนี้
- App ถูก reject — ขอ pre-review checklist
- Optimize FPS / startup time

## ไฟล์ใน skill นี้

```
mobile-app-builder/
├── SKILL.md                # ไฟล์หลัก (Claude อ่าน)
├── README.md               # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md      # decision matrix + pitfall
│   └── output-template.md  # blueprint format
└── examples/
    └── example-output.md   # Todo app (Expo + Zustand + Supabase)
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Todo app ครบ stack + deploy

## Tips

- บอก budget + team size — ส่งผลกับ stack ที่แนะนำ
- บอก feature ที่ใช้ hardware (camera, BLE, AR) — บางอย่างต้อง native
- ถ้ามี backend อยู่แล้ว บอก protocol (REST/GraphQL/Firebase)

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — review โค้ด feature ก่อน merge
- `/devops-helper` — CI/CD ไป EAS Build / Fastlane
- `/ai-engineer` — เพิ่ม chatbot/AI feature ใน app
- `/security-engineer` — audit auth flow + secret handling
