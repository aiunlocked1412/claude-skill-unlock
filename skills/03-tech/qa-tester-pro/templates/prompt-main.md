# Prompt Main — QA Tester Pro

## Edge Case Checklist (ใช้ brainstorm ทุกครั้ง)

### Input: String
- [ ] Empty string `""`
- [ ] Whitespace only `"   "`
- [ ] Very long (10,000+ chars)
- [ ] Unicode emoji
- [ ] Thai characters (พ่อแม่, สุข)
- [ ] Right-to-left (عربي)
- [ ] Special chars: `< > & " ' / \ ;`
- [ ] SQL injection: `'; DROP TABLE users;--`
- [ ] XSS: `<script>alert(1)</script>`
- [ ] Newlines / tabs in input
- [ ] Leading/trailing whitespace (should trim?)

### Input: Number
- [ ] 0
- [ ] -1 (negative)
- [ ] 0.1 (decimal)
- [ ] Max int (2^31 - 1 = 2,147,483,647)
- [ ] Max int + 1 (overflow)
- [ ] Infinity, -Infinity
- [ ] NaN
- [ ] String in number field

### Input: Date/Time
- [ ] Past date
- [ ] Far future (2099)
- [ ] Leap year (Feb 29)
- [ ] DST change day
- [ ] Timezone mismatch (user UTC+7, server UTC)
- [ ] Invalid format (13/45/2026)

### Input: File
- [ ] 0-byte file
- [ ] Very large (100MB+)
- [ ] Wrong extension (.exe renamed to .jpg)
- [ ] File with script content
- [ ] Filename with special chars / Thai
- [ ] Same file uploaded twice

### Input: Array / List
- [ ] Empty array `[]`
- [ ] Single element `[x]`
- [ ] 10,000 elements
- [ ] Array with null
- [ ] Array with duplicates
- [ ] Nested deeply

## UI Edge Cases

- [ ] Double-click button (race condition)
- [ ] Click → immediately navigate away (cancel)
- [ ] Back button after form submit
- [ ] Refresh during load
- [ ] Tab switch + come back
- [ ] Offline mode
- [ ] Slow network (3G throttling)
- [ ] Very narrow screen (320px)
- [ ] Very wide screen (2560px)
- [ ] Zoom 200%
- [ ] Landscape + portrait
- [ ] Dark mode vs light mode

## State Edge Cases

- [ ] User logged out during action
- [ ] Session expired mid-action
- [ ] Concurrent edit (2 tabs open)
- [ ] Network disconnected mid-request
- [ ] Server 500 during request
- [ ] Server timeout (no response)
- [ ] Partial response (truncated JSON)
- [ ] Cached old version

## Auth Edge Cases

- [ ] Expired token
- [ ] Revoked token
- [ ] Role changed during session (admin → user)
- [ ] User deleted during session
- [ ] 2FA device lost
- [ ] Password changed in other device
- [ ] Login from new device/location

## Form Edge Cases

- [ ] Submit with empty required fields
- [ ] Submit with 1 field invalid
- [ ] Paste formatted text (with styles)
- [ ] Autofill from browser
- [ ] Keyboard-only submit (Enter key)
- [ ] Tab order correct
- [ ] Validation on blur vs submit
- [ ] Error message accessible (screen reader)

## Non-Functional

### Performance
- [ ] Page load < 3s (3G)
- [ ] Time to Interactive < 5s
- [ ] Large data (10,000 rows) render
- [ ] Memory leak ใน long session
- [ ] CPU usage < 50% steady

### Security
- [ ] CSRF token required
- [ ] Rate limiting (brute force)
- [ ] Password complexity enforced
- [ ] HTTPS only
- [ ] Secure + HttpOnly cookie
- [ ] Content Security Policy header
- [ ] No sensitive data in URL
- [ ] No secret in client-side code

### Accessibility (WCAG AA)
- [ ] Keyboard navigation (tab order)
- [ ] Focus visible
- [ ] ARIA label on icon button
- [ ] Alt text on image
- [ ] Color contrast 4.5:1
- [ ] Screen reader test (VoiceOver/NVDA)
- [ ] No audio/video autoplay

### Compatibility
- [ ] Chrome (last 2 versions)
- [ ] Safari (last 2 versions)
- [ ] Firefox (last 2 versions)
- [ ] Edge (last 2 versions)
- [ ] Mobile Safari (iOS 16+)
- [ ] Chrome Android (last 2 versions)

## Priority Matrix

| User impact | Likelihood | Priority |
|-------------|-----------|----------|
| Blocks all users | High | P0 |
| Blocks some users | High | P1 |
| Annoying but workaround | Medium | P2 |
| Cosmetic | Low | P3 |

## Test Case Quality Checklist

ทุก test case ต้องมี:
- [ ] Unique ID (TC-001)
- [ ] Clear title (ใน 1 บรรทัด)
- [ ] Priority (P0-P3)
- [ ] Precondition (state ก่อน test)
- [ ] Steps (เลข 1, 2, 3 ชัด)
- [ ] Expected result (concrete)
- [ ] Test data (ถ้ามี)
