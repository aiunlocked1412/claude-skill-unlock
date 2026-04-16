# Prompt Main — Web Designer Pro

## Design Principles (ใช้ทุกงาน)

### 1. User-first
- ถามเสมอ: "ผู้ใช้เข้ามาหาอะไร?"
- Primary CTA ต้องชัดในทันที (visible ภายใน 3 วิ)
- ลด friction — form field น้อยสุด, step น้อยสุด

### 2. Hierarchy
- ขนาด + สี + spacing สร้าง visual hierarchy
- H1 = 1 อันต่อหน้า
- ระยะห่างบอกความเกี่ยวข้อง (Gestalt proximity)

### 3. Consistency
- Token-based ทั้งหมด (color, space, radius)
- Component ใช้ซ้ำ — ไม่สร้างใหม่ทุกหน้า
- Same action → same look

### 4. Accessibility (WCAG AA ขั้นต่ำ)
- Contrast ratio ≥ 4.5:1 (body text)
- Contrast ratio ≥ 3:1 (large text, UI component)
- Focus ring มองเห็น
- Keyboard-navigable (tab order ถูก)
- Alt text ทุกภาพ
- Label ทุก form field

### 5. Performance-aware
- Hero image < 200KB (WebP/AVIF)
- Font weight ที่ใช้จริงเท่านั้น (ไม่โหลด 9 weight)
- Lazy load ภาพ below-the-fold

## Common Page Patterns

### Landing Page (SaaS / Product)
1. Header (logo + nav + CTA)
2. Hero (H1 + subhead + CTA + visual)
3. Social proof (logo strip / stats)
4. Feature (3 columns, icon + text)
5. How it works (3-4 steps)
6. Testimonial / case study
7. Pricing (3 tier mostly)
8. FAQ
9. Final CTA
10. Footer

### E-commerce Homepage
1. Header (logo + search + cart + account)
2. Hero banner (promo)
3. Category grid
4. Featured products
5. Story / brand section
6. Reviews
7. Newsletter
8. Footer

### Dashboard
1. Top bar (logo + search + user menu)
2. Sidebar (nav)
3. Page header (breadcrumb + title + action)
4. KPI cards
5. Chart/table main
6. Related items

## Component Checklist

### Button
- [ ] Variants: primary/secondary/ghost/destructive
- [ ] Sizes: sm/md/lg
- [ ] States: default/hover/active/disabled/loading
- [ ] Icon variant (leading/trailing/only)
- [ ] Min touch target 44×44px

### Form Input
- [ ] Label (ชัด ไม่แค่ placeholder)
- [ ] Helper text
- [ ] Error state (color + icon + message)
- [ ] Success state
- [ ] Disabled state
- [ ] Required indicator (*)

### Card
- [ ] Padding consistency
- [ ] Hover state (lift/shadow)
- [ ] Clickable variant vs static
- [ ] Loading skeleton

### Modal
- [ ] Backdrop (dim + blur)
- [ ] Close button + ESC + click-outside
- [ ] Focus trap (tab ไม่ออกนอก modal)
- [ ] Scroll-lock body

## Color System

### แนวทางเลือกสี

| Brand tone | Palette example |
|------------|-----------------|
| Corporate/Trust | Blue #2563EB + Gray + White |
| Playful | Purple #8B5CF6 / Coral #F87171 |
| Luxury | Black + Gold #D4A574 |
| Nature/Eco | Green #10B981 + Cream |
| Medical/Health | Teal #0891B2 + White |
| Food/Warm | Orange #F97316 + Cream |

### Scale generation
แต่ละสีต้องมี 9-11 เฉด (50, 100, 200 ... 900, 950)
- 50-200: background, surface
- 400-600: main color, interactive
- 700-950: text, active state

## Typography Rules

### Scale (Modular)
- Ratio 1.25 (major third) หรือ 1.333 (perfect fourth)
- Base 16px
- Max heading size: 48-64px (desktop), 32-40px (mobile)

### Line height
- Body: 1.5-1.6 (อังกฤษ), 1.6-1.8 (ไทย)
- Heading: 1.1-1.3
- Caption: 1.4

### Font weight
- 400 = regular body
- 500 = medium emphasis
- 600 = semibold (heading)
- 700 = bold

## Spacing System (4px base)
4, 8, 12, 16, 24, 32, 48, 64, 96, 128

### Rule of thumb
- ระหว่าง element ใน component: 8-16px
- ระหว่าง component: 24-32px
- ระหว่าง section: 64-96px
- Container padding (mobile): 16-24px
- Container padding (desktop): 48-80px

## Responsive Breakpoints

Mobile-first:
```css
/* default: mobile */
.container { padding: 16px; }

@media (min-width: 768px)  { /* tablet */ }
@media (min-width: 1024px) { /* desktop */ }
@media (min-width: 1440px) { /* wide */ }
```

Container max-width:
- Mobile: 100%
- Tablet: 720px
- Desktop: 1200px
- Wide: 1440px
