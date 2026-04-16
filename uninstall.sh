#!/usr/bin/env bash
# Claude Skill Unlock — Uninstaller
# ถอนการติดตั้ง 100 AI Career Skills จาก ~/.claude/skills/

set -euo pipefail

SKILL_DIR="$HOME/.claude/skills"

# รายชื่อ skills ทั้งหมด 100 ตัวใน bundle
SKILLS=(
  # 01-content-creator (11)
  "youtuber-pro" "blogger-pro" "translator-pro" "podcaster-pro" "storyteller-pro"
  "course-creator" "newsletter-writer" "ghostwriter-pro" "comic-writer"
  "game-narrative" "tiktoker-pro"

  # 02-marketing (14)
  "digital-marketer" "social-media-admin" "seo-specialist" "copywriter-pro"
  "online-seller" "influencer-marketing" "email-marketer" "affiliate-marketer"
  "brand-strategist" "pr-manager" "event-marketer" "crm-strategist"
  "sales-pro" "market-researcher"

  # 03-tech (13)
  "programmer-pro" "data-analyst-pro" "web-designer-pro" "qa-tester-pro"
  "no-code-builder" "devops-helper" "mobile-app-builder" "security-engineer"
  "ai-engineer" "database-architect" "game-dev-pro" "system-admin"
  "tech-writer"

  # 04-design (13)
  "graphic-designer-pro" "photographer-pro" "video-editor-pro" "architect-pro"
  "fashion-designer-pro" "product-designer-pro" "ux-designer" "motion-designer"
  "illustrator-pro" "3d-modeler" "interior-designer" "jewelry-designer"
  "tattoo-designer"

  # 05-business (15)
  "business-consultant" "accountant-pro" "hr-officer-pro" "customer-service-pro"
  "stock-trader-pro" "lawyer-pro" "real-estate-pro" "financial-planner"
  "insurance-advisor" "crypto-trader" "supply-chain-mgr" "procurement-pro"
  "auditor-pro" "restaurant-mgr" "ecommerce-mgr"

  # 06-education-health (15)
  "teacher-pro" "coach-pro" "nutritionist-pro" "fitness-trainer-pro"
  "doctor-helper" "psychologist-helper" "researcher-pro" "tutor-pro"
  "language-teacher" "dentist-helper" "pharmacist-helper" "veterinarian-helper"
  "yoga-instructor" "meditation-coach" "mental-wellness"

  # 07-lifestyle (7)
  "personal-finance" "resume-builder" "interview-coach" "relationship-coach"
  "parenting-pro" "wedding-planner" "travel-planner"

  # 08-hospitality (5)
  "restaurant-owner" "hotel-concierge" "tour-guide-pro" "salon-owner"
  "florist-pro"

  # 09-productivity (7)
  "meeting-notetaker" "email-manager" "notion-builder" "project-manager-pro"
  "async-communicator" "executive-assistant" "presentation-designer"
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
