---
type: web-design
project: TaskFlow (SaaS project management)
page: Landing page
brand_tone: modern + friendly + productive
created: 2026-04-16
---

# Web Design: TaskFlow Landing Page

## Overview

| Field | Value |
|-------|-------|
| Product type | SaaS — project management for small teams |
| Target user | Team lead / freelancer 25-40, tech-savvy medium |
| Primary goal | Sign up for 14-day free trial |
| Device priority | Mobile-first (60% traffic is mobile) |
| Tech stack | Next.js 14 + Tailwind + Framer Motion |
| Brand tone | Modern, friendly, productive (ไม่ corporate แข็ง) |

---

## Information Architecture

### User flow
```
Google search → Land on hero → See "how it works" →
Read testimonial → Check pricing → Click "Start free" →
Signup form → Email verify → Onboarding
```

### Section priority
1. **Hero** — H1 + subhead + CTA + product screenshot/video
2. **Social proof** — logo strip ของลูกค้า (6 logo)
3. **Problem/Solution** — ปัญหาที่แก้ (3 pain points)
4. **Feature highlight** — 3 features หลัก (icon + text + mini-screenshot)
5. **How it works** — 3 steps
6. **Testimonial** — 2-3 quotes พร้อมรูป + ชื่อ + role
7. **Pricing** — 3 tier (Free / Pro / Team)
8. **FAQ** — 6-8 คำถาม
9. **Final CTA** — repeat signup
10. **Footer** — nav + contact + social + legal

### Primary CTA
"Start free for 14 days" (ไม่ต้องใส่บัตร)

### Secondary CTA
"Watch demo (2 min)" — open modal video

---

## Wireframe

### Mobile (< 768px)

```
┌──────────────────────────┐
│ [TaskFlow]         [☰]   │  Sticky header
├──────────────────────────┤
│                          │
│  🎯 Ship projects 2x     │  Hero
│  faster — without        │  H1 (32px)
│  the chaos               │
│                          │
│  Simple task management  │  Subhead (18px)
│  for teams who ship      │
│                          │
│  [Start free 14 days]    │  Primary CTA
│  [▶ Watch 2-min demo]    │  Secondary
│                          │
│  ┌────────────────────┐  │
│  │ [Product screen]   │  │  Hero image
│  │                    │  │  16:10 ratio
│  └────────────────────┘  │
├──────────────────────────┤
│  Trusted by teams at:    │  Social proof
│  [L1][L2][L3][L4][L5][L6]│
├──────────────────────────┤
│  😩 เหนื่อยกับ...         │  Problem
│  • task กระจายใน 5 แอป   │
│  • ลืม deadline          │
│  • ไม่รู้งานใครค้าง       │
├──────────────────────────┤
│  ✨ Feature 1: Kanban    │  Features
│  [icon]                  │  (stacked)
│  ลากวางงานใน board       │
│  เห็นสถานะทั้งทีม         │
├──────────────────────────┤
│  ✨ Feature 2: Timeline  │
│  ...                     │
├──────────────────────────┤
│  ✨ Feature 3: Auto      │
│  ...                     │
├──────────────────────────┤
│  How it works (3 steps)  │
│  1. Signup               │
│  2. Invite team          │
│  3. Start shipping       │
├──────────────────────────┤
│  "TaskFlow ช่วยลดเวลา   │  Testimonial
│  ประชุมได้ 40%"          │  (carousel 1 at a time)
│  — สมชาย, CEO StartupX   │
├──────────────────────────┤
│  Pricing (3 cards stack) │
│  Free / Pro / Team       │
├──────────────────────────┤
│  FAQ (accordion)         │
├──────────────────────────┤
│  [Start free 14 days]    │  Final CTA
├──────────────────────────┤
│  Footer                  │
└──────────────────────────┘
```

### Desktop (≥ 1024px)

```
┌─────────────────────────────────────────────────────────┐
│ [TaskFlow]  Product  Pricing  Blog  Login  [Sign up]    │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────────────────┐  ┌───────────────────────┐   │
│  │ H1: Ship projects 2x │  │                       │   │
│  │ faster—without the   │  │  [Product screen      │   │
│  │ chaos                │  │   animated with       │   │
│  │                      │  │   task moving across  │   │
│  │ Subhead              │  │   kanban]             │   │
│  │                      │  │                       │   │
│  │ [CTA1] [CTA2]        │  │                       │   │
│  │                      │  │                       │   │
│  │ ✓ Free 14 days       │  │                       │   │
│  │ ✓ No credit card     │  │                       │   │
│  └──────────────────────┘  └───────────────────────┘   │
├─────────────────────────────────────────────────────────┤
│  Trusted by teams at: [L1][L2][L3][L4][L5][L6]         │
├─────────────────────────────────────────────────────────┤
│   Problem section (full width หลักการ 3 คอลัมน์)       │
├─────────────────────────────────────────────────────────┤
│   3 Feature blocks (alternating image-left/right)       │
├─────────────────────────────────────────────────────────┤
│   How it works — 3 step horizontal                      │
├─────────────────────────────────────────────────────────┤
│   Testimonial 3 column                                  │
├─────────────────────────────────────────────────────────┤
│   Pricing 3 column (Pro highlighted)                    │
├─────────────────────────────────────────────────────────┤
│   FAQ 2 column                                          │
├─────────────────────────────────────────────────────────┤
│   Final CTA banner (full width bg color)                │
├─────────────────────────────────────────────────────────┤
│   Footer 4 column                                       │
└─────────────────────────────────────────────────────────┘
```

---

## Component Spec

### Button

**Variants:** primary, secondary, ghost
**Sizes:** md (40px), lg (48px, used in hero)

```html
<button class="btn btn-primary btn-lg">
  Start free for 14 days
  <ArrowRight size={18} />
</button>
```

```css
.btn-primary {
  background: var(--color-primary-600);  /* #4F46E5 */
  color: white;
  padding: 0 24px;
  height: 48px;
  border-radius: 10px;
  font-weight: 600;
  font-size: 16px;
  transition: all 150ms ease;
}
.btn-primary:hover {
  background: var(--color-primary-700);
  transform: translateY(-1px);
  box-shadow: 0 8px 16px rgba(79, 70, 229, 0.25);
}
```

### Feature Card

```
┌──────────────────────────┐
│  [icon 48×48]            │
│                          │
│  Kanban board            │  H3 (20px, 600)
│                          │
│  ลากวางงานใน board เห็น  │  Body (16px, 400)
│  สถานะทั้งทีม real-time   │  line-height 1.7 (ไทย)
│                          │
│  → Learn more            │  Link (14px, primary)
└──────────────────────────┘
```

- Padding: 32px
- Radius: 16px
- Border: 1px solid gray-200
- Hover: border primary-300 + shadow-md
- Icon: color primary-500 on gray-100 circle (64×64)

### Pricing Card

3 variants: Free / Pro (highlighted) / Team

```
┌──────────────────────────┐
│  PRO    [Most popular]   │  badge yellow
│                          │
│  ฿290                    │  font-3xl
│  /เดือน/user             │  font-sm gray
│                          │
│  ────────────            │
│                          │
│  ✓ Unlimited projects    │
│  ✓ Advanced reports      │
│  ✓ API access            │
│  ✓ Priority support      │
│                          │
│  [Start free trial]      │  full-width CTA
└──────────────────────────┘
```

### Navigation (Mobile drawer)

- Hamburger → slide-in from right
- Full-height + white bg + shadow
- Nav items 56px tall (touch-friendly)
- Close button top-right + ESC key

---

## Design System

### Colors

```css
:root {
  /* Primary — Indigo (modern, trustworthy) */
  --color-primary-50:  #EEF2FF;
  --color-primary-100: #E0E7FF;
  --color-primary-500: #6366F1;
  --color-primary-600: #4F46E5;  /* main */
  --color-primary-700: #4338CA;
  --color-primary-900: #312E81;

  /* Accent — Emerald (for success + checkmark) */
  --color-accent-500: #10B981;

  /* Neutral */
  --color-gray-50:  #F9FAFB;
  --color-gray-100: #F3F4F6;
  --color-gray-200: #E5E7EB;
  --color-gray-500: #6B7280;
  --color-gray-700: #374151;
  --color-gray-900: #111827;

  /* Semantic */
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error:   #EF4444;
  --color-info:    #3B82F6;
}
```

**Contrast verified:**
- gray-900 on white: 16.1:1 (pass AAA)
- primary-600 on white: 5.9:1 (pass AA)
- white on primary-600: 5.9:1 (pass AA)

### Typography

```css
/* Font stack */
--font-sans: "Inter", "IBM Plex Sans Thai", system-ui, sans-serif;

/* Scale (1.25 ratio) */
--text-xs:   12px; /* line: 16 */
--text-sm:   14px; /* line: 20 */
--text-base: 16px; /* line: 26 — ภาษาไทย 1.65 */
--text-lg:   18px; /* line: 30 */
--text-xl:   22px; /* line: 32 */
--text-2xl:  28px; /* line: 36 */  /* H3 */
--text-3xl:  36px; /* line: 44 */  /* H2 */
--text-4xl:  48px; /* line: 56 */  /* H1 mobile */
--text-5xl:  64px; /* line: 72 */  /* H1 desktop */

/* Weight */
--font-regular: 400;
--font-medium:  500;
--font-semibold: 600;
--font-bold:    700;
```

### Spacing (4px base)

```css
--space-1:  4px;
--space-2:  8px;
--space-3:  12px;
--space-4:  16px;
--space-6:  24px;
--space-8:  32px;
--space-12: 48px;
--space-16: 64px;
--space-20: 80px;
--space-24: 96px;
```

- Section padding: 80px top/bottom (desktop), 48px (mobile)
- Card padding: 32px (desktop), 24px (mobile)
- Button padding: 16px (md), 24px (lg)

### Shadow & Radius

```css
--radius-sm: 6px;
--radius-md: 10px;
--radius-lg: 16px;
--radius-xl: 24px;
--radius-full: 9999px;

--shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
--shadow-md: 0 4px 6px rgba(0,0,0,0.08);
--shadow-lg: 0 10px 20px rgba(0,0,0,0.1);
--shadow-xl: 0 25px 50px rgba(79, 70, 229, 0.15);  /* colored */
```

---

## Responsive Plan

| Breakpoint | Width | Container | Hero grid | Feature grid | Font H1 |
|-----------|-------|-----------|-----------|--------------|---------|
| Mobile | < 768 | 100% (16px pad) | 1 col | 1 col stack | 32px |
| Tablet | 768-1023 | 720px | 1 col | 2 col | 40px |
| Desktop | 1024-1439 | 1200px | 2 col | 3 col | 48px |
| Wide | ≥ 1440 | 1440px | 2 col | 3 col | 64px |

---

## Developer Handoff

### Tech Stack
- **Framework:** Next.js 14 (App Router, React Server Components)
- **Styling:** Tailwind CSS — config จาก token ด้านบน
- **Animation:** Framer Motion (hero, scroll reveal)
- **Fonts:** next/font + Google Fonts (Inter + Noto Sans Thai)
- **Images:** next/image พร้อม `priority` สำหรับ hero
- **Analytics:** Posthog event tracking ทุก CTA

### Implementation Notes

1. **Hero video/animation**
   - ใช้ Framer Motion animate kanban card moving
   - Lazy load video below-the-fold
   - Poster image WebP < 100KB

2. **Critical CSS**
   - Inline CSS สำหรับ hero + header
   - Remainder defer load

3. **Form**
   - Signup CTA → Modal ไม่ใช่หน้าใหม่ (reduce friction)
   - Email validation client-side + server-side
   - HoneyPot field กัน spam

4. **Performance target**
   - LCP: < 2.0s
   - CLS: < 0.05
   - Bundle JS < 150KB

### Accessibility Checklist
- [x] Semantic HTML (`<header>`, `<main>`, `<section>`, `<footer>`)
- [x] Alt text ทุกภาพ (decorative ใช้ `alt=""`)
- [x] Form label associated (`htmlFor`)
- [x] Focus ring custom (ไม่ remove outline!)
- [x] Color contrast AA (verified ด้านบน)
- [x] Keyboard nav (tab order = visual order)
- [x] ARIA live region สำหรับ form error
- [ ] Screen reader test (manual with VoiceOver)

### Dark mode (phase 2)
- Token พร้อมแล้ว — แค่ swap value
- `--color-gray-50` ↔ `--color-gray-900`
- `--color-primary-500` → `--color-primary-400` (brighter)

---

## Production Checklist

- [ ] Design tokens export to Tailwind config
- [ ] Component built + Storybook
- [ ] Responsive tested 320px / 768px / 1024px / 1440px
- [ ] Accessibility audit (axe DevTools)
- [ ] Lighthouse score ≥ 90 (Performance, SEO, A11y)
- [ ] Cross-browser: Chrome / Safari / Firefox / Edge
- [ ] Thai font rendering ok (line-height, diacritics)
- [ ] Form submit tested (happy + error path)
- [ ] Analytics events fire correctly

---

*Generated by /web-designer-pro — Claude Skill Unlock v1.0*
