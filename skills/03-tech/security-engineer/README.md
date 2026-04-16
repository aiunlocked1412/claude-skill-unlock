# Security Engineer

> AI Penetration Tester — ตรวจช่องโหว่ OWASP Top 10, JWT, SQL injection, CSRF, secret leak

## ใช้ยังไง

```
/security-engineer
```

## ทำอะไรได้บ้าง

- OWASP Top 10 audit (ทุกข้อ พร้อมตัวอย่างไทย context)
- JWT pitfall review (alg=none, refresh rotation, storage)
- SQL/NoSQL injection scan
- XSS, CSRF, SSRF detection
- Secret/API key leak (gitleaks pattern)
- bcrypt/argon2 setup ถูกต้อง
- Rate limit + auth flow review
- Threat model + attack scenario

## รองรับ

- **Backend:** Node, Python (Django/FastAPI), Go, PHP, Ruby, Java
- **Frontend:** React, Vue, vanilla JS (XSS focus)
- **Mobile:** keychain, certificate pinning
- **Cloud:** S3 bucket policy, IAM, secret manager

## Use cases

- Audit API ก่อน launch
- รับ bug bounty report — หา root cause + fix
- Compliance (PDPA, GDPR, PCI-DSS) gap check
- Pre-pentest checklist ลด scope ของ external pentest
- Code review ที่เน้น security

## ไฟล์ใน skill นี้

```
security-engineer/
├── SKILL.md                # ไฟล์หลัก
├── README.md               # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md      # OWASP checklist + threat model
│   └── output-template.md  # audit report format
└── examples/
    └── example-output.md   # Express API audit (SQLi + JWT bug)
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — audit Express + Postgres + JWT

## Tips

- ส่งโค้ด endpoint จริง ไม่ใช่แค่ describe
- บอก auth flow + session strategy
- บอก dependency version (`package.json`, `requirements.txt`)
- ถ้ามี log breach attempt ให้ส่งมาด้วย

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — review โค้ด refactor หลัง security fix
- `/devops-helper` — secret scanning ใน CI + dependency scan
- `/database-architect` — RLS + parameterized query review
- `/system-admin` — server hardening (SSH, firewall, fail2ban)
