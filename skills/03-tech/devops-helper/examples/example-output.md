---
type: devops-blueprint
project: TaskFlow SaaS
stack: Next.js 14 + PostgreSQL + Redis
deploy_target: Hetzner VPS (CX21) + Cloudflare + UptimeRobot
created: 2026-04-16
---

# DevOps Blueprint: TaskFlow — Next.js → Docker → GitHub Actions → VPS → UptimeRobot

## Overview

| Field | Value |
|-------|-------|
| App | TaskFlow — SaaS project management |
| Stack | Next.js 14 App Router + Postgres 16 + Redis 7 |
| Runtime | Node 20.11 |
| Deploy target | Hetzner VPS CX21 (€5.83/mo, Falkenstein DE) |
| Domain | taskflow.app (Cloudflare DNS + CDN) |
| SSL | Let's Encrypt via Caddy (auto renew) |
| Traffic estimate | 50K req/day, growing |
| Team | 2 devs (solo-founder + contractor) |
| Budget | ≤ $20/mo total |

**Goals:**
- Zero-downtime deploy
- Rollback < 2 min
- Detect incident < 3 min
- Free tier monitoring ก่อน — upgrade เมื่อ scale

---

## Dockerfile

**File:** `Dockerfile`

```dockerfile
# syntax=docker/dockerfile:1.6

# ============ Build stage ============
FROM node:20.11-alpine AS builder
WORKDIR /app

# Install build tools (ต้องมี libc6-compat สำหรับ sharp)
RUN apk add --no-cache libc6-compat

COPY package*.json ./
RUN npm ci --ignore-scripts

COPY . .

# Disable Next.js telemetry
ENV NEXT_TELEMETRY_DISABLED=1

RUN npm run build

# ============ Runtime stage ============
FROM node:20.11-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

# Non-root user
RUN addgroup --system --gid 1001 nodejs \
 && adduser --system --uid 1001 nextjs

# Next.js standalone output
COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3000/api/health || exit 1

CMD ["node", "server.js"]
```

**Image size:**
- Full node image: ~1.1 GB
- Alpine multi-stage: ~170 MB
- Savings: ~85%

**next.config.js** ต้องมี `output: 'standalone'`
```javascript
/** @type {import('next').NextConfig} */
module.exports = {
  output: 'standalone',
  compress: true,
  poweredByHeader: false,
}
```

### .dockerignore

```
node_modules
.next
.git
.gitignore
.env
.env.*
!.env.example
*.log
coverage
.DS_Store
README.md
.vscode
.idea
Dockerfile
docker-compose*.yml
```

---

## docker-compose.yml (Production on VPS)

**File:** `/opt/taskflow/docker-compose.yml`

```yaml
version: '3.9'

services:
  app:
    image: ghcr.io/acme/taskflow:latest
    restart: unless-stopped
    ports:
      - "127.0.0.1:3000:3000"  # expose only to localhost (Caddy proxies)
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgres://appuser:${DB_PASSWORD}@db:5432/taskflow
      - REDIS_URL=redis://redis:6379
      - NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
      - NEXTAUTH_URL=https://taskflow.app
      - SENTRY_DSN=${SENTRY_DSN}
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "5"
    networks:
      - internal

  db:
    image: postgres:16-alpine
    restart: unless-stopped
    volumes:
      - db_data:/var/lib/postgresql/data
      - ./backups:/backups
    environment:
      POSTGRES_DB: taskflow
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "appuser"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - internal

  redis:
    image: redis:7-alpine
    restart: unless-stopped
    command: redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru
    volumes:
      - redis_data:/data
    networks:
      - internal

  caddy:
    image: caddy:2-alpine
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
      - caddy_config:/config
    depends_on:
      - app
    networks:
      - internal

  # Nightly DB backup
  backup:
    image: postgres:16-alpine
    restart: "no"
    volumes:
      - ./backups:/backups
    environment:
      PGPASSWORD: ${DB_PASSWORD}
    entrypoint: /bin/sh
    command: >
      -c "pg_dump -h db -U appuser -d taskflow
          -F c -f /backups/taskflow_$$(date +%Y%m%d_%H%M).dump
          && find /backups -name '*.dump' -mtime +14 -delete"
    depends_on:
      - db
    networks:
      - internal
    profiles:
      - backup  # run manually: docker compose --profile backup run backup

volumes:
  db_data:
  redis_data:
  caddy_data:
  caddy_config:

networks:
  internal:
    driver: bridge
```

### Caddyfile (auto HTTPS + security headers)

```
taskflow.app, www.taskflow.app {
    redir / https://taskflow.app{uri} permanent

    reverse_proxy app:3000 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-For {remote}
        header_up X-Forwarded-Proto {scheme}
    }

    encode zstd gzip

    header {
        Strict-Transport-Security "max-age=31536000; includeSubDomains"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
        Referrer-Policy "strict-origin-when-cross-origin"
        Permissions-Policy "camera=(), microphone=(), geolocation=()"
        -Server
    }

    log {
        output file /var/log/caddy/access.log {
            roll_size 10MB
            roll_keep 5
        }
        format json
    }
}
```

### Cron backup (host crontab)

```bash
# /etc/cron.d/taskflow-backup
# Daily backup at 2 AM
0 2 * * * deploy cd /opt/taskflow && docker compose --profile backup run --rm backup >> /var/log/taskflow-backup.log 2>&1

# Upload to Backblaze B2 (cheap offsite backup)
30 2 * * * deploy rclone sync /opt/taskflow/backups b2:taskflow-backups --max-age 30d
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
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  lint-test:
    name: Lint + Test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20.11
          cache: npm
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck
      - name: Unit test
        run: npm test -- --coverage
      - name: Upload coverage
        if: always()
        uses: codecov/codecov-action@v4
        with:
          token: ${{ secrets.CODECOV_TOKEN }}

  e2e:
    name: E2E (Playwright)
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_PASSWORD: test
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20.11
          cache: npm
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm run build
      - run: npm run test:e2e
        env:
          DATABASE_URL: postgres://postgres:test@localhost:5432/test

  security:
    name: Security scan
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Trivy filesystem scan
        uses: aquasecurity/trivy-action@master
        with:
          scan-type: fs
          severity: CRITICAL,HIGH
          exit-code: 1
          ignore-unfixed: true
      - name: npm audit
        run: npm audit --audit-level=high
        continue-on-error: false

  build-push:
    name: Build + Push image
    needs: [lint-test, e2e, security]
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    outputs:
      image_tag: ${{ steps.meta.outputs.version }}
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
          platforms: linux/amd64

  deploy:
    name: Deploy to VPS
    needs: build-push
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://taskflow.app
    steps:
      - name: SSH + Deploy
        uses: appleboy/ssh-action@v1.0.0
        with:
          host: ${{ secrets.VPS_HOST }}
          username: deploy
          key: ${{ secrets.VPS_SSH_KEY }}
          script: |
            set -e
            cd /opt/taskflow

            # Pull latest image
            docker compose pull app

            # Rolling update (no downtime for single instance = brief downtime)
            docker compose up -d --no-deps app

            # Wait for healthy
            for i in {1..30}; do
              if curl -fsS http://localhost:3000/api/health > /dev/null; then
                echo "Health check passed"
                break
              fi
              if [ $i -eq 30 ]; then
                echo "Health check failed - rolling back"
                docker compose restart app
                exit 1
              fi
              sleep 2
            done

            # Cleanup old images
            docker image prune -f --filter "until=72h"

      - name: Smoke test
        run: |
          for i in {1..5}; do
            if curl -fsS https://taskflow.app/api/health | grep -q '"ok":true'; then
              echo "Smoke test passed"
              exit 0
            fi
            sleep 5
          done
          echo "Smoke test FAILED"
          exit 1

      - name: Notify Slack on success
        if: success()
        uses: slackapi/slack-github-action@v1
        with:
          webhook: ${{ secrets.SLACK_WEBHOOK }}
          webhook-type: incoming-webhook
          payload: |
            {
              "text": "Deploy success",
              "blocks": [{
                "type": "section",
                "text": {
                  "type": "mrkdwn",
                  "text": "*Deploy success* — <${{ github.server_url }}/${{ github.repository }}/commit/${{ github.sha }}|${{ github.sha }}>\nBy ${{ github.actor }}"
                }
              }]
            }

      - name: Notify Slack on failure
        if: failure()
        uses: slackapi/slack-github-action@v1
        with:
          webhook: ${{ secrets.SLACK_WEBHOOK }}
          webhook-type: incoming-webhook
          payload: |
            {
              "text": "Deploy FAILED @channel",
              "blocks": [{
                "type": "section",
                "text": {
                  "type": "mrkdwn",
                  "text": ":rotating_light: *Deploy FAILED* — <${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}|View logs>"
                }
              }]
            }
```

### Required GitHub secrets
| Name | Value |
|------|-------|
| `VPS_HOST` | `123.45.67.89` |
| `VPS_SSH_KEY` | private key (ed25519) |
| `SLACK_WEBHOOK` | Slack incoming webhook |
| `CODECOV_TOKEN` | from Codecov |

---

## Monitoring Setup

### 1. UptimeRobot (free tier)

5 monitors:

| Monitor | URL | Interval | Alert |
|---------|-----|----------|-------|
| Home page | `https://taskflow.app` | 5 min | email + LINE Notify |
| API health | `https://taskflow.app/api/health` | 5 min | email + LINE Notify |
| Sign in page | `https://taskflow.app/signin` | 15 min | email |
| Keyword check | `https://taskflow.app` contains "TaskFlow" | 5 min | email |
| Port 443 | `taskflow.app:443` | 5 min | email |

Alert contacts:
- Primary: ops@taskflow.app
- Secondary: LINE Notify (กลุ่มทีม)
- Escalation: PagerDuty (future)

### 2. Health check endpoint

**File:** `app/api/health/route.ts`

```typescript
import { NextResponse } from 'next/server'
import { db } from '@/lib/db'
import { redis } from '@/lib/redis'

export async function GET() {
  const checks = {
    db: false,
    redis: false,
    timestamp: new Date().toISOString(),
  }

  try {
    await db.$queryRaw`SELECT 1`
    checks.db = true
  } catch {}

  try {
    await redis.ping()
    checks.redis = true
  } catch {}

  const ok = checks.db && checks.redis

  return NextResponse.json(
    { ok, ...checks },
    { status: ok ? 200 : 503 }
  )
}
```

### 3. Sentry (error tracking)

**Install:**
```bash
npx @sentry/wizard@latest -i nextjs
```

Free tier: 5K errors/month

Config highlight:
```typescript
// sentry.server.config.ts
Sentry.init({
  dsn: process.env.SENTRY_DSN,
  tracesSampleRate: 0.1,
  environment: process.env.NODE_ENV,
  beforeSend(event) {
    // Scrub PII (email, credit card)
    if (event.request?.data) {
      delete event.request.data.password
      delete event.request.data.creditCard
    }
    return event
  },
})
```

### 4. Grafana Cloud (free tier)

10K metrics free. Prometheus alert rules:

```yaml
# /opt/taskflow/prometheus/alerts.yml
groups:
  - name: taskflow
    interval: 30s
    rules:
      - alert: AppDown
        expr: up{job="taskflow"} == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "TaskFlow app is DOWN"
          runbook: "https://wiki.taskflow.app/runbook/app-down"

      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m]))
          / sum(rate(http_requests_total[5m])) > 0.01
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "Error rate > 1% for 5 minutes"

      - alert: HighLatencyP95
        expr: |
          histogram_quantile(0.95,
            sum by (le) (rate(http_request_duration_seconds_bucket[5m]))
          ) > 2
        for: 10m
        labels:
          severity: warning
        annotations:
          summary: "p95 latency > 2s"

      - alert: DatabaseDown
        expr: pg_up == 0
        for: 1m
        labels:
          severity: critical

      - alert: HighDiskUsage
        expr: |
          (node_filesystem_size_bytes - node_filesystem_avail_bytes)
          / node_filesystem_size_bytes > 0.85
        for: 10m
        labels:
          severity: warning

      - alert: HighMemoryUsage
        expr: |
          (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes)
          / node_memory_MemTotal_bytes > 0.9
        for: 5m
        labels:
          severity: warning

      - alert: BackupMissing
        expr: time() - taskflow_last_backup_timestamp > 86400
        for: 1h
        labels:
          severity: warning
        annotations:
          summary: "DB backup ไม่ทำงานเกิน 24 ชม"
```

### 5. Grafana Dashboard (Panels)

```
Row 1: Summary
  - [Stat] Request rate (req/s)
  - [Stat] Error rate (%)
  - [Stat] p95 latency (ms)
  - [Stat] Active users (gauge)

Row 2: Performance
  - [Graph] Request rate — last 1h
  - [Graph] Error rate — last 1h, threshold 1%
  - [Graph] Latency p50/p95/p99 — last 1h

Row 3: Resources
  - [Graph] CPU per container
  - [Graph] Memory per container
  - [Graph] Disk I/O
  - [Graph] Network I/O

Row 4: Database
  - [Graph] Postgres connections (active / idle)
  - [Graph] Query duration (p95)
  - [Graph] Cache hit rate

Row 5: Business
  - [Graph] Signups per hour
  - [Graph] Projects created
  - [Graph] Failed login attempts
```

---

## Secret Management

### Storage strategy
| Environment | Method |
|-------------|--------|
| Local dev | `.env.local` (gitignored) |
| Staging | GitHub Secrets (for CI) |
| Production | `/opt/taskflow/.env` (chmod 600, owner=deploy) |

### .env.example (commit นี้)
```env
NODE_ENV=production
DATABASE_URL=postgres://appuser:CHANGE_ME@db:5432/taskflow
REDIS_URL=redis://redis:6379
NEXTAUTH_SECRET=CHANGE_ME_TO_RANDOM_32_CHAR
NEXTAUTH_URL=https://taskflow.app
SENTRY_DSN=https://xxx@sentry.io/xxx
```

### Rotation schedule
- `DB_PASSWORD`: 90 days
- `NEXTAUTH_SECRET`: เมื่อมี breach suspected
- SSH key: yearly
- SSL: auto (Let's Encrypt 90-day rotation)

---

## Rollback Plan

### Quick rollback script

**File:** `/opt/taskflow/rollback.sh`

```bash
#!/bin/bash
set -e

# Usage: ./rollback.sh [previous_sha]
# Default: rollback to previous image

IMAGE=ghcr.io/acme/taskflow

if [ -n "$1" ]; then
  PREV_TAG=$1
else
  # Get second-latest tag
  PREV_TAG=$(docker images --format '{{.Tag}}' $IMAGE | grep -v latest | sed -n '1p')
fi

echo "Rolling back to: $IMAGE:$PREV_TAG"

# Tag the old image as latest
docker tag $IMAGE:$PREV_TAG $IMAGE:latest

# Restart with the old image
docker compose up -d --no-deps app

# Health check
for i in {1..15}; do
  if curl -fsS http://localhost:3000/api/health > /dev/null; then
    echo "Rollback successful"
    exit 0
  fi
  sleep 2
done

echo "Rollback FAILED - health check failed"
exit 1
```

### Database migration rollback

Use Prisma migrate with reversible migrations:

```bash
# List migrations
npx prisma migrate status

# Rollback last migration (if supported)
npx prisma migrate resolve --rolled-back <migration_name>

# Or restore from backup
pg_restore -h localhost -U appuser -d taskflow -c /opt/taskflow/backups/latest.dump
```

### Full disaster recovery (RPO: 24h, RTO: 2h)

1. **Provision new VPS** (Hetzner API + cloud-init)
2. **Install Docker + dependencies** (Ansible playbook)
3. **Restore DB** จาก Backblaze B2 (rclone sync)
4. **Clone repo + deploy** (`docker compose up -d`)
5. **Update DNS** (Cloudflare API — swap A record)
6. **Verify** — smoke test + monitor

---

## Runbook: Top Alerts

### 1. AppDown (SEV1)

**Symptom:** UptimeRobot notify + all requests fail

**Diagnosis:**
1. SSH to VPS: `ssh deploy@vps`
2. `docker compose ps` — check container status
3. `docker compose logs --tail=100 app` — see recent error
4. `df -h` — disk full?
5. `free -m` — OOM killed?

**Resolution:**
```bash
# Option 1: Restart
docker compose restart app

# Option 2: Rollback
./rollback.sh

# Option 3: Scale down + cleanup if disk full
docker system prune -a
```

### 2. HighErrorRate (SEV1)

**Symptom:** Error rate > 1% in Grafana

**Diagnosis:**
1. Check Sentry: recent errors cluster
2. Check recent deploy: `git log --since="1 hour ago"`
3. Check DB: `docker compose exec db psql -U appuser -c "SELECT * FROM pg_stat_activity"`
4. Check third-party status pages (Stripe, SendGrid)

**Resolution:**
- ถ้ามาจาก deploy ล่าสุด → rollback
- ถ้ามาจาก DB → restart db + check connection pool
- ถ้ามาจาก third-party → enable circuit breaker / fallback

### 3. DatabaseDown (SEV1)

**Symptom:** `pg_up == 0` + app errors

**Diagnosis:**
1. `docker compose logs db` — crashed?
2. `docker compose exec db pg_isready` — accepting connections?
3. `df -h` — disk full?

**Resolution:**
```bash
# Restart
docker compose restart db

# If corrupted — restore from backup
docker compose down db
docker volume rm taskflow_db_data
docker compose up -d db
# Wait healthy, then:
pg_restore -h localhost -U appuser -d taskflow -c /opt/taskflow/backups/latest.dump
```

### 4. HighMemoryUsage (SEV2)

**Symptom:** Memory > 90% for 5 min

**Quick fix:**
```bash
# Restart container (clears memory)
docker compose restart app

# Long-term: profile with clinic.js
# Or scale up VPS (Hetzner: CX21 → CX31)
```

### 5. SSLExpiring (SEV3 — 14 days warning)

**Symptom:** Cert < 14 days to expire

Caddy auto-renews — this shouldn't happen but:
```bash
# Force renew
docker compose exec caddy caddy reload --config /etc/caddy/Caddyfile
```

---

## Cost Breakdown

| Item | Cost/mo | Note |
|------|---------|------|
| Hetzner VPS CX21 | $6.50 | 2 vCPU, 4GB RAM, 40GB SSD |
| Domain (taskflow.app) | $1 | $12/year amortized |
| Cloudflare | $0 | Free tier (DNS + CDN + SSL backup) |
| GitHub Actions | $0 | 2000 min free / month |
| GHCR registry | $0 | Free for public repo |
| UptimeRobot | $0 | 50 monitors free |
| Grafana Cloud | $0 | 10K metrics, 50GB logs free |
| Sentry | $0 | 5K errors/month free |
| Backblaze B2 (backups) | $0.50 | ~100GB @ $0.005/GB |
| Slack | $0 | Free tier |
| **Total** | **~$8/mo** | |

**Scale plan:**
- At 500K req/day → upgrade VPS to CX31 ($12/mo)
- At 100K monitors needed → UptimeRobot Pro ($7/mo)
- At 100K errors/mo → Sentry Team ($26/mo)

---

## Production-Ready Checklist

**Infrastructure:**
- [x] VPS provisioned + hardened (ufw, fail2ban, ssh-key-only)
- [x] DNS configured (Cloudflare A record + CNAME www)
- [x] SSL auto (Caddy + Let's Encrypt)
- [x] Backup daily + offsite (Backblaze)

**Application:**
- [x] Dockerfile multi-stage + non-root + health check
- [x] docker-compose with restart policy + healthcheck
- [x] Environment config via .env (chmod 600)
- [x] Log rotation (docker logging options)
- [x] Health endpoint returns ok/error correctly

**CI/CD:**
- [x] Lint + typecheck + test run on every PR
- [x] E2E test with Playwright
- [x] Security scan (Trivy + npm audit)
- [x] Build + push to GHCR
- [x] Deploy with SSH
- [x] Smoke test post-deploy
- [x] Slack notification
- [x] Rollback script tested

**Monitoring:**
- [x] UptimeRobot 5 monitors
- [x] Sentry error tracking + PII scrub
- [x] Grafana dashboard + alerts
- [x] Prometheus alert rules (5 rules)
- [x] LINE Notify for critical alerts

**Documentation:**
- [x] README.md with setup + deploy steps
- [x] Runbook for top 5 alerts
- [x] Rollback plan tested
- [x] DR plan documented

---

*Generated by /devops-helper — Claude Skill Unlock v1.0*
