---
type: sysadmin-runbook
target: web1.shopmate.com
distro: Ubuntu 24.04
created: 2026-04-16
purpose: setup VPS from scratch → production ready
---

# Sysadmin Runbook: ShopMate Web Server (web1)

## Overview

| Field | Value |
|-------|-------|
| Hostname | web1.shopmate.com |
| Distro | Ubuntu 24.04 LTS |
| Specs | 4 vCPU, 8GB RAM, 80GB SSD |
| Provider | Hetzner (CX31) |
| Purpose | Next.js app + Postgres + Redis |
| Owner | @ops-team |

---

## Setup Phase 1: Baseline Security (60 นาที)

### 1. Initial login + update
```bash
ssh root@<ip>
apt update && apt upgrade -y
apt install -y ufw fail2ban unattended-upgrades \
                htop ncdu tmux curl git wget zip
hostnamectl set-hostname web1
timedatectl set-timezone Asia/Bangkok
```

### 2. Create non-root user
```bash
adduser deploy --disabled-password
usermod -aG sudo deploy
mkdir -p /home/deploy/.ssh
chmod 700 /home/deploy/.ssh

# จาก laptop: copy public key
# scp ~/.ssh/id_ed25519.pub root@<ip>:/home/deploy/.ssh/authorized_keys

chmod 600 /home/deploy/.ssh/authorized_keys
chown -R deploy:deploy /home/deploy/.ssh
```

### 3. Harden SSH
```bash
cat > /etc/ssh/sshd_config.d/harden.conf <<'EOF'
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 2
AllowUsers deploy
EOF

systemctl restart ssh
# ทดสอบ login จาก terminal ใหม่ก่อนปิด session ปัจจุบัน!
```

### 4. UFW Firewall
```bash
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp comment 'SSH'
ufw allow 80/tcp comment 'HTTP'
ufw allow 443/tcp comment 'HTTPS'
ufw enable
ufw status verbose
```

### 5. fail2ban
```bash
cat > /etc/fail2ban/jail.local <<'EOF'
[DEFAULT]
bantime  = 3600
findtime = 600
maxretry = 5
backend  = systemd

[sshd]
enabled = true
maxretry = 3

[nginx-http-auth]
enabled = true
port = http,https
logpath = /var/log/nginx/error.log

[nginx-limit-req]
enabled = true
port = http,https
logpath = /var/log/nginx/error.log
EOF

systemctl restart fail2ban
fail2ban-client status sshd
```

### 6. Auto security update
```bash
dpkg-reconfigure --priority=low unattended-upgrades
# answer Yes
```

### 7. Swap (RAM 8GB ก็มี swap 2GB กันเหตุ)
```bash
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
```

---

## Setup Phase 2: App Stack

### Install Node.js 20 (via nvm สำหรับ deploy user)
```bash
su - deploy
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install 20
nvm alias default 20
node -v   # v20.x
```

### Install Postgres 16
```bash
sudo apt install -y postgresql-16 postgresql-contrib-16
sudo -u postgres psql <<'EOF'
CREATE USER shopmate WITH PASSWORD 'CHANGE_ME_STRONG_PASSWORD';
CREATE DATABASE shopmate_prod OWNER shopmate;
EOF

# tune
sudo -u postgres tee -a /etc/postgresql/16/main/postgresql.conf <<'EOF'
shared_buffers = 2GB
effective_cache_size = 6GB
work_mem = 16MB
maintenance_work_mem = 512MB
random_page_cost = 1.1
log_min_duration_statement = 1000
EOF

sudo systemctl restart postgresql
```

### Install Redis 7
```bash
sudo apt install -y redis-server
sudo sed -i 's/^# requirepass .*/requirepass STRONG_REDIS_PASS/' /etc/redis/redis.conf
sudo sed -i 's/^bind .*/bind 127.0.0.1/' /etc/redis/redis.conf
sudo systemctl restart redis-server
```

### Install Nginx
```bash
sudo apt install -y nginx
sudo rm /etc/nginx/sites-enabled/default

cat | sudo tee /etc/nginx/sites-available/shopmate <<'EOF'
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

server {
    listen 80;
    server_name shopmate.com www.shopmate.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name shopmate.com www.shopmate.com;

    ssl_certificate     /etc/letsencrypt/live/shopmate.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/shopmate.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header X-Frame-Options SAMEORIGIN;
    add_header X-Content-Type-Options nosniff;
    add_header Referrer-Policy strict-origin-when-cross-origin;

    gzip on;
    gzip_types text/plain application/json application/javascript text/css;

    location /api/ {
        limit_req zone=api burst=20 nodelay;
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/shopmate /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

### Let's Encrypt SSL
```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d shopmate.com -d www.shopmate.com \
  --email ops@shopmate.com --agree-tos --non-interactive
sudo certbot renew --dry-run
```

### Systemd service สำหรับ Next.js app
```ini
# /etc/systemd/system/shopmate.service
[Unit]
Description=ShopMate Next.js
After=network.target postgresql.service redis-server.service

[Service]
Type=simple
User=deploy
WorkingDirectory=/home/deploy/shopmate
Environment=NODE_ENV=production
Environment=PORT=3000
EnvironmentFile=/home/deploy/shopmate/.env.production
ExecStart=/home/deploy/.nvm/versions/node/v20.18.0/bin/node server.js
Restart=on-failure
RestartSec=5
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable shopmate
sudo systemctl start shopmate
sudo systemctl status shopmate
```

---

## Setup Phase 3: Backup

### restic + Backblaze B2
```bash
sudo apt install -y restic

# .restic-pass + B2 credential ไป /root (chmod 600)
sudo restic -r b2:shopmate-backup:web1 init
```

```bash
# /usr/local/bin/backup.sh
#!/usr/bin/env bash
set -euo pipefail

export RESTIC_REPOSITORY="b2:shopmate-backup:web1"
export RESTIC_PASSWORD_FILE="/root/.restic-pass"
export B2_ACCOUNT_ID="$(cat /root/.b2-id)"
export B2_ACCOUNT_KEY="$(cat /root/.b2-key)"

# Postgres dump
sudo -u postgres pg_dump shopmate_prod | gzip > /tmp/db.sql.gz

# Files + dump
restic backup \
  /etc/nginx /etc/postgresql /etc/letsencrypt \
  /home/deploy/shopmate \
  /tmp/db.sql.gz \
  --exclude='*.log' --exclude='node_modules' --exclude='.next/cache' \
  --tag daily

# Retention
restic forget --prune \
  --keep-daily 7 --keep-weekly 4 --keep-monthly 12

# Verify integrity (5% sample)
restic check --read-data-subset=5%

rm /tmp/db.sql.gz
```

```bash
sudo chmod +x /usr/local/bin/backup.sh
echo '0 3 * * * root /usr/local/bin/backup.sh >> /var/log/backup.log 2>&1' | sudo tee /etc/cron.d/backup
```

---

## Monitoring

### Netdata (1-line install)
```bash
bash <(curl -SsL https://my-netdata.io/kickstart.sh) --stable-channel --disable-telemetry
# UI: https://web1.shopmate.com:19999 (firewall to bastion)
sudo ufw allow from <bastion-ip> to any port 19999
```

### Uptime Kuma (docker on bastion or separate VPS)
```
Monitor:
- https://shopmate.com → status 200
- https://shopmate.com/api/health → status 200 + body "ok"
- TCP shopmate.com:443 (SSL expiry)
Alert: Line Notify token <...>
```

### Log aggregation: optional Loki + Grafana ภายหลัง

---

## Runbook: Incident Response

### Scenario 1: Disk full
```
Detect: Netdata alert "disk > 90%"
Diagnose:
  df -h /
  du -sh /var/log/* | sort -h
  du -sh /home/deploy/shopmate/.next/cache 2>/dev/null
  journalctl --disk-usage
Mitigate:
  journalctl --vacuum-time=7d
  rm -rf /home/deploy/shopmate/.next/cache
  apt-get clean
Verify: df -h shows < 80%
Long-term: setup logrotate + smaller systemd journal limit
```

### Scenario 2: Service down
```
Detect: Uptime Kuma "shopmate.com down"
Diagnose:
  systemctl status shopmate
  journalctl -u shopmate -n 100 --no-pager
  curl -I http://127.0.0.1:3000
  systemctl status nginx postgresql redis-server
Mitigate:
  sudo systemctl restart shopmate
  sleep 5 && curl -I http://127.0.0.1:3000
  ถ้ายังไม่ขึ้น → rollback git checkout <previous-tag> && systemctl restart
Verify: Uptime Kuma green
Post-mortem: capture journalctl + write incident note
```

### Scenario 3: SSH brute force spike
```
Detect: fail2ban alert > 100 ban/hour
Diagnose:
  fail2ban-client status sshd
  tail /var/log/auth.log | grep "Failed password"
Mitigate:
  # extend bantime
  sed -i 's/^bantime.*/bantime = 86400/' /etc/fail2ban/jail.local
  systemctl restart fail2ban
Long-term:
  - เปลี่ยน SSH port (เช่น 2222) + update ufw
  - allow ssh เฉพาะจาก IP allowlist (office + VPN)
```

---

## Maintenance Schedule

| Task | Frequency | Owner |
|------|-----------|-------|
| OS security update | weekly (auto) | unattended-upgrades |
| Backup test restore | quarterly | @ops-lead |
| SSL renewal | auto (certbot) | — |
| Audit fail2ban log | monthly | @sec-team |
| pg_dump + verify | weekly | @dba |
| Capacity review | quarterly | @ops-team |

---

## Contact

- **On-call:** PagerDuty schedule "ops"
- **Escalation:** @cto after 30 นาที no response
- **Hetzner support:** ticket via console.hetzner.cloud

---

*Generated by /system-admin — Claude Skill Unlock v1.1*
