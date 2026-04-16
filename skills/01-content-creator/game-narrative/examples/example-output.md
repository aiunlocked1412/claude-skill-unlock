---
type: game-quest
game_title: เมืองที่ลืม
genre: action RPG / mystery / dark fantasy
platform: PC + console
created: 2026-04-16
status: draft
---

# 🎮 เมืองที่ลืม — Side Quest: "หาแมวที่หายไป"

## 📊 Metadata
- **Type:** Side quest (Discovery / Investigation)
- **Length estimate:** 35-45 นาที
- **Acts:** 5
- **Branches:** 4 endings (Mercy / Justice / Profit / Burn)
- **Required:** Chapter 2 + พบ "เมืองเก่า Ashvern"

---

## 🎯 Premise / Hook

หญิงชราในเมืองเก่า Ashvern จ้าง player หาแมวสีดำชื่อ "Mira" ที่หายไป 3 วัน — ฟังดูเหมือน fetch quest ทั่วไป แต่จริงๆ แมวคือร่างของลูกสาวเธอที่โดน sealed ไว้เพื่อปกปิดความจริงเรื่องสามีที่ตาย

---

## 📋 Quest Spec (5 Acts)

### Act 1: Hook (5 นาที)

**Trigger:** Player เดินผ่านตลาดกลางเมือง Ashvern ได้ยินเสียงร้องไห้

**Quest giver:** หญิงชรา "ยาย Sela" — นั่งหน้าบ้านเล็กๆ มี poster หาแมว

**Initial dialogue:**
> **Sela:** "ลูกข้า... ขอโทษ Mira ของข้า แมวสีดำตาเขียว มันหายมา 3 วันแล้ว ใครพาคืนมาให้ ข้าจ่ายให้ 50 เหรียญ"

Player ตกลงรับ → เข้า log "หา Mira (แมวยาย Sela)"

### Act 2: Setup (10-15 นาที)

**Objective:** สำรวจเมือง Ashvern หาแมว

**Obstacles:**
- คุยกับชาวเมือง 5 คน — ได้ clue conflicting:
  - **Baker:** "แมวดำ? เห็นวิ่งไปทาง well โบราณ"
  - **Drunk:** "ยาย Sela ไม่มีแมวหรอก เธออยู่คนเดียวมา 20 ปี"
  - **Child:** "ผมเห็นยาย Sela คุยกับแมวเหมือนคุยกับคน"
  - **Merchant:** "ปีก่อนก็มีคนมาถามหาแมวยาย Sela ที่หาย"
  - **Priest:** "อย่ายุ่งกับยาย Sela... อดีตเธอ... อย่าถาม"

**NPCs encountered:** 5 ขั้นต้น

### Act 3: Twist (10 นาที)

**Recontextualization:** ที่ well โบราณ player พบ:
- แมวจริง (ไม่ใช่ Mira — แค่แมวจรปกติ)
- Hidden journal ของ "Aldric" (สามีของ Sela)
- Journal เผยว่า: 20 ปีก่อน Sela ใช้ ritual "Soul Anchor" sealing วิญญาณลูกสาวที่ตาย (เด็กผู้หญิงชื่อ Mira) ในร่างแมว เพื่อให้รู้สึกว่ายัง "อยู่"
- แต่ ritual กำลังจะสลายลง — Sela ต้องหา "host ใหม่" (แมวอีกตัว) หรือปล่อย Mira ไป

**New choice เพิ่งเปิด:**
- จะเอา journal ไปบอก Sela?
- จะเงียบและบอกว่าหาไม่เจอ?
- จะเอา journal ไปบอก Priest?
- จะใช้ข้อมูลนี้ blackmail Sela?

### Act 4: Climax (10 นาที)

**Decision point:**

#### Choice A: "Mercy" — ช่วย Sela หา host ใหม่
Player หาแมวจรในเมืองมาให้ Sela ทำ ritual ต่อ
- Sela: "ขอบใจ... Mira จะอยู่กับข้าต่อไป..."
- Reward: 50 เหรียญ + amulet "Soul Anchor minor"
- Hidden ทำไป Sela จะตายในเสียงเงียบใน 6 เดือน (เผย epilogue)

#### Choice B: "Justice" — ปล่อย Mira ไป
Player คุยกับ Sela ตรงๆ ว่าถึงเวลาปล่อย
- Sela ร้องไห้แต่ยอม
- Ritual breaking — Mira (แมว) ไป peacefully
- Reward: 30 เหรียญ + "Memento of Mira" (consumable: heal +mood)
- Sela จะดีขึ้น มี dialogue ใหม่ใน chapter 4

#### Choice C: "Profit" — Blackmail Sela
Player ขู่ว่าจะบอก Priest ถ้าไม่จ่ายเพิ่ม
- Sela: "เอาเงินไป... แต่ขอเก็บลูกข้าไว้..."
- Reward: 200 เหรียญ + Item "Sela's wedding ring"
- Faction reputation Ashvern -30
- Companion Lyra (good aligned): trust -50, may leave party
- Future quest "Ashvern Trial" เปิด — player เป็นจำเลย

#### Choice D: "Burn" — บอก Priest, จุดไฟเผา ritual
Player เอา journal ไปให้ Priest, Priest ทำ exorcism
- Sela ฟ้าผ่าหัวใจวายตายในตอน ritual
- Reward: 100 เหรียญจาก church + faction Church +20
- Faction Ashvern -50 (ชาวบ้านเกลียด)
- Hidden item: "Mira's Spirit Lantern" (rare crafting)
- ปลด Easter egg: Mira's spirit follows player ที่ certain locations

### Act 5: Resolution

| Choice | Sela | Mira | Ashvern Rep | Long-term |
|--------|------|------|-------------|-----------|
| A: Mercy | Lives 6mo, dies peacefully | Continues sealed | -10 (someone notices) | Soul Anchor amulet |
| B: Justice | Heals emotionally | Free spirit | +20 | Reactive dialogue ch.4 |
| C: Profit | Lives, broken | Continues sealed | -30 | Ashvern Trial quest |
| D: Burn | Dies in ritual | Released | -50, Church +20 | Spirit Lantern + Easter egg |

---

## 💬 Key Dialogue Trees

### [SELA_GREETING]
**SPEAKER:** Sela
**DIRECTION:** Soft, hopeful
**LINE:** "ลูกข้า... ขอโทษ Mira ของข้า แมวสีดำตาเขียว มันหายมา 3 วันแล้ว ใครพาคืนมาให้ ข้าจ่ายให้ 50 เหรียญ"

**PLAYER OPTIONS:**
- [A] "ฉันจะหาให้ครับ/ค่ะ" → goto [QUEST_ACCEPTED]
- [B] "เล่าเรื่อง Mira ให้ฟังหน่อย" → goto [SELA_BACKGROUND]
- [C] "50 เหรียญน้อยไป — 100 ดีกว่า" (check: persuasion > 30)
       success → goto [QUEST_ACCEPTED] sets reward = 100
       fail → goto [SELA_REJECTS]
- [LEAVE] → end conversation

### [PRIEST_HINT]
**SPEAKER:** Priest Aldric
**DIRECTION:** Worried, looks away
**LINE:** "อย่ายุ่งกับยาย Sela... อดีตเธอ... อย่าถาม"

**PLAYER OPTIONS:**
- [A] "ทำไม? เกิดอะไรกับเธอ?" → goto [PRIEST_DEFLECT]
- [B] "ฉันรู้แล้วว่าเธอทำ ritual" (requires: found_journal)
       → goto [PRIEST_REVEAL_TRUTH]
- [C] "ขอบคุณ ลืมที่ผมถามครับ" → end (mark: priest_hint_received)
- [LEAVE] → end

### [SELA_CONFRONT] (Act 4 — heart of quest)
**SPEAKER:** Sela
**DIRECTION:** Trembling, eyes welling
**LINE:** "เจ้า... อ่าน journal ของ Aldric แล้วใช่ไหม"

**PLAYER OPTIONS:**
- [A] "ผมจะหาแมวใหม่ให้ — ไม่ต้องกังวล" → goto [ENDING_MERCY]
       sets: choice_q_cat_ending = "mercy"
       
- [B] "ถึงเวลาแล้ว ปล่อย Mira ไปเถอะ" → goto [ENDING_JUSTICE]
       sets: choice_q_cat_ending = "justice", relationship_lyra +20
       
- [C] "จ่ายเพิ่มอีก 200 — ผมจะเงียบ" (check: intimidation > 50)
       success → [ENDING_PROFIT]
       fail → [SELA_RESISTS] then [ENDING_FORCED_PROFIT]
       sets: choice_q_cat_ending = "profit", faction_ashvern -30
       
- [D] "ผมจะไปบอก Priest" → goto [ENDING_BURN]
       sets: choice_q_cat_ending = "burn", Sela.alive = false

---

## 🌍 World State Changes

**All endings set:**
- quest_cat_sela_state = complete
- choice_q_cat_ending = <mercy / justice / profit / burn>

**Mercy:**
- relationship_sela = N/A (dies in 6mo)
- inventory_soul_anchor_amulet = true
- world_flag_ashvern_secret_kept = true

**Justice:**
- relationship_sela = +50
- relationship_lyra +20
- faction_ashvern_rep +20
- inventory_memento_mira = true
- unlocks: "Sela's recovery" sub-quest in ch.4

**Profit:**
- relationship_sela = -100 (hostile)
- relationship_lyra -50 (may leave party)
- faction_ashvern_rep -30
- inventory_sela_wedding_ring = true (1000g)
- unlocks: "Ashvern Trial" quest (player as defendant)

**Burn:**
- Sela.alive = false
- faction_ashvern_rep -50
- faction_church_rep +20
- inventory_spirit_lantern = true (rare crafting)
- world_flag_mira_spirit_unleashed = true
- Easter egg: Mira's spirit appears at 3 specific locations later

---

## 🏞️ Environmental Storytelling Notes

**Location: Sela's house**

**Visual elements:**
- Single bedroom: cat bed สำหรับเด็กไม่ใช่แมว (เตียงสีฟ้า มี doll ของเด็กผู้หญิง)
- Photo on dresser: Sela + ผู้ชาย + เด็กผู้หญิง — มีรอยพับซ่อน
- Bowl อาหารแมว สะอาดเกินไป (ถ้า player observation > 30 → notice)
- Cellar locked — opened by Aldric's key (found near well)

**Cellar contents:**
- Old ritual circle (faded)
- Aldric's journal (key item)
- 6 small graves marked "Mira" (previous host cats)
- Wall scratch marks (cats trying to escape)

**Audio cues:**
- Sela's house: faint mewing in distance (no cat visible)
- Cellar: drip + occasional sob (ambiance)
- Outside well: wind through cracks like crying

---

## 🎁 Rewards

| Choice | Material | Narrative | Mechanical |
|--------|----------|-----------|------------|
| Mercy | 50g + Soul Anchor amulet | Lore: ritual mechanics | Amulet: +5% magic resist |
| Justice | 30g + Memento of Mira | Lore: letting go | Consumable: heal mood debuff |
| Profit | 200-1000g + ring | Lore: corruption price | Ring sells 1000g, equip +charisma |
| Burn | 100g + Spirit Lantern | Lore: church power | Crafting: rare lantern recipe |

---

## 🔁 Reactive Callbacks (Future Quests)

**Chapter 4 — "Ashvern Festival":**
- ถ้า Mercy: Sela ปรากฏที่ festival ดูเหงา (last appearance)
- ถ้า Justice: Sela ทำขนมแจกเด็ก (healing arc)
- ถ้า Profit: Player เผชิญ trial (faction Ashvern จับตัว)
- ถ้า Burn: Festival ถูกยกเลิก เพราะ "haunted by spirit"

**Companion Lyra:**
- ถ้า Profit: Lyra แจ้ง player "ฉันคิดว่าเรา... ต่างกันมากนัก" (warning)
- ถ้า Burn ครั้งที่ 2 ใน chapter ถัดไป: Lyra leaves party permanently

---

## 📝 Voice / Localization Notes

- **Sela:** elderly, soft Thai dialect (อีสานหรือเหนือ — ตามทีม), occasional pause as if remembering
- **Priest:** formal Thai, religious vocabulary
- **Pun / idiom:** "ลูกข้า" — translate carefully (literally "my child" but used for cat-as-daughter)
- **Sensitive topics:**
  - Loss of child (mother grief)
  - Necromancy / forbidden ritual
  - Domestic violence (subtle in journal — Aldric was abusive)
- **Audio file naming:** `q_cat_sela_<node_id>_<emotion>.wav`

---

## ⚠️ Content Warnings

- [x] Violence (low — implied in journal)
- [x] Mature themes (death of child, necromancy, domestic abuse implied)
- [ ] Sexual content (none)
- [x] Religious content (church exorcism, soul ritual)
- [ ] Self-harm (none)

**Recommended:** Add content warning at quest start screen — "เนื้อหาเรื่องนี้พูดถึงการสูญเสียลูกและพิธีกรรมต้องห้าม"

---

*Generated by /game-narrative — Claude Skill Unlock v1.1.0*
