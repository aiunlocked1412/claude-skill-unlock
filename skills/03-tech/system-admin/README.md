# System Admin

> AI Linux Sysadmin — Setup VPS, Nginx, fail2ban, backup, monitoring, disaster recovery

## ใช้ยังไง

```
/system-admin
```

## ทำอะไรได้บ้าง

- Setup Ubuntu VPS จากศูนย์ → secure baseline (15 นาที)
- Nginx reverse proxy + Let's Encrypt SSL
- fail2ban + UFW firewall hardening
- Automated backup (restic + Backblaze/S3) + restore test
- Monitoring (Netdata, Uptime Kuma, Prometheus)
- Disaster recovery runbook + RTO/RPO planning
- Server hardening checklist

## รองรับ

- **Distro:** Ubuntu 22/24, Debian, CentOS/Rocky
- **Web server:** Nginx, Caddy, Apache
- **Process manager:** systemd, PM2
- **Backup:** restic, borgbackup, rclone
- **Monitoring:** Netdata, Prometheus/Grafana, Uptime Kuma

## Use cases

- ซื้อ VPS ใหม่ ต้อง secure ภายในชั่วโมงแรก
- Deploy app ลง VPS เอง (ไม่ใช้ Vercel/Heroku)
- โดน brute force SSH — fail2ban setup
- Backup ที่เก็บใน server เดียวกัน — ต้อง offsite
- Monitoring + alert ที่ส่ง Line/Discord/Telegram
- Disk เต็ม / service crash — runbook

## ไฟล์ใน skill นี้

```
system-admin/
├── SKILL.md                # ไฟล์หลัก
├── README.md
├── templates/
│   ├── prompt-main.md      # setup checklist + runbook pattern
│   └── output-template.md  # runbook format
└── examples/
    └── example-output.md   # VPS from scratch → production ready
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Ubuntu 24 VPS ครบ (SSH harden + Nginx + backup + monitor)

## Tips

- บอก distro + version
- บอก app stack ที่จะ deploy (Node/Python/PHP)
- ส่ง output `df -h`, `free -m`, `ufw status` ตอน debug
- ถ้ามี monitoring อยู่แล้ว ส่ง dashboard URL/screenshot

## Skills ที่ใช้คู่กัน

- `/devops-helper` — Docker + CI/CD บน server เดียวกัน
- `/security-engineer` — server-side security audit
- `/database-architect` — Postgres tuning + backup strategy
- `/programmer-pro` — debug app crash บน production server
