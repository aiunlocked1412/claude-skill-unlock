---
type: web-design
project: <ชื่อโปรเจค>
page: <หน้าที่ออกแบบ>
brand_tone: <tone>
created: YYYY-MM-DD
---

# Web Design: <ชื่อหน้า>

## Overview

| Field | Value |
|-------|-------|
| Product type | SaaS / E-commerce / Portfolio |
| Target user | <persona> |
| Primary goal | <signup / purchase / contact> |
| Device priority | Mobile-first / Desktop-first |
| Tech stack | Next.js + Tailwind / Webflow / WordPress |

---

## Information Architecture

### User flow
```
Landing → Read hero → See features → Read testimonial → Click CTA → Signup form → Success
```

### Section priority (mobile top → bottom)
1. Hero (viewport-height)
2. Social proof strip
3. Core features (3 cards)
4. How it works
5. Testimonial
6. Pricing
7. FAQ
8. Final CTA
9. Footer

---

## Wireframe

### Mobile (< 768px)
```
┌─────────────────────┐
│ Logo        [Menu]  │
├─────────────────────┤
│                     │
│   H1 Headline       │
│   Subhead text...   │
│                     │
│   [Primary CTA]     │
│                     │
│   [Hero image]      │
├─────────────────────┤
│   Feature 1         │
│   icon + title      │
│   description       │
├─────────────────────┤
│   Feature 2         │
│   ...               │
├─────────────────────┤
│   Testimonial       │
├─────────────────────┤
│   Final CTA         │
├─────────────────────┤
│   Footer            │
└─────────────────────┘
```

### Desktop (≥ 1024px)
```
┌─────────────────────────────────────────────────┐
│ Logo    [Nav] [Nav] [Nav]            [CTA]      │
├─────────────────────────────────────────────────┤
│  ┌──────────────────┐  ┌────────────────────┐  │
│  │ H1 Headline      │  │                    │  │
│  │ Subhead          │  │   Hero image       │  │
│  │ [CTA] [CTA2]     │  │                    │  │
│  └──────────────────┘  └────────────────────┘  │
├─────────────────────────────────────────────────┤
│  Feature 1  │  Feature 2  │  Feature 3         │
├─────────────────────────────────────────────────┤
│  ...                                            │
└─────────────────────────────────────────────────┘
```

---

## Component Spec

### Button

**Variants:** primary, secondary, ghost
**Sizes:** sm (h: 32), md (h: 40), lg (h: 48)
**States:** default, hover, active, focus, disabled, loading

```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 0 16px;
  border-radius: 8px;
  font-weight: 600;
  transition: all 150ms ease;
}

.btn-primary {
  background: var(--color-primary-600);
  color: white;
}
.btn-primary:hover {
  background: var(--color-primary-700);
  box-shadow: var(--shadow-md);
}
```

### Card

**Variants:** static, clickable
**Sizes:** sm/md/lg
**Parts:** header, body, footer

### Input

**Variants:** text, email, number, textarea
**States:** default, focus, error, disabled, success

---

## Design System

### Colors
```css
:root {
  /* Primary */
  --color-primary-50:  #EFF6FF;
  --color-primary-500: #3B82F6;
  --color-primary-600: #2563EB;
  --color-primary-900: #1E3A8A;

  /* Neutral */
  --color-gray-50:  #F9FAFB;
  --color-gray-500: #6B7280;
  --color-gray-900: #111827;

  /* Semantic */
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error:   #EF4444;
}
```

### Typography
```css
--font-family-body: "Inter", "IBM Plex Sans Thai", sans-serif;
--font-family-display: "Playfair Display", serif;

--font-xs:   12px;
--font-sm:   14px;
--font-base: 16px;
--font-lg:   18px;
--font-xl:   24px;
--font-2xl:  32px;
--font-3xl:  48px;

--leading-tight:  1.25;
--leading-normal: 1.5;
--leading-relaxed: 1.75;  /* ภาษาไทย */
```

### Spacing
```css
--space-1: 4px;
--space-2: 8px;
--space-3: 12px;
--space-4: 16px;
--space-6: 24px;
--space-8: 32px;
--space-12: 48px;
--space-16: 64px;
--space-24: 96px;
```

### Shadow & Radius
```css
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 16px;
--radius-full: 9999px;

--shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
--shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1);
--shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1);
```

---

## Responsive Plan

| Breakpoint | Width | Container | Grid |
|-----------|-------|-----------|------|
| Mobile | < 768px | 100% | 1 col |
| Tablet | 768-1023px | 720px | 2 col |
| Desktop | 1024-1439px | 1200px | 3 col |
| Wide | ≥ 1440px | 1440px | 4 col |

---

## Developer Handoff

### Tech Stack (แนะนำ)
- Framework: Next.js 14 App Router
- Styling: Tailwind CSS (config จาก token ด้านบน)
- Fonts: next/font + Google Fonts
- Images: next/image (automatic optimization)
- Icons: Lucide React

### Implementation Notes
- Hero video ควร lazy-load + poster image
- Font-display: swap เพื่อไม่ block render
- Critical CSS inline (above-the-fold)
- Form validation ทั้ง client + server side

### Accessibility Checklist
- [ ] Semantic HTML (section, nav, main, article)
- [ ] Alt text ทุกภาพ
- [ ] Form label ทุก field
- [ ] Focus ring visible
- [ ] Color contrast pass WCAG AA
- [ ] Keyboard navigation test
- [ ] Screen reader test (VoiceOver/NVDA)

### Performance Target
- LCP < 2.5s
- FID < 100ms
- CLS < 0.1
- Total page weight < 1MB

---

*Generated by /web-designer-pro — Claude Skill Unlock v1.0*
