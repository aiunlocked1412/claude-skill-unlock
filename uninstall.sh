#!/usr/bin/env bash
# Claude Skill Unlock — Uninstaller
# ถอนการติดตั้ง 37 AI Career Skills จาก ~/.claude/skills/

set -euo pipefail

SKILL_DIR="$HOME/.claude/skills"

# รายชื่อ skills ทั้งหมดใน bundle
SKILLS=(
  # 01-content-creator
  "youtuber-pro"
  "blogger-pro"
  "translator-pro"
  "podcaster-pro"
  "storyteller-pro"
  # 02-marketing
  "digital-marketer"
  "social-media-admin"
  "seo-specialist"
  "copywriter-pro"
  "online-seller"
  "influencer-marketing"
  # 03-tech
  "programmer-pro"
  "data-analyst-pro"
  "web-designer-pro"
  "qa-tester-pro"
  "no-code-builder"
  "devops-helper"
  # 04-design
  "graphic-designer-pro"
  "photographer-pro"
  "video-editor-pro"
  "architect-pro"
  "fashion-designer-pro"
  "product-designer-pro"
  # 05-business
  "business-consultant"
  "accountant-pro"
  "hr-officer-pro"
  "customer-service-pro"
  "stock-trader-pro"
  "lawyer-pro"
  "real-estate-pro"
  # 06-education-health
  "teacher-pro"
  "coach-pro"
  "nutritionist-pro"
  "fitness-trainer-pro"
  "doctor-helper"
  "psychologist-helper"
  "researcher-pro"
)

echo ""
echo "╔════════════════════════════════════════════════╗"
echo "║   Claude Skill Unlock — Uninstaller            ║"
echo "║   🎁 by aiunlock.co                             ║"
echo "╚════════════════════════════════════════════════╝"
echo ""
echo "⚠️  กำลังจะลบ skills ${#SKILLS[@]} ตัว ออกจาก:"
echo "   $SKILL_DIR"
echo ""
read -r -p "ยืนยันการลบ? (y/N) " reply
if [[ "$reply" != "y" && "$reply" != "Y" ]]; then
  echo "❌ ยกเลิก"
  exit 0
fi

REMOVED=0
NOT_FOUND=0

for skill in "${SKILLS[@]}"; do
  target="$SKILL_DIR/$skill"
  if [[ -d "$target" ]]; then
    rm -rf "$target"
    echo "   🗑️  ลบ: /$skill"
    ((REMOVED++))
  else
    ((NOT_FOUND++))
  fi
done

echo ""
echo "════════════════════════════════════════════════"
echo "  📊 สรุป:"
echo "     🗑️  ลบแล้ว:  $REMOVED"
echo "     ❓ ไม่พบ:   $NOT_FOUND"
echo "════════════════════════════════════════════════"
echo ""
echo "✅ ถอนการติดตั้งเสร็จแล้ว"
echo ""
