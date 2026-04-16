# Prompt Main — System Admin

## VPS Setup Checklist (Hour 1)

- [ ] `apt update && apt upgrade -y`
- [ ] Create non-root user with sudo
- [ ] SSH key authentication only (disable password)
- [ ] Disable root SSH login
- [ ] UFW: deny incoming, allow ssh/http/https only
- [ ] fail2ban on sshd
- [ ] Unattended security upgrades
- [ ] Hostname + timezone set
- [ ] Swap file (if RAM < 2GB)

## Hardening Levels

### Level 1: Baseline (1 hour)
SSH key, UFW, fail2ban, auto-update

### Level 2: Production (1 day)
+ Nginx + Let's Encrypt + security headers
+ Backup automation + offsite
+ Netdata + Uptime Kuma
+ Log rotation

### Level 3: Compliance (1 week)
+ CIS benchmark audit
+ AppArmor/SELinux
+ Audit logging (auditd)
+ Centralized log (Loki/ELK)
+ Intrusion detection (Wazuh/OSSEC)

## Runbook Pattern

```
# Runbook: <Incident>

## Detect
- Alert trigger: <signal>
- First check: <command>

## Diagnose
1. Run: `<diagnostic command>`
2. Look for: <pattern>
3. If yes → <action>; if no → <next>

## Mitigate
- Quick fix (5 นาที): ...
- Real fix (long-term): ...

## Verify
- Test: <command/url>
- Expected: <output>

## Post-mortem
- Root cause: ...
- Prevent recurrence: ...
```

## Backup Strategy: 3-2-1 Rule

- **3** copies of data
- **2** different media (local + cloud)
- **1** offsite

```
Local snapshot (LVM/ZFS) → Restic to Backblaze B2 → Optionally rclone to S3
```

**Test restore quarterly!** Backup ที่ test ไม่ได้ = ไม่มี backup

## Monitoring Checklist

| Metric | Threshold | Tool |
|--------|-----------|------|
| Disk % | > 80% | Netdata |
| Disk inodes | > 80% | `df -i` |
| CPU load | > N+1 (N cores) | Netdata |
| RAM | > 90% | Netdata |
| Swap usage | > 50% | Netdata |
| HTTP 5xx rate | > 1% | Prometheus |
| Response time p95 | > 1s | Prometheus |
| SSL expiry | < 14 วัน | Uptime Kuma |
| Service down | any | Uptime Kuma |

## Common Commands Cheatsheet

```bash
# Disk
du -sh /* | sort -h
ncdu /
df -h /
df -i /  # inodes

# Memory
free -h
ps aux --sort=-%mem | head

# Network
ss -tulpn   # listen ports
ufw status verbose
fail2ban-client status sshd

# Service
systemctl status nginx
journalctl -u nginx -f --since "10 minutes ago"

# SSL
certbot certificates
openssl s_client -connect myapp.com:443 -servername myapp.com

# Logs
tail -f /var/log/nginx/error.log
journalctl --disk-usage
```

## Sysadmin Tone

- Automate everything (manual = bug)
- Document while doing (commit as runbook)
- Backup + tested restore > clever config
