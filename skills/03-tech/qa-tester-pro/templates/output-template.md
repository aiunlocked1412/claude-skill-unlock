---
type: test-plan
feature: <feature name>
platform: web / mobile / api
created: YYYY-MM-DD
status: draft
---

# Test Plan: <Feature>

## Overview

| Field | Value |
|-------|-------|
| Feature | <name> |
| Owner (dev) | <name> |
| Owner (QA) | <name> |
| Target release | YYYY-MM-DD |
| Platform | Web Chrome/Safari/Firefox + Mobile Safari/Chrome |
| Total test cases | 45 |
| Automation coverage target | 70% |

## Scope

### In scope
- ...
- ...

### Out of scope
- ...

---

## Test Cases Matrix

| ID | Type | Priority | Title | Automated? | Status |
|----|------|----------|-------|-----------|--------|
| TC-001 | Happy | P0 | Login ด้วย email+password ถูกต้อง | Yes | Pass |
| TC-002 | Happy | P1 | Login ด้วย Google OAuth | Yes | Pass |
| TC-011 | Sad | P1 | Login ด้วย password ผิด | Yes | Pass |
| TC-021 | Edge | P2 | Login ด้วย email 255 chars | No | - |
| TC-041 | Sec | P0 | Brute force protection | Yes | Pass |

---

## Happy Path (Detailed)

### TC-001 | Happy | P0
**Title:** Login ด้วย email + password ที่ถูกต้อง
**Precondition:** User account มีอยู่ในระบบ email: `test@example.com`, password: `Test1234!`
**Steps:**
1. เข้า `/login`
2. กรอก email: `test@example.com`
3. กรอก password: `Test1234!`
4. คลิกปุ่ม "Login"

**Expected:**
- Redirect ไป `/dashboard`
- Session cookie ถูก set (`HttpOnly`, `Secure`, `SameSite=Lax`)
- Header ด้านขวาแสดงชื่อ user
- ไม่มี error ใน console

**Test data:** `test@example.com` / `Test1234!`
**Automation:** Playwright
**Status:** _____

---

### TC-002 | Happy | P1
...

---

## Sad Path (Detailed)

### TC-011 | Sad | P1
**Title:** Login ด้วย password ผิด
**Steps:**
1. เข้า `/login`
2. กรอก email ถูก
3. กรอก password ผิด
4. Submit

**Expected:**
- แสดง error "Email หรือ password ไม่ถูกต้อง"
- ไม่ redirect
- ไม่ reveal ว่า email มีอยู่จริงหรือไม่ (security)
- Form ยังเก็บ email ไว้ (UX)

---

## Edge Cases

### TC-021 | Edge | P2
**Title:** Email ยาว 255 chars
...

### TC-022 | Edge | P1
**Title:** กด login ซ้อน double-click
**Expected:** ยิง API 1 ครั้งเท่านั้น (debounce/disable button)

### TC-023 | Edge | P2
**Title:** Session expired กลาง action

---

## Security Test

### TC-041 | Security | P0
**Title:** Brute force protection
**Steps:** ลอง login ผิด 10 ครั้งใน 1 นาที
**Expected:**
- ครั้งที่ 6+ → rate limited 15 นาที
- Log incident สำหรับ security team

### TC-042 | Security | P0
**Title:** SQL injection ใน email field
**Test data:** `admin'--`
**Expected:** Input ถูก sanitize ไม่ execute SQL

### TC-043 | Security | P0
**Title:** XSS ใน email field
**Test data:** `<script>alert(1)</script>@test.com`
**Expected:** Script ไม่ execute

---

## Non-functional

### TC-051 | Performance | P1
**Title:** Login API response time < 500ms (p95)

### TC-052 | Accessibility | P1
**Title:** Keyboard-only login flow
**Expected:** Tab → email → tab → password → tab → submit → enter

### TC-053 | Compatibility | P2
**Title:** Test บน Safari 16 + Chrome 120 + Firefox 120 + Edge 120

---

## Regression Checklist

ก่อน deploy production ต้องเช็ค:

- [ ] All P0 test cases ผ่าน
- [ ] All P1 test cases ผ่าน (>95%)
- [ ] Previous bug ไม่ regression
- [ ] Cross-browser test pass
- [ ] Mobile responsive ok
- [ ] API contract test pass
- [ ] Database migration rollback test
- [ ] Feature flag default = off (for safety)
- [ ] Error tracking (Sentry) receive event
- [ ] Lighthouse score ≥ 90
- [ ] Load test: 100 concurrent users ok
- [ ] Security scan pass (no new vuln)

---

## Bug Report Template

```markdown
**Bug ID:** BUG-2026-0001
**Title:** <1 บรรทัด>
**Priority:** P0 / P1 / P2 / P3
**Severity:** Critical / Major / Minor / Trivial
**Status:** New / In progress / Fixed / Verified / Closed
**Reporter:** <name>
**Assignee:** <dev name>

**Environment:**
- Browser: Chrome 120.0.6099.71
- OS: macOS Sonoma 14.1
- Device: MacBook Pro 14" M2
- Screen: 1512×982
- URL: https://app.example.com/login
- User role: Guest
- Logged-in as: -
- Time: 2026-04-16 14:30 UTC+7

**Steps to reproduce:**
1. เข้า /login
2. กรอก email: test@example.com
3. กรอก password: WrongPass123
4. คลิก Login

**Expected:** Error message "Email หรือ password ไม่ถูกต้อง"
**Actual:** Blank page, console error "Cannot read property 'user' of undefined"

**Screenshot:** [attached]
**Video:** [screen recording link]
**Console log:**
```
TypeError: Cannot read property 'user' of undefined
    at LoginForm.jsx:42:15
```

**Network log:**
```
POST /api/login → 401 {"error": "invalid_credentials"}
(no response handling in UI)
```

**Root cause (hypothesis):** Frontend ไม่ handle 401 response
**Workaround:** Refresh page
**Tags:** #login #frontend #error-handling
```

---

## Test Data

| Type | Value | Use case |
|------|-------|----------|
| Valid user | test@example.com / Test1234! | Happy path |
| Admin user | admin@example.com / Admin1234! | Role test |
| Expired user | expired@example.com | Expired session |
| Locked user | locked@example.com | Rate limit |
| Invalid email | notanemail | Validation |
| SQL injection | `admin'--` | Security |
| XSS payload | `<script>alert(1)</script>` | Security |
| Thai chars | สมชาย@test.co.th | i18n |
| Long email | `a`.repeat(300)+`@test.com` | Boundary |

---

*Generated by /qa-tester-pro — Claude Skill Unlock v1.0*
