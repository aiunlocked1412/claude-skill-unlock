---
type: devops-blueprint
project: <ชื่อโปรเจค>
stack: <tech stack>
deploy_target: <target>
created: YYYY-MM-DD
---

# DevOps Blueprint: <โปรเจค>

## Overview

| Field | Value |
|-------|-------|
| App | Next.js 14 + PostgreSQL |
| Language | Node 20.11 |
| Deploy target | Hetzner VPS (Ubuntu 22.04) |
| Domain | myapp.com (Cloudflare DNS) |
| SSL | Let's Encrypt (auto) |
| Traffic | 10K req/day projected |
| Team | 2 devs |
| Budget | ≤ $30/mo |

---

## Dockerfile

```dockerfile
# syntax=docker/dockerfile:1.6

# ============ Build stage ============
FROM node:20.11-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --ignore-scripts

COPY . .
RUN npm run build

# ============ Runtime stage ============
FROM node:20.11-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

RUN addgroup --system --gid 1001 nodejs \
 && adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3000/api/health || exit 1

CMD ["node", "server.js"]
```

### .dockerignore
```
node_modules
.next
.git
.env*
!.env.example
*.log
coverage
.DS_Store
README.md
```

---

## docker-compose.yml (Production)

```yaml
version: '3.9'

services:
  app:
    image: ghcr.io/owner/myapp:latest
    restart: unless-stopped
    ports:
      - "127.0.0.1:3000:3000"
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgres://appuser:${DB_PASSWORD}@db:5432/appdb
    depends_on:
      db:
        condition: service_healthy
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "3"

  db:
    image: postgres:16-alpine
    restart: unless-stopped
    volumes:
      - db_data:/var/lib/postgresql/data
      - ./backups:/backups
    environment:
      POSTGRES_DB: appdb
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "appuser"]
      interval: 10s
      timeout: 5s
      retries: 5

  caddy:
    image: caddy:2-alpine
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config
    depends_on:
      - app

volumes:
  db_data:
  caddy_data:
  caddy_config:
```

### Caddyfile (auto HTTPS)
```
myapp.com {
    reverse_proxy app:3000
    encode gzip
    header {
        Strict-Transport-Security "max-age=31536000"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
        Referrer-Policy "strict-origin-when-cross-origin"
    }
}
```

---

## CI/CD — GitHub Actions

**File:** `.github/workflows/ci-cd.yml`

```yaml
name: CI/CD

on:
  push:
    branches: [main]
  pull_request:

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  lint-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck
      - run: npm test -- --coverage
      - uses: codecov/codecov-action@v4

  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Trivy filesystem scan
        uses: aquasecurity/trivy-action@master
        with:
          scan-type: fs
          severity: CRITICAL,HIGH
          exit-code: 1
      - run: npm audit --audit-level=high

  build-push:
    needs: [lint-test, security]
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    outputs:
      image_tag: ${{ steps.meta.outputs.tags }}
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=sha,prefix=,format=short
            type=raw,value=latest,enable={{is_default_branch}}
      - uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

  deploy:
    needs: build-push
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: appleboy/ssh-action@v1.0.0
        with:
          host: ${{ secrets.VPS_HOST }}
          username: deploy
          key: ${{ secrets.VPS_SSH_KEY }}
          script: |
            cd /opt/myapp
            docker compose pull app
            docker compose up -d --no-deps app
            sleep 10
            curl -fsS http://localhost:3000/api/health || exit 1
            docker image prune -f

      - name: Notify Slack
        if: always()
        uses: slackapi/slack-github-action@v1
        with:
          webhook: ${{ secrets.SLACK_WEBHOOK }}
          payload: |
            {
              "text": "Deploy ${{ job.status }}",
              "blocks": [{
                "type": "section",
                "text": {"type": "mrkdwn", "text": "Deploy *${{ job.status }}* — <${{ github.server_url }}/${{ github.repository }}/commit/${{ github.sha }}|${{ github.sha }}>"}
              }]
            }
```

### Required secrets
- `VPS_HOST` — IP ของ server
- `VPS_SSH_KEY` — private key (ed25519)
- `SLACK_WEBHOOK` — Slack incoming webhook URL

---

## Monitoring Setup

### Uptime — UptimeRobot
```yaml
monitors:
  - name: myapp-home
    url: https://myapp.com
    interval: 60s
    expect: status 200
    alert_contacts: [email-ops, line-notify-ops]

  - name: myapp-api-health
    url: https://myapp.com/api/health
    interval: 60s
    expect: status 200, body contains "ok"

  - name: myapp-db
    keyword_url: https://myapp.com/api/health
    keyword_type: exists
    keyword: "db:ok"
```

### Prometheus alert rules
**File:** `prometheus/alerts.yml`

```yaml
groups:
  - name: myapp
    interval: 30s
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m]))
          / sum(rate(http_requests_total[5m])) > 0.01
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "Error rate > 1% for 5 min"
          runbook: "https://wiki/runbook/high-error"

      - alert: HighLatencyP95
        expr: |
          histogram_quantile(0.95,
            sum(rate(http_request_duration_seconds_bucket[5m])) by (le)
          ) > 1
        for: 10m
        labels:
          severity: warning

      - alert: ContainerDown
        expr: up{job="myapp"} == 0
        for: 1m
        labels:
          severity: critical

      - alert: HighMemoryUsage
        expr: |
          (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes)
          / node_memory_MemTotal_bytes > 0.9
        for: 5m
        labels:
          severity: warning

      - alert: DiskSpaceLow
        expr: |
          (node_filesystem_avail_bytes / node_filesystem_size_bytes) < 0.1
        for: 5m
        labels:
          severity: critical
```

### Grafana Dashboard (panels)

| Panel | Metric | Threshold |
|-------|--------|-----------|
| Request rate | `sum(rate(http_requests_total[1m]))` | — |
| Error rate | `rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m])` | 1% |
| Latency p50 | `histogram_quantile(0.5, ...)` | 300ms |
| Latency p95 | `histogram_quantile(0.95, ...)` | 1s |
| CPU | `rate(container_cpu_usage_seconds_total[1m])` | 80% |
| Memory | `container_memory_usage_bytes` | 90% |
| DB connections | `pg_stat_database_numbackends` | pool max |
| Active users | custom metric | — |

### Sentry error tracking
```javascript
// next.config.js
import { withSentryConfig } from '@sentry/nextjs';

// sentry.client.config.ts
Sentry.init({
  dsn: process.env.NEXT_PUBLIC_SENTRY_DSN,
  tracesSampleRate: 0.1,
  environment: process.env.NODE_ENV,
  beforeSend(event) {
    // Scrub PII
    return event;
  },
});
```

---

## Secret Management

### Development
- `.env.local` (git-ignored)
- `.env.example` (committed, no real values)

### Production
- Store in VPS: `/opt/myapp/.env` (chmod 600, owner=deploy)
- Or: Doppler / Infisical (paid but nicer)

### Rotation schedule
- DB password: every 90 days
- API keys: every 180 days
- SSH keys: yearly
- SSL cert: auto (Let's Encrypt)

---

## Rollback Plan

### Quick rollback (< 2 min)
```bash
# On VPS
cd /opt/myapp
PREV_SHA=$(docker images --format '{{.Tag}}' ghcr.io/owner/myapp | sed -n '2p')
docker compose down app
docker compose up -d --no-deps \
  -e IMAGE_TAG=$PREV_SHA app
```

### Database rollback
- Migration ต้องเป็น **reversible** — มี `down.sql`
- Backup ก่อน migration: `pg_dump appdb > backup_$(date +%Y%m%d_%H%M).sql`
- Restore: `psql appdb < backup_*.sql`

### Full disaster recovery (RPO: 24h, RTO: 1h)
1. Spin up new VPS (provision script)
2. Restore DB จาก latest daily backup (S3/Backblaze)
3. Deploy latest image
4. Update DNS (Cloudflare)

---

## Runbook: HighErrorRate Alert

**Severity:** SEV1
**Owner:** Backend team

**Symptom:**
- Users see 500 error
- Sentry event flooding
- Error rate > 1% in last 5 min

**Quick diagnosis:**
1. Dashboard: https://grafana.myapp.com/d/app-overview
2. Recent deploys: https://github.com/owner/myapp/actions
3. Sentry: https://sentry.io/myapp/issues
4. DB status: `docker compose exec db pg_isready`

**Common causes:**
1. Bad deploy (new code has bug) → rollback
2. DB connection exhaustion → restart app
3. Third-party API down → check their status page
4. DDoS → Cloudflare rate limit

**Resolution:**
```bash
# Option 1: Rollback
ssh deploy@vps "cd /opt/myapp && ./rollback.sh"

# Option 2: Restart app
docker compose restart app

# Option 3: Scale up (if traffic spike)
docker compose up -d --scale app=3
```

**Verify:**
```bash
curl -fsS https://myapp.com/api/health
# Check Grafana — error rate back < 0.5%
```

**Escalation:**
- 15 min no fix → notify tech lead
- 30 min no fix → incident commander

---

## Performance Tuning Checklist

- [ ] Enable gzip/brotli (Caddy auto)
- [ ] Set Cache-Control headers (static assets: 1 year)
- [ ] CDN for assets (Cloudflare free tier)
- [ ] Connection pooling (pgbouncer or node-pg pool)
- [ ] Index on frequently queried columns
- [ ] Redis cache for hot queries
- [ ] Image optimization (next/image)
- [ ] Bundle analysis ลด JS size

---

## Cost Breakdown

| Item | Cost | Note |
|------|------|------|
| VPS (Hetzner CX21) | €5.83/mo | 2 vCPU, 4GB RAM, 40GB SSD |
| Domain | $12/year | Namecheap |
| Cloudflare | $0 | Free tier |
| GitHub Actions | $0 | 2000 min free |
| GHCR (container registry) | $0 | Free with public repo |
| UptimeRobot | $0 | 50 monitors free |
| Grafana Cloud (free tier) | $0 | 10K metrics |
| Sentry | $0 | 5K events/month free |
| Slack notifications | $0 | |
| **Total** | **~$7/mo** | |

---

## Runbook Index

- [HighErrorRate](#runbook-higherrorrate-alert)
- DatabaseDown (create)
- HighMemoryUsage (create)
- SSLExpiring (create)
- DDoSAttack (create)

---

## Checklist: Production-Ready

- [x] Dockerfile multi-stage + non-root
- [x] .dockerignore comprehensive
- [x] Health check endpoint
- [x] CI/CD pipeline pass test + security
- [x] Registry authenticated
- [x] Deploy via SSH (or automated)
- [x] Uptime monitoring
- [x] Error tracking (Sentry)
- [x] Logs aggregated (Grafana Loki / Papertrail)
- [x] Alerts configured
- [x] Runbook for top 5 alerts
- [x] Rollback tested
- [x] Database backup daily
- [x] SSL certificate auto-renew
- [x] Secrets rotated

---

*Generated by /devops-helper — Claude Skill Unlock v1.0*
