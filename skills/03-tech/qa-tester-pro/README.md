# QA Tester Pro

> AI QA Engineer — test case ครอบคลุม edge case + bug report + regression checklist

## ใช้ยังไง

```
/qa-tester-pro
```

## ทำอะไรได้บ้าง

- Test case matrix (happy path / sad path / edge case / non-functional)
- Edge case brainstorm (คิดมุมที่ dev ไม่คาดคิด)
- Bug report template reproducible
- Regression checklist ก่อน deploy
- Test plan ครบชุด (scope + schedule + resource)
- Test data generator (fake user, edge value)

## Use cases

- ก่อน release feature ใหม่
- สร้างทีม QA ใหม่ (ต้องการ template)
- Audit feature ที่มีอยู่
- เขียน spec test สำหรับ automation (Playwright/Cypress/Selenium)
- Security test (manual pen test checklist)

## ครอบคลุม

- Functional: unit / integration / e2e
- Non-functional: performance / security / accessibility / compatibility
- Edge case: boundary / empty / max / special character / concurrency
- Priority: P0 (critical) → P3 (trivial)

## ไฟล์ใน skill นี้

```
qa-tester-pro/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md        # edge case checklist
│   └── output-template.md
└── examples/
    └── example-output.md     # Login feature — 15+ test cases
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — test cases สำหรับ login feature พร้อม edge cases 15+ cases

## Tips

- แปะ requirement spec ให้ครบ — test case ครอบคลุมขึ้น
- บอก platform + browser ที่รองรับ
- ถ้ามี user persona/role ให้แจ้ง — test case แยกตาม role

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — fix bug ที่หาเจอ
- `/devops-helper` — setup CI/CD test automation
