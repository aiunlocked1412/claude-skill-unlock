# Prompt Main — Mobile App Builder

## Decision Matrix

### Cross-platform vs Native (ก่อน setup project)

| Question | Cross-platform | Native |
|----------|---------------|--------|
| ทีมเคยใช้ React/JS? | ✅ React Native | ❌ |
| UI ต้องเนี้ยบ + animation 60fps? | Flutter | Native |
| ใช้ hardware (BLE, AR, widget)? | ❌ | ✅ |
| Budget ต่ำ + 1 codebase? | ✅ | ❌ |
| Need iOS app + macOS app sync? | ❌ | ✅ Swift |

### State Management

| App size | Recommended |
|----------|-------------|
| < 10 screen | React Context + useReducer |
| 10-50 screen | Zustand (RN) / Riverpod (Flutter) |
| > 50 screen + team | Redux Toolkit + RTK Query / Bloc |

## Pre-deploy Pitfall Checklist

### iOS — สาเหตุ reject บ่อย
- [ ] Privacy manifest (iOS 17+) — ต้องประกาศ data category
- [ ] App Tracking Transparency (ATT) ก่อนใช้ IDFA
- [ ] In-App Purchase ใช้ StoreKit (ไม่ใช่ external link)
- [ ] Sign in with Apple ถ้ามี social login อื่น
- [ ] Permission descriptions (NSCameraUsageDescription) ครบ
- [ ] Crash test 30 นาที ไม่ crash

### Android — ก่อน publish
- [ ] Target SDK ≥ 34
- [ ] Data safety form ตรงกับ behavior จริง
- [ ] Foreground service type (Android 14)
- [ ] Background restrictions tested (Doze mode)
- [ ] Different screen sizes (foldable, tablet)
- [ ] Keystore backup safely

## Common Bug Patterns

| Bug | Cause | Fix |
|-----|-------|-----|
| Memory leak ตอน navigate | listener ไม่ unsubscribe | useEffect cleanup |
| Slow list scroll | ScrollView with > 50 items | FlatList + getItemLayout |
| Keyboard ทับ input | iOS only | KeyboardAvoidingView |
| White screen on launch | splash ไม่ wait JS bundle | expo-splash-screen lock |
| Crash บน Android < 10 | API ใหม่ไม่มี polyfill | targetSdk + minSdk check |

## Deploy Tone

- เริ่มที่ "ทำงานก่อน" แล้วค่อย optimize
- ทุก feature ใหม่ → test บนเครื่องจริงทั้ง iOS + Android
- TestFlight + Play internal test อย่างน้อย 3-5 user ก่อน production
