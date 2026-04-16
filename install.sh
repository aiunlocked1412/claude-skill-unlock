#!/usr/bin/env bash
# Claude Skill Unlock — Installer
# ติดตั้ง 37 AI Career Skills ไปยัง ~/.claude/skills/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"
SKILL_DIR="$HOME/.claude/skills"
FORCE=false

# parse arguments
for arg in "$@"; do
  case "$arg" in
    --force|-f)
      FORCE=true
      ;;
    --help|-h)
      cat <<EOF
Claude Skill Unlock Installer

Usage:
  ./install.sh           ติดตั้ง skills (ข้าม skill ที่มีอยู่แล้ว)
  ./install.sh --force   เขียนทับ skill ที่มีอยู่แล้ว
  ./install.sh --help    แสดง help นี้

Skills จะถูกติดตั้งไปที่: ~/.claude/skills/
EOF
      exit 0
      ;;
  esac
done

# banner
echo ""
echo "╔════════════════════════════════════════════════╗"
echo "║   Claude Skill Unlock — AI Career Skills       ║"
echo "║   กำลังติดตั้ง 100 skills สำหรับ Claude Code      ║"
echo "║   🎁 แจกฟรีโดย aiunlock.co                      ║"
echo "╚════════════════════════════════════════════════╝"
echo ""

# check source directory
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "❌ ไม่พบ folder: $SOURCE_DIR"
  echo "   กรุณารัน install.sh จาก root ของ bundle"
  exit 1
fi

# check claude code is installed
if [[ ! -d "$HOME/.claude" ]]; then
  echo "⚠️  ไม่พบ ~/.claude — Claude Code ติดตั้งแล้วหรือยัง?"
  echo "   ติดตั้งที่: https://claude.com/claude-code"
  read -r -p "   ดำเนินการต่อ? (y/N) " reply
  if [[ "$reply" != "y" && "$reply" != "Y" ]]; then
    exit 1
  fi
fi

mkdir -p "$SKILL_DIR"

# install counters
INSTALLED=0
SKIPPED=0
OVERWRITTEN=0

for category_dir in "$SOURCE_DIR"/*/; do
  category_name=$(basename "$category_dir")
  echo "📂 หมวด: $category_name"

  for skill_dir in "$category_dir"*/; do
    skill_name=$(basename "$skill_dir")

    # skip if this is a README file, not a directory
    [[ ! -d "$skill_dir" ]] && continue

    target="$SKILL_DIR/$skill_name"

    if [[ -d "$target" ]]; then
      if [[ "$FORCE" == true ]]; then
        rm -rf "$target"
        cp -R "$skill_dir" "$target"
        echo "   🔄 เขียนทับ: /$skill_name"
        ((OVERWRITTEN++))
      else
        echo "   ⏭️  ข้าม: /$skill_name (มีอยู่แล้ว)"
        ((SKIPPED++))
      fi
    else
      cp -R "$skill_dir" "$target"
      echo "   ✅ ติดตั้ง: /$skill_name"
      ((INSTALLED++))
    fi
  done
done

echo ""
echo "════════════════════════════════════════════════"
echo "  📊 สรุปการติดตั้ง:"
echo "     ✅ ติดตั้งใหม่:   $INSTALLED"
echo "     🔄 เขียนทับ:     $OVERWRITTEN"
echo "     ⏭️  ข้าม:         $SKIPPED"
echo "════════════════════════════════════════════════"
echo ""
echo "🎉 เสร็จแล้ว! เปิด Claude Code แล้วพิมพ์ /<skill-name>"
echo ""
echo "💡 ลองเริ่มจาก skills เหล่านี้:"
echo "   /youtuber-pro      — สคริปต์ YouTube"
echo "   /copywriter-pro    — headline + ad copy"
echo "   /teacher-pro       — แผนการสอน"
echo "   /digital-marketer  — วางแผน campaign"
echo ""
echo "📖 คู่มือใช้งาน: $SCRIPT_DIR/docs/คู่มือใช้งาน.md"
echo "🌐 aiunlock.co  — คอมมูนิตี้ที่สร้าง bundle นี้"
echo ""

if [[ "$SKIPPED" -gt 0 ]]; then
  echo "⚠️  มี $SKIPPED skills ถูกข้าม — ใช้ './install.sh --force' เพื่อเขียนทับ"
fi
