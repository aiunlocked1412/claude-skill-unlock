# Prompt Main — DevOps Helper

## Dockerfile Best Practices

### 1. Multi-stage build (เสมอ)
- Build stage ติดตั้ง dev tools + build
- Runtime stage มีเฉพาะ artifact + runtime
- ผลลัพธ์: image เล็กลง 50-90%

### 2. Pin version
```dockerfile
# Bad
FROM node:latest
FROM python:3

# Good
FROM node:20.11.1-alpine3.19
FROM python:3.12.2-slim-bookworm
```

### 3. Layer cache optimization
```dockerfile
# ลำดับ: rarely change → frequently change
WORKDIR /app
COPY package*.json ./          # rarely change
RUN npm ci                      # cache hit ถ้า package ไม่เปลี่ยน
COPY . .                        # frequently change
RUN npm run build
```

### 4. Non-root user
```dockerfile
RUN addgroup --system --gid 1001 appgroup \
 && adduser --system --uid 1001 --ingroup appgroup appuser
USER appuser
```

### 5. .dockerignore (สำคัญ)
```
node_modules
.git
.env
.env.*
*.log
coverage/
.next/
dist/
```

### 6. Health check
```dockerfile
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget --spider http://localhost:3000/health || exit 1
```

### 7. Signal handling
```dockerfile
# ใช้ exec form ไม่ใช่ shell form
CMD ["node", "server.js"]       # Good (receive SIGTERM)
# CMD node server.js            # Bad (won't get signal)
```

## Security Checklist

### Image
- [ ] Pin version (ไม่ใช่ `latest`)
- [ ] Use official/verified image
- [ ] Run as non-root user
- [ ] Minimize attack surface (alpine/distroless)
- [ ] Scan with Trivy / Snyk

### Secrets
- [ ] ไม่ hardcode secret ใน Dockerfile / code
- [ ] ใช้ env var + `.env` (ignore git)
- [ ] Production: secret manager (AWS Secrets, Vault, Doppler)
- [ ] Rotate secret เป็นระยะ

### Network
- [ ] HTTPS only (TLS 1.2+)
- [ ] Firewall — expose port ที่ใช้เท่านั้น
- [ ] Internal service — ใช้ private network
- [ ] Rate limit + DDoS protection

### Dependencies
- [ ] Audit weekly (`npm audit`, `pip-audit`, etc.)
- [ ] Pin dependency version (lock file)
- [ ] Renovate/Dependabot auto-update

## CI/CD Best Practices

### Pipeline stages (order)
1. **Lint** — style, formatting
2. **Test** — unit + integration
3. **Security scan** — Trivy, Snyk, SAST
4. **Build** — compile, bundle, docker build
5. **Push** — registry (ghcr, ECR, Docker Hub)
6. **Deploy** — staging → smoke test → production
7. **Notify** — Slack/LINE on success/fail

### Rules
- [ ] Fail fast — stop on first error
- [ ] Cache aggressively (node_modules, pip, docker layer)
- [ ] Parallel jobs when possible
- [ ] Secrets ใน CI secret vault (ไม่ใช่ env file)
- [ ] Approval gate for production deploy
- [ ] Immutable tag (SHA) + latest alias

### Deploy strategies

| Strategy | Downtime | Complexity | Use case |
|----------|----------|-----------|----------|
| Recreate | Yes | Low | Dev, staging |
| Rolling | No | Medium | Small-medium app |
| Blue/Green | No | Medium-high | Critical app |
| Canary | No | High | High-traffic app |

### Rollback plan (มีเสมอ)
- Keep last 3 image tags
- Script: `./rollback.sh <previous_sha>`
- Database migration — reversible
- Feature flag — can disable without redeploy

## Monitoring Strategy (4 Golden Signals)

1. **Latency** — how long request takes
   - Metric: p50, p95, p99 response time
   - Alert: p95 > 1s for 10 min

2. **Traffic** — request rate
   - Metric: req/sec
   - Alert: drop > 50% suddenly (outage)

3. **Errors** — failure rate
   - Metric: 5xx / total
   - Alert: error rate > 1% for 5 min

4. **Saturation** — resource utilization
   - Metric: CPU, memory, disk, db connection
   - Alert: memory > 90% for 5 min

## Alert Design Principles

### SMART alerts
- **Specific** — ระบุ service + metric
- **Measurable** — threshold ชัด
- **Actionable** — มี runbook
- **Relevant** — ไม่สแปม
- **Time-bound** — `for: 5m` (ไม่ alert ทันที)

### Alert levels
| Level | When | Response |
|-------|------|----------|
| Critical | ระบบล่ม, user impact | Page on-call ทันที |
| Warning | จะล่มถ้าไม่แก้ | Notify Slack, check ในเวลาทำการ |
| Info | FYI | Log เฉยๆ |

### Anti-patterns
- Alert ทุก error (noise)
- Threshold fix (ไม่ percentile)
- Alert ที่ไม่มีคนดู
- ไม่มี auto-resolve

## Deploy Target Selection

| Target | Best for | Cost | Complexity |
|--------|----------|------|-----------|
| **Vercel** | Next.js, static site | Free tier / $20 | Very low |
| **Railway** | Simple full-stack | $5-20/mo | Low |
| **Fly.io** | Global edge, Docker | $5-20/mo | Low-medium |
| **Render** | Full-stack, DB included | $7-25/mo | Low |
| **VPS (DigitalOcean, Hetzner)** | Full control | $5-50/mo | Medium |
| **AWS ECS/Fargate** | Enterprise, integrate AWS | $$$  | High |
| **Google Cloud Run** | Serverless container | Per-request | Medium |
| **Kubernetes (managed)** | Scale, complex | $$$$ | Very high |

### Rule of thumb
- Solo/side project → Vercel / Railway
- Small team, control needed → VPS with Docker + Actions
- Scale + team 10+ → Managed K8s (EKS, GKE)

## Incident Response Framework

### Severity levels
- **SEV1:** Production down, all users affected
- **SEV2:** Major feature broken, many users
- **SEV3:** Minor issue, some users
- **SEV4:** Cosmetic, no user impact

### Response timeline (SEV1)
- **T+0:** Alert fires
- **T+5 min:** On-call acknowledges
- **T+15 min:** Status page updated + team notified
- **T+30 min:** Triage + initial response
- **T+60 min:** Fix deployed OR escalate
- **T+24 hr:** Postmortem draft

### Runbook template
```
Title: <Alert name>
Severity: SEV1/2/3/4
Owner: <team>

Symptom:
- User sees...
- Error in log: ...

Quick diagnosis:
1. Check dashboard: <link>
2. Check recent deploys: <link>
3. Check error logs: <kql/query>

Common causes:
1. ...
2. ...

Resolution steps:
1. ...
2. Rollback: ./rollback.sh <sha>
3. Verify: curl ...

Escalation:
- After 30 min → notify lead
- After 60 min → incident commander

Post-incident:
- Update status page
- Write postmortem within 48 hr
- Create prevention ticket
```
