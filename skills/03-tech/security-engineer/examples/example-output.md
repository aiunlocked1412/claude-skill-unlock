---
type: security-audit
target: ShopMate API (Express + Postgres)
scope: full backend (auth + checkout)
severity_summary: critical=2 high=3 medium=4
created: 2026-04-16
auditor: AI Security Engineer
---

# Security Audit: ShopMate API

## Executive Summary

| Severity | Count | Action |
|----------|-------|--------|
| Critical | 2 | Fix ภายใน 24 ชม. |
| High | 3 | Fix ภายใน 1 สัปดาห์ |
| Medium | 4 | Fix ใน sprint หน้า |
| Low | 2 | Backlog |
| Info | 3 | นโยบาย / best practice |

**Overall risk:** Critical

**TL;DR:** พบ SQL injection ใน `/api/products/search` และ JWT ที่ accept `alg=none` — attacker สามารถ dump database + impersonate admin ได้ภายในไม่กี่นาที ต้อง patch ทั้งสองรายการก่อน deploy รอบหน้า

---

## Scope

- **In scope:** REST API ภายใต้ `/api/*`, auth flow, database queries
- **Out of scope:** Frontend (SPA), 3rd-party payment provider
- **Tested at:** 2026-04-16 14:00 GMT+7
- **Method:** Code review (`git rev` `abc1234`) + dynamic test บน staging

---

## Critical Findings

### F-001: SQL Injection ใน product search

| Field | Value |
|-------|-------|
| Severity | Critical |
| CWE | CWE-89 (SQL Injection) |
| OWASP | A03:2021 |
| Location | `routes/products.js:23` |
| CVSS 3.1 | 9.8 |

**Description:**
> Endpoint `/api/products/search?q=...` ใช้ string concatenation สร้าง SQL query ตรงๆ — attacker ส่ง payload ใน `q` ทำให้ execute SQL ใดก็ได้ที่ user role ของ DB connection ทำได้

**Proof of Concept:**
```bash
curl "https://api.shopmate.com/api/products/search?q='%20UNION%20SELECT%20id,email,password_hash%20FROM%20users--"
# Response: dump email + bcrypt hash ของ user 1000+ คน
```

**Impact:**
- Dump user table (email + password hash)
- Modify product price (เปลี่ยน 10000 → 1)
- Drop table ถ้า DB user มี privilege

**Vulnerable Code:**
```javascript
// routes/products.js:23
app.get('/api/products/search', async (req, res) => {
  const q = req.query.q
  const result = await db.query(
    `SELECT * FROM products WHERE name ILIKE '%${q}%'`
  )
  res.json(result.rows)
})
```

**Remediation:**
```javascript
app.get('/api/products/search', async (req, res) => {
  const q = String(req.query.q ?? '').slice(0, 100)
  const result = await db.query(
    'SELECT id, name, price FROM products WHERE name ILIKE $1 LIMIT 50',
    [`%${q}%`]
  )
  res.json(result.rows)
})
```

**Fix checklist:**
- ใช้ parameterized query (`$1`, `$2`)
- Validate length input
- Whitelist columns ใน SELECT
- เพิ่ม LIMIT

**References:**
- [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
- [CWE-89](https://cwe.mitre.org/data/definitions/89.html)

---

### F-002: JWT accept `alg=none` (Auth Bypass)

| Field | Value |
|-------|-------|
| Severity | Critical |
| CWE | CWE-345 (Insufficient Verification of Data Authenticity) |
| OWASP | A07:2021 |
| Location | `middleware/auth.js:12` |
| CVSS 3.1 | 9.1 |

**Description:**
> `jwt.verify(token, secret)` เรียกโดยไม่ระบุ `algorithms` — library accept token ที่มี `"alg": "none"` (ไม่มี signature) ทำให้ attacker forge token ได้

**Proof of Concept:**
```javascript
// Forge token เป็น admin
const header = Buffer.from(JSON.stringify({ alg: 'none', typ: 'JWT' })).toString('base64url')
const payload = Buffer.from(JSON.stringify({ sub: 1, role: 'admin', exp: 9999999999 })).toString('base64url')
const fake = `${header}.${payload}.`
// curl -H "Authorization: Bearer $fake" → admin access
```

**Impact:** Full admin takeover, ทำได้ทุก action ที่ admin ทำ

**Vulnerable Code:**
```javascript
// middleware/auth.js:12
const decoded = jwt.verify(token, process.env.JWT_SECRET)
```

**Remediation:**
```javascript
const decoded = jwt.verify(token, process.env.JWT_SECRET, {
  algorithms: ['HS256'],   // explicit allowlist
  issuer: 'shopmate.com',
  audience: 'shopmate-api',
  maxAge: '15m',
})
```

---

## High Findings

### F-003: Password hash ใช้ MD5
- **Location:** `services/auth.js:45`
- **Fix:** Migrate ไป bcrypt (cost 12) — `bcrypt.hash(password, 12)`. ต้อง rehash ตอน user login ครั้งถัดไป

### F-004: ไม่มี rate limit บน /api/login
- **Location:** `routes/auth.js`
- **Fix:** `express-rate-limit` 5 req/15min per IP + lock account 30 นาทีหลัง fail 5 ครั้ง

### F-005: Refresh token ไม่ rotate
- **Fix:** ทุกครั้งที่ใช้ refresh — issue refresh ใหม่ + revoke old (Redis blacklist)

---

## Medium / Low Findings

- **F-006** (Medium): Missing `helmet` middleware — `app.use(helmet())` ครอบ HSTS, X-Frame, CSP
- **F-007** (Medium): CORS `*` กับ `credentials: true` — เปลี่ยนเป็น whitelist domain
- **F-008** (Medium): Error response leak `stack trace` ใน production — ตั้ง `NODE_ENV=production`
- **F-009** (Medium): Webhook (Stripe) ไม่ verify signature — ใช้ `stripe.webhooks.constructEvent`
- **F-010** (Low): SSH password auth ยังเปิด — disable + key only
- **F-011** (Low): `npm audit` พบ 8 vuln (3 high) — `npm audit fix`

---

## Defense Recommendations

### Quick wins (1 วัน)
1. F-001 + F-002 — patch ก่อน deploy ครั้งหน้า
2. Helmet + rate limit + CORS whitelist
3. Remove stack trace ใน production response

### Medium term (1 เดือน)
1. Migrate password hashing MD5 → bcrypt
2. Refresh token rotation + Redis revoke
3. Cloudflare WAF + bot management
4. Centralized log → SIEM (Datadog / Loki)

### Long term (1 ไตรมาส)
1. PDPA compliance audit (data processing record)
2. External pentest (annual) — บริษัทใน TH ราคา ~80K-200K
3. Security training developer ทุกคน (OWASP basic)

---

## Compliance Mapping

| Control | Status |
|---------|--------|
| PDPA Section 37 (security measure) | Partial — encryption ok, access log incomplete |
| OWASP Top 10 2021 | 4/10 covered (พอใช้ได้หลัง fix critical) |

---

## Appendix

### Tools used
- Manual code review (focus: auth, query, input)
- Burp Suite community (active scan staging)
- gitleaks (no secret leak found)
- npm audit (3 high vuln in deps)

---

*Generated by /security-engineer — Claude Skill Unlock v1.1*
