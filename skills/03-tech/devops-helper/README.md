# DevOps Helper

> AI DevOps Engineer — Dockerfile + CI/CD + Monitoring ที่ production-ready ไม่พัง

## ใช้ยังไง

```
/devops-helper
```

## ทำอะไรได้บ้าง

- **Dockerfile** multi-stage optimized (ขนาดเล็ก + secure)
- **docker-compose.yml** สำหรับ dev + production
- **CI/CD pipeline** — GitHub Actions / GitLab CI / Bitbucket
- **Deploy config** — VPS (SSH), Vercel, Railway, Fly.io, AWS ECS, Cloud Run
- **Monitoring** — Prometheus/Grafana, UptimeRobot, Sentry, BetterStack
- **Alert rules** ที่ actionable (ไม่สแปม)
- **Runbook** incident response
- **Rollback plan** ที่ใช้จริงได้

## รองรับ

**Language/Framework:** Node/Next.js, Python/Django/FastAPI, Go, Ruby/Rails, Rust, PHP/Laravel
**Container:** Docker, Docker Compose
**CI/CD:** GitHub Actions, GitLab CI, Bitbucket Pipelines, CircleCI
**Deploy:** VPS, Vercel, Netlify, Railway, Render, Fly.io, AWS ECS/Lambda, Google Cloud Run, Kubernetes
**Monitoring:** Prometheus, Grafana, Datadog, New Relic, Sentry, UptimeRobot, BetterStack

## Use cases

- Deploy Next.js app ครั้งแรก
- Setup CI/CD automation สำหรับทีม
- Migrate จาก manual SCP → proper pipeline
- Audit Dockerfile ที่มีอยู่
- Setup monitoring ก่อน incident ถัดไป
- สร้าง runbook incident response

## ไฟล์ใน skill นี้

```
devops-helper/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md        # best practices + security checklist
│   └── output-template.md
└── examples/
    └── example-output.md     # Next.js → Docker → Actions → VPS → UptimeRobot
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Next.js app deploy ครบชุด

## Tips

- บอก stack + version ให้ครบ — Node 20? 18?
- บอก deploy target ตั้งแต่ต้น (VPS ต่างจาก Vercel)
- บอก traffic estimate — จะได้แนะนำ instance size เหมาะ
- บอก team size — 1 คน vs ทีม 10 คน CI/CD ต่างกัน

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — fix โค้ดก่อน deploy
- `/qa-tester-pro` — setup test ใน CI
- `/data-analyst-pro` — query metric จาก Grafana
