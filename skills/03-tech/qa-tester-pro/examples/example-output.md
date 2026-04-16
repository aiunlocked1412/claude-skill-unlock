---
type: test-plan
feature: Login (Email/Password + Google OAuth)
platform: web (Chrome, Safari, Firefox) + mobile (iOS Safari, Android Chrome)
created: 2026-04-16
status: draft
---

# Test Plan: Login Feature

## Overview

| Field | Value |
|-------|-------|
| Feature | Login (Email/Password + Google OAuth) |
| Owner (dev) | Nat — Backend, Ploy — Frontend |
| Owner (QA) | Ton (Lead QA) |
| Target release | 2026-05-01 |
| Platform | Web Chrome 120+ / Safari 17+ / Firefox 120+ + iOS 17+ Safari + Android Chrome 120+ |
| Total test cases | 22 |
| Automation target | 70% (15 cases automated) |

## Scope

### In scope
- Email + password login
- Google OAuth login
- Remember me checkbox
- Forgot password link (→ แยก test plan)
- Rate limiting (brute force)
- Session management

### Out of scope
- Signup flow (แยก test plan)
- 2FA (phase 2)
- Social login อื่นๆ (Facebook, Apple)

---

## Test Cases Matrix

| ID | Type | Priority | Title | Automated | Status |
|----|------|----------|-------|-----------|--------|
| TC-001 | Happy | P0 | Login ด้วย email+password ถูก | Yes | - |
| TC-002 | Happy | P0 | Login ด้วย Google OAuth | Yes | - |
| TC-003 | Happy | P1 | Remember me → session 30 วัน | Yes | - |
| TC-004 | Happy | P1 | Logout แล้ว login ใหม่ | Yes | - |
| TC-005 | Happy | P2 | Login บน mobile (touch) | No | - |
| TC-011 | Sad | P1 | Password ผิด | Yes | - |
| TC-012 | Sad | P1 | Email ไม่มีในระบบ | Yes | - |
| TC-013 | Sad | P2 | Email format ผิด | Yes | - |
| TC-014 | Sad | P2 | Field ว่างทั้ง 2 | Yes | - |
| TC-015 | Sad | P1 | Network disconnect | No | - |
| TC-016 | Sad | P1 | OAuth user cancel | No | - |
| TC-021 | Edge | P2 | Email 255 chars | No | - |
| TC-022 | Edge | P1 | Double-click submit | Yes | - |
| TC-023 | Edge | P2 | Thai chars ใน email | Yes | - |
| TC-024 | Edge | P2 | Copy-paste password (with trailing space) | No | - |
| TC-025 | Edge | P1 | Login ขณะ session ที่มีอยู่ยัง active | Yes | - |
| TC-041 | Security | P0 | Brute force: 10 attempts → rate limit | Yes | - |
| TC-042 | Security | P0 | SQL injection ใน email | Yes | - |
| TC-043 | Security | P0 | XSS ใน email | Yes | - |
| TC-044 | Security | P0 | Password ไม่โชว์ใน network log | Yes | - |
| TC-051 | Perf | P1 | Login API < 500ms (p95) | Yes | - |
| TC-052 | A11y | P1 | Keyboard-only login flow | No | - |

---

## Happy Path

### TC-001 | Happy | P0
**Title:** Login ด้วย email + password ที่ถูกต้อง
**Precondition:**
- User account มีอยู่: `test@example.com` / `Test1234!`
- User ยัง verified email แล้ว

**Steps:**
1. เปิด Chrome, ไป `https://app.example.com/login`
2. กรอก email field: `test@example.com`
3. กรอก password field: `Test1234!`
4. คลิกปุ่ม "Login"

**Expected:**
- Response < 2 seconds
- Redirect ไป `/dashboard`
- Session cookie `auth_token` ถูก set (HttpOnly, Secure, SameSite=Lax, 1 hour)
- Header ด้านขวาแสดง "Hi, test"
- ไม่มี error ใน browser console

**Test data:** `test@example.com` / `Test1234!`
**Automation:** Playwright `login.spec.ts`

---

### TC-002 | Happy | P0
**Title:** Login ด้วย Google OAuth
**Precondition:** มี Google account link กับ app

**Steps:**
1. เข้า `/login`
2. คลิก "Continue with Google"
3. Popup Google — เลือก account
4. Grant permissions

**Expected:**
- Popup ปิดอัตโนมัติ
- Redirect ไป `/dashboard`
- Session set
- Profile photo จาก Google แสดง

---

### TC-003 | Happy | P1
**Title:** Remember me → session ยาว 30 วัน
**Steps:**
1. Login
2. Tick "Remember me" ก่อน submit
3. ปิด browser
4. เปิดใหม่หลัง 7 วัน

**Expected:**
- ยัง logged in อยู่
- Cookie expiry = 30 days (ไม่ใช่ session)

---

## Sad Path

### TC-011 | Sad | P1
**Title:** Password ผิด
**Steps:**
1. กรอก email ถูก
2. กรอก password ผิด (`WrongPass123`)
3. Submit

**Expected:**
- แสดง error message "Email หรือ password ไม่ถูกต้อง"
- **ไม่** บอกว่า email ผิดหรือ password ผิด (security)
- Form ยังเก็บ email ไว้ (UX — ผู้ใช้ไม่ต้องพิมพ์ใหม่)
- Password field clear
- Focus กลับไป password field

---

### TC-015 | Sad | P1
**Title:** Network disconnect ระหว่าง login
**Steps:**
1. Fill form ถูกต้อง
2. Chrome DevTools → Network → Offline
3. Click Submit

**Expected:**
- แสดง error "ไม่สามารถเชื่อมต่อ กรุณาลองใหม่"
- ปุ่ม submit ไม่ค้าง loading forever
- Retry button โผล่
- ไม่ crash

---

### TC-016 | Sad | P1
**Title:** User cancel Google OAuth popup
**Steps:**
1. คลิก "Continue with Google"
2. ปิด popup ทันที (ไม่เลือก account)

**Expected:**
- กลับมาหน้า login ปกติ
- ไม่มี error message ใหญ่ (ผู้ใช้ตั้งใจ cancel)
- อาจแสดง toast "ยกเลิกการ login"

---

## Edge Cases

### TC-021 | Edge | P2
**Title:** Email ยาวมาก (255 chars)
**Test data:** `a`×244 + `@test.com` (= 255 chars รวม)
**Expected:**
- Form accept (email RFC limit 254 แต่ field ควรรองรับ)
- API response handle (ไม่ 500)

### TC-022 | Edge | P1
**Title:** Double-click submit → ไม่ยิง API 2 ครั้ง
**Steps:**
1. Fill form
2. Click Login เร็วๆ 2 ครั้งติดกัน

**Expected:**
- ยิง API แค่ 1 request (ใน Network tab)
- ปุ่ม disabled ระหว่าง submit
- Loading indicator แสดง

### TC-023 | Edge | P2
**Title:** Email ภาษาไทย (IDN)
**Test data:** `สมชาย@ไทย.ไทย`
**Expected:** ต้อง support IDN (internationalized domain name) หรือปฏิเสธด้วย error ชัด

### TC-024 | Edge | P2
**Title:** Copy-paste password จาก password manager ที่มี trailing space
**Test data:** `Test1234! ` (มี space ท้าย)
**Expected:**
- Trim space อัตโนมัติ (ไม่ทำให้ login fail งมงาย)
- หรือแจ้ง user ว่ามี space ที่ไม่ควรมี

### TC-025 | Edge | P1
**Title:** Login ใน tab ใหม่ขณะ session อยู่แล้ว
**Steps:**
1. Login ใน tab A
2. เปิด tab B → `/login`
3. Login ด้วย account เดิม

**Expected:**
- Tab B ก็ login สำเร็จ
- Tab A session ยังใช้ได้
- ไม่มี duplicate session token (ถ้า design เป็น single session)

---

## Security

### TC-041 | Security | P0
**Title:** Brute force protection
**Steps:** Login ผิด 10 ครั้งติดใน 1 นาที
**Expected:**
- ครั้งที่ 6+ → HTTP 429 "Too many attempts"
- Rate limit 15 นาที
- Log incident → security team alert
- CAPTCHA ปรากฏในครั้งที่ 4

### TC-042 | Security | P0
**Title:** SQL injection ใน email
**Test data:** `admin'--`, `' OR '1'='1`, `admin'; DROP TABLE users;--`
**Expected:**
- Input ถูก parameterize (prepared statement)
- ไม่ execute SQL injection
- Response เหมือน email ปกติที่ไม่มีในระบบ

### TC-043 | Security | P0
**Title:** XSS ใน email
**Test data:** `<script>alert('xss')</script>@test.com`
**Expected:**
- Script ไม่ execute ใน UI
- Input ถูก escape ใน error message ("no such email: `&lt;script&gt;...`")

### TC-044 | Security | P0
**Title:** Password ไม่โชว์ใน network/console/log
**Steps:**
1. Login ด้วย password `Test1234!`
2. เช็ค:
   - Network tab: ต้องเป็น HTTPS (encrypted)
   - Request body encrypted (ไม่ plain text ใน http)
   - Browser console: ต้องไม่มี password log
   - LocalStorage / SessionStorage: ต้องไม่เก็บ password

**Expected:** ไม่พบ plaintext password ที่ไหน

---

## Non-functional

### TC-051 | Performance | P1
**Title:** Login API response p95 < 500ms
**Tool:** k6 load test, 100 virtual users, 5 minutes
**Expected:** p95 < 500ms, p99 < 1s, error rate < 0.1%

### TC-052 | Accessibility | P1
**Title:** Keyboard-only login
**Steps:**
1. Tab → email field (focus visible)
2. Type email
3. Tab → password
4. Type password
5. Tab → "Remember me" (spacebar to toggle)
6. Tab → "Login" button (enter to submit)

**Expected:**
- Tab order = visual order
- Focus ring visible ชัดเจน (2px outline)
- ไม่มี focus trap
- Form submit ด้วย Enter จาก password field ได้

---

## Regression Checklist (ก่อน deploy)

- [ ] TC-001 ถึง TC-044 ทุก P0 ผ่าน
- [ ] Password reset flow ยังทำงาน (bug เดิม #421)
- [ ] Logout ยังทำงาน (bug เดิม #512)
- [ ] Google OAuth callback URL ถูก update ใน production
- [ ] Rate limit key = IP + email (ไม่ใช่แค่ IP — กัน user อื่นล็อค)
- [ ] Session token HttpOnly + Secure + SameSite=Lax
- [ ] HTTPS enforce (HTTP redirect 301)
- [ ] Lighthouse A11y score ≥ 95
- [ ] Sentry receive `login_failed` event
- [ ] Analytics track `login_success` + provider (email/google)

---

## Bug Report (ตัวอย่างจาก TC-022)

```markdown
**Bug ID:** BUG-2026-LOGIN-01
**Title:** Double-click submit ทำให้ API ถูกเรียก 2 ครั้ง — user เห็น "already logged in" error
**Priority:** P1
**Severity:** Major
**Status:** New
**Reporter:** Ton (QA)
**Assignee:** Ploy (Frontend)

**Environment:**
- Browser: Chrome 120.0.6099.71
- OS: macOS 14.1
- URL: https://staging.example.com/login
- Time: 2026-04-16 15:20 UTC+7

**Steps to reproduce (100% reproducible):**
1. เข้าหน้า /login
2. Fill email: test@example.com
3. Fill password: Test1234!
4. Click "Login" button เร็วๆ 2 ครั้งติด

**Expected:** ยิง API POST /auth/login 1 ครั้ง → redirect
**Actual:**
- ยิง API 2 ครั้ง (Network tab confirm)
- Request 1: 200 OK → set session
- Request 2: 409 Conflict "already logged in"
- User เห็น toast error "already logged in" แปลกๆ

**Screenshot:** [attached — double request in network tab]
**Video:** [link]
**Console log:**
```
POST /auth/login 200 OK (request 1)
POST /auth/login 409 (request 2)
Error: already_logged_in
  at handleLoginResponse (Login.tsx:54)
```

**Root cause (hypothesis):** Frontend ไม่ disable submit button ระหว่าง pending request
**Suggested fix:** `<button disabled={isSubmitting}>`
**Workaround:** ไม่มี — user ที่ click เร็วจะเจอทุกคน
**Tags:** #login #frontend #race-condition
```

---

## Test Data Set

| Type | Data | Purpose |
|------|------|---------|
| Valid | `test@example.com` / `Test1234!` | Happy path |
| Admin | `admin@example.com` / `AdminPass1!` | Role-based test |
| New unverified | `new@example.com` / `Pass1234!` | Unverified email flow |
| Locked | `locked@example.com` | Rate limited state |
| Invalid email | `notanemail` | Format validation |
| Thai email | `สมชาย@ไทย.ไทย` | i18n |
| SQL inject | `admin'--` | Security |
| XSS | `<script>alert(1)</script>@t.com` | Security |
| Long email | `a`×244+`@test.com` | Boundary |
| Space-padded pass | `Test1234! ` | Edge |

---

*Generated by /qa-tester-pro — Claude Skill Unlock v1.0*
