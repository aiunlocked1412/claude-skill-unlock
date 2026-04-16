# Tech Writer

> AI Technical Documentation Specialist — เขียน README, API doc, tutorial, ADR, changelog ที่ใช้งานได้จริง

## ใช้ยังไง

```
/tech-writer
```

## ทำอะไรได้บ้าง

- README.md ครบ structure (title → quickstart → install → usage → API)
- API documentation (OpenAPI 3.1, Swagger, Redoc)
- Tutorial step-by-step (prerequisite → steps → verify → troubleshoot)
- ADR (Architecture Decision Record)
- Changelog format Keep a Changelog + SemVer
- Contributing guide, runbook, postmortem

## รองรับ

- **Format:** Markdown, MDX, AsciiDoc
- **API spec:** OpenAPI 3.1, GraphQL SDL, AsyncAPI
- **Style:** Google Dev docs, Microsoft Style Guide
- **Tools:** MkDocs, Docusaurus, Nextra, GitBook

## Use cases

- โปรเจคไม่มี README หรือ outdated
- เพิ่ง launch API — ต้องการ doc ให้ developer คนอื่นใช้
- เขียน ADR ทุก major decision (audit trail)
- Release v1.0 → ต้องเขียน changelog + migration guide
- Onboard dev ใหม่ — ต้องการ getting started tutorial

## ไฟล์ใน skill นี้

```
tech-writer/
├── SKILL.md                # ไฟล์หลัก
├── README.md
├── templates/
│   ├── prompt-main.md      # structure + style guide
│   └── output-template.md  # README + ADR template
└── examples/
    └── example-output.md   # README ตัวอย่าง (CLI tool ชื่อ "genpass")
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — README ที่มี quickstart, install, usage, contributing ครบ

## Tips

- ส่งโค้ด/repo จริง — Tech Writer extract feature เอง
- บอก audience (newbie? senior? both?)
- บอก format (GitHub markdown? MkDocs? Docusaurus?)
- ส่ง doc เก่า (ถ้ามี) — improve ดีกว่า rewrite

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — extract API signature จากโค้ด
- `/devops-helper` — runbook + incident response doc
- `/database-architect` — schema doc + migration history
- `/web-designer-pro` — landing page doc site
