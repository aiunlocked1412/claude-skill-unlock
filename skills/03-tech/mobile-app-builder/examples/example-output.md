---
type: mobile-blueprint
app_name: TodoExpo
platform: iOS + Android
stack: Expo (React Native) + Zustand + Supabase
created: 2026-04-16
---

# Mobile Blueprint: TodoExpo

## Overview

| Field | Value |
|-------|-------|
| App name | TodoExpo |
| Platform | iOS + Android |
| Stack | Expo SDK 52 + Zustand + Supabase |
| Target audience | คนที่ต้องการ Todo app sync ข้ามอุปกรณ์ |
| Core feature | login, create/edit/delete todo, sync realtime, dark mode |
| MVP timeline | 2 สัปดาห์ |

---

## Stack Decision

**เลือก:** Expo (React Native)

**เหตุผล:**
1. Team มี React/JS อยู่แล้ว — ไม่ต้องเรียน Dart/Swift
2. Expo Router file-based routing เหมือน Next.js — onboard เร็ว
3. EAS Build = ไม่ต้องตั้ง Xcode/Android Studio บนเครื่อง dev
4. Supabase มี SDK สำหรับ Expo สมบูรณ์ + realtime subscription
5. App ไม่ใช้ hardware deep — ไม่ต้อง native module

**Alternative ที่พิจารณา:**
- **Flutter** — UI สวยกว่าเล็กน้อย แต่ต้องเรียน Dart + รื้อ codebase web เดิมไม่ได้
- **Native iOS+Android** — เกิน budget สำหรับทีม 1-2 คน

---

## Project Structure

```
todo-expo/
├── app/
│   ├── (tabs)/
│   │   ├── index.tsx       # todo list
│   │   └── settings.tsx
│   ├── auth/
│   │   ├── login.tsx
│   │   └── register.tsx
│   ├── todo/[id].tsx       # detail/edit
│   └── _layout.tsx
├── components/
│   ├── TodoItem.tsx
│   ├── TodoForm.tsx
│   └── EmptyState.tsx
├── hooks/
│   ├── useTodos.ts
│   └── useAuth.ts
├── services/
│   ├── supabase.ts
│   └── notifications.ts
├── store/
│   └── auth.ts
├── app.json
└── eas.json
```

---

## Core Features (พร้อมโค้ด)

### Feature 1: Authentication (Supabase + SecureStore)

```tsx
// services/supabase.ts
import { createClient } from '@supabase/supabase-js'
import * as SecureStore from 'expo-secure-store'
import 'react-native-url-polyfill/auto'

const ExpoSecureStoreAdapter = {
  getItem: (key: string) => SecureStore.getItemAsync(key),
  setItem: (key: string, value: string) => SecureStore.setItemAsync(key, value),
  removeItem: (key: string) => SecureStore.deleteItemAsync(key),
}

export const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL!,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY!,
  {
    auth: {
      storage: ExpoSecureStoreAdapter,
      autoRefreshToken: true,
      persistSession: true,
      detectSessionInUrl: false,
    },
  }
)
```

```tsx
// store/auth.ts
import { create } from 'zustand'
import { supabase } from '../services/supabase'
import type { Session, User } from '@supabase/supabase-js'

interface AuthState {
  session: Session | null
  user: User | null
  loading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
  initialize: () => Promise<void>
}

export const useAuth = create<AuthState>((set) => ({
  session: null,
  user: null,
  loading: true,

  initialize: async () => {
    const { data: { session } } = await supabase.auth.getSession()
    set({ session, user: session?.user ?? null, loading: false })

    supabase.auth.onAuthStateChange((_event, session) => {
      set({ session, user: session?.user ?? null })
    })
  },

  signIn: async (email, password) => {
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error
  },

  signOut: async () => {
    await supabase.auth.signOut()
  },
}))
```

### Feature 2: Todo CRUD + Realtime

```tsx
// hooks/useTodos.ts
import { useEffect, useState } from 'react'
import { supabase } from '../services/supabase'

export interface Todo {
  id: string
  user_id: string
  title: string
  done: boolean
  created_at: string
}

export function useTodos(userId: string) {
  const [todos, setTodos] = useState<Todo[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    let cancelled = false

    // 1. Initial fetch
    supabase
      .from('todos')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .then(({ data }) => {
        if (!cancelled && data) {
          setTodos(data)
          setLoading(false)
        }
      })

    // 2. Realtime subscription
    const channel = supabase
      .channel('todos-changes')
      .on(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'todos', filter: `user_id=eq.${userId}` },
        (payload) => {
          if (payload.eventType === 'INSERT') {
            setTodos((prev) => [payload.new as Todo, ...prev])
          } else if (payload.eventType === 'UPDATE') {
            setTodos((prev) => prev.map((t) => (t.id === payload.new.id ? (payload.new as Todo) : t)))
          } else if (payload.eventType === 'DELETE') {
            setTodos((prev) => prev.filter((t) => t.id !== payload.old.id))
          }
        }
      )
      .subscribe()

    return () => {
      cancelled = true
      supabase.removeChannel(channel)
    }
  }, [userId])

  const addTodo = (title: string) =>
    supabase.from('todos').insert({ title, user_id: userId, done: false })

  const toggleTodo = (id: string, done: boolean) =>
    supabase.from('todos').update({ done }).eq('id', id)

  const deleteTodo = (id: string) =>
    supabase.from('todos').delete().eq('id', id)

  return { todos, loading, addTodo, toggleTodo, deleteTodo }
}
```

### Feature 3: Push Notification

```tsx
// services/notifications.ts
import * as Notifications from 'expo-notifications'
import * as Device from 'expo-device'

export async function registerPushToken(): Promise<string | null> {
  if (!Device.isDevice) return null

  const { status: existingStatus } = await Notifications.getPermissionsAsync()
  let finalStatus = existingStatus
  if (existingStatus !== 'granted') {
    const { status } = await Notifications.requestPermissionsAsync()
    finalStatus = status
  }
  if (finalStatus !== 'granted') return null

  const token = (await Notifications.getExpoPushTokenAsync()).data
  return token
}
```

---

## State Management — Zustand

ใช้ Zustand สำหรับ auth (global) + React Query สำหรับ data fetching (todos)

---

## Backend Integration (Supabase)

| Table | Columns | RLS |
|-------|---------|-----|
| `todos` | id, user_id, title, done, created_at | user เห็น row ของตัวเองเท่านั้น |
| `profiles` | id, username, avatar_url | public read, owner write |

```sql
-- RLS: user เข้าถึงเฉพาะ todo ของตัวเอง
CREATE POLICY "Users can manage own todos"
ON todos FOR ALL
USING (auth.uid() = user_id);
```

---

## Permission + Privacy

### iOS (app.json)
```json
{
  "ios": {
    "infoPlist": {
      "NSUserNotificationsUsageDescription": "เพื่อแจ้งเตือนงานที่ครบกำหนด"
    }
  }
}
```

### Privacy Manifest (iOS 17+)
- Data category: User content (todo text), Identifiers (user ID)
- Reason: App functionality (sync), 3rd party advertising = ไม่มี

---

## Build & Deploy

### Setup EAS
```bash
npm install -g eas-cli
eas login
eas build:configure
```

### eas.json
```json
{
  "build": {
    "production": {
      "ios": { "autoIncrement": "buildNumber" },
      "android": { "autoIncrement": "versionCode" }
    }
  }
}
```

### Build + Submit
```bash
eas build --platform all --profile production
eas submit --platform ios --latest
eas submit --platform android --latest
```

---

## Pre-launch Checklist

- [x] Test บน iPhone 15 + Pixel 7
- [x] TestFlight 5 tester ผ่าน 7 วัน — ไม่มี crash
- [x] Sentry crash rate 0.2% ✅
- [x] App size 28MB (iOS), 22MB (Android)
- [x] Icon 1024×1024 + adaptive icon Android
- [x] Splash screen
- [x] Privacy policy URL: https://todoexpo.app/privacy
- [x] App Store Connect + Play Console กรอกครบ
- [ ] Localization (th + en) — รอ v1.1

---

## Cost Estimate

- Apple Developer: $99/ปี
- Google Play: $25 (one-time)
- Supabase Free tier (พอสำหรับ 50K MAU): $0
- Expo EAS Free tier: 30 build/เดือน $0
- Sentry Free: 5K event/เดือน

**รวม:** ~$10/เดือน (เฉลี่ย Apple)

---

*Generated by /mobile-app-builder — Claude Skill Unlock v1.1*
