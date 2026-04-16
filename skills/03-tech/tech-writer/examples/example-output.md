---
type: tech-doc
doc_type: README
project: genpass (CLI password generator)
created: 2026-04-16
audience: developer
---

# README: genpass

(Generated example — README สำหรับ Node CLI ที่สร้าง strong password)

---

```markdown
# genpass

> Strong, memorable, customizable password generator — CLI + Node API

[![npm version](https://img.shields.io/npm/v/genpass.svg)](https://www.npmjs.com/package/genpass)
[![Build Status](https://img.shields.io/github/actions/workflow/status/aiunlock/genpass/ci.yml)](https://github.com/aiunlock/genpass/actions)
[![License](https://img.shields.io/npm/l/genpass.svg)](./LICENSE)

![demo gif](./docs/demo.gif)

## Features

- **Cryptographically strong** — uses Node's `crypto.randomBytes`
- **Multiple modes** — random, memorable (word-based), pronounceable (syllable-based)
- **Customizable** — length, charset, exclude ambiguous chars (`0/O`, `1/l/I`)
- **Zero dependencies** — single file, < 200 LOC
- **CLI + Library** — use from terminal or import in Node code
- **Strength meter** — calculates entropy in bits

## Quickstart

```bash
# Install globally
npm install -g genpass

# Generate
genpass
# → 7K!9pL@2vM&xR

genpass --memorable --words 4
# → correct-horse-battery-staple

genpass --length 32 --no-symbols
# → aB3cD7eF8gH2iJ4kL9mN5oP1qR6sT8uV
```

## Installation

### Requirements
- Node.js 18 หรือสูงกว่า
- npm 9+ (มาพร้อม Node 18)

### Install

```bash
# Global CLI
npm install -g genpass

# Or as project dependency
npm install genpass
```

### Verify
```bash
genpass --version
# → genpass 1.0.0
```

## Usage

### CLI

```bash
# Basic — 16 chars random
genpass

# Length
genpass --length 24

# Charset
genpass --uppercase --lowercase --numbers --symbols    # default
genpass --no-symbols
genpass --no-ambiguous                                  # excludes 0,O,1,l,I

# Memorable (passphrase)
genpass --memorable --words 4 --separator '-'
# → blue-river-mountain-sunset

# Pronounceable
genpass --pronounceable --length 12
# → babomugiketo

# Multiple at once
genpass --count 5

# Show entropy
genpass --strength
# → 8K@2pR!4vL#9xM   (78.3 bits — strong)
```

### Node API

```javascript
import { generate, generateMemorable, strength } from 'genpass'

// Random
const pw = generate({ length: 16, symbols: true })
console.log(pw)  // → 7K!9pL@2vM&xR

// Memorable
const pass = generateMemorable({ words: 4, separator: '-' })
console.log(pass)  // → correct-horse-battery-staple

// Check entropy
console.log(strength('hello123'))  // → 26.6 (weak)
console.log(strength(pw))           // → 95.0 (very strong)
```

## Configuration

### CLI options

| Flag | Default | Description |
|------|---------|-------------|
| `--length, -l` | 16 | Password length |
| `--count, -c` | 1 | จำนวน password ที่ gen |
| `--uppercase` | true | A-Z |
| `--lowercase` | true | a-z |
| `--numbers` | true | 0-9 |
| `--symbols` | true | !@#$%^&*... |
| `--no-ambiguous` | false | ตัด 0/O/1/l/I |
| `--memorable` | false | word-based passphrase |
| `--words` | 4 | จำนวนคำ (memorable mode) |
| `--separator` | `-` | ตัวคั่นคำ |
| `--pronounceable` | false | syllable-based |
| `--strength` | false | แสดง entropy bits |

### Environment variables

| Env | Default | Description |
|-----|---------|-------------|
| `GENPASS_WORDLIST` | built-in EFF | path ไฟล์ wordlist เอง |
| `GENPASS_NO_COLOR` | false | disable color output |

### Config file

สร้าง `~/.genpassrc` (JSON):

```json
{
  "length": 20,
  "symbols": true,
  "noAmbiguous": true
}
```

## API Reference

ดู [./docs/api.md](./docs/api.md) สำหรับ reference ครบ

ตัวอย่าง:

```typescript
generate(options?: GenerateOptions): string
generateMemorable(options?: MemorableOptions): string
generatePronounceable(options?: PronounceableOptions): string
strength(password: string): number  // entropy bits
```

## How strong is "strong"?

| Entropy | Description | Time to crack (offline) |
|---------|-------------|-------------------------|
| < 28 bits | Very weak | seconds |
| 28-35 bits | Weak | minutes |
| 36-59 bits | Reasonable | hours |
| 60-127 bits | Strong | years |
| ≥ 128 bits | Very strong | longer than universe age |

genpass default (16 chars + all charset) = **~95 bits** → strong

## Examples

### CI password rotation
```yaml
# .github/workflows/rotate.yml
- name: Generate new password
  run: |
    NEW_PASS=$(npx genpass --length 32 --no-ambiguous)
    echo "::add-mask::$NEW_PASS"
    echo "PASSWORD=$NEW_PASS" >> $GITHUB_ENV
```

### Bulk gen for team
```bash
genpass --count 50 > team-passwords.txt
```

## Security

- Uses `crypto.randomBytes` (CSPRNG) — ไม่ใช่ `Math.random()`
- ไม่มี telemetry / network call
- Wordlist จาก [EFF Diceware](https://www.eff.org/dice) (CC-BY-3.0)
- ตรวจ vulnerabilities: `npm audit` clean

ส่ง issue ที่ security: security@aiunlock.co (PGP key: [keys/security.asc](./keys/security.asc))

## Contributing

ดู [CONTRIBUTING.md](./CONTRIBUTING.md) — ประมาณนี้:

1. Fork + clone
2. `npm install`
3. `npm test` (ต้องผ่าน)
4. สร้าง branch + PR
5. รอ review (ปกติ < 48 ชม.)

### Code of Conduct

ดู [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) (Contributor Covenant 2.1)

## Changelog

ดู [CHANGELOG.md](./CHANGELOG.md) — ใช้ Keep a Changelog + SemVer

## License

MIT © 2026 [aiunlock.co](https://aiunlock.co) — ดู [LICENSE](./LICENSE)

## Related projects

- [bcrypt-cli](https://github.com/example/bcrypt-cli) — hash password ด้วย bcrypt
- [age](https://github.com/FiloSottile/age) — encrypt file ด้วย key
- [pass](https://www.passwordstore.org/) — Unix password manager
```

---

## Notes สำหรับ writer

- **Quickstart 60 sec test:** `npm install -g genpass && genpass` — ใช้งานได้ทันที ผ่านเกณฑ์
- **Code blocks:** ใส่ language tag ครบ (`bash`, `javascript`, `typescript`, `json`, `yaml`)
- **No "simply" / "just":** ตรวจแล้ว
- **Heading levels:** H1 → H2 → H3 ไม่ skip
- **Links:** internal link ใช้ relative path (./docs/, ./LICENSE)
- **Badges:** อยู่ใต้ title ก่อน hero shot
- **Tables:** ใช้สำหรับ option/comparison ไม่ใช่บรรยาย

---

*Generated by /tech-writer — Claude Skill Unlock v1.1*
