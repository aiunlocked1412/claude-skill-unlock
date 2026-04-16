# Game Narrative Templates — Lore, Dialogue, Quest, Environmental

## World Lore Bible Structure

### Cosmology / History
- **Origin myth** (1 page) — โลกเกิดยังไง / เทพ / big bang แบบเกม
- **Major eras** (3-7 eras) — แต่ละ era มี theme + key events
- **Recent history** (last 50 years) — set context for game's "now"
- **Calendar / timekeeping** — important?

### Geography
- **Major regions** (3-7) — climate, culture, governance
- **Key cities + landmarks** — ทำไมสำคัญ
- **Borders + tensions** — ใครเกลียดใคร

### Factions (3-6 factions)
For each:
- Goal + ideology
- Methods (peaceful / militant / underground)
- Headquarters / territory
- Leader (NPC ที่อาจเป็น quest giver)
- Reputation system: -100 to +100
- How player can join / break with

### Magic / Tech System
- **Source** — magic จากไหน?
- **Cost / limitation** — ห้าม "magic ทำได้ทุกอย่าง"
- **Who can use** — ทุกคน / specific bloodline / training?
- **Social impact** — magic users elite / outcast / common?

### Cultures / Languages
- 3-5 cultures with distinct values
- Language flavor (place names, common phrases)
- Customs + taboos

---

## Character Arc Templates

### PC (Player Character) Setup
- **Origin** (3-5 options) — race / class / background
- **Defining trait** — what makes player choices "fit"
- **Voice** — silent / voiced / branching personality?
- **Growth dimension** — moral / power / relationship?

### NPC Quick Card

```
NAME: <ชื่อ>
ROLE: <quest giver / companion / antagonist / merchant>
AGE / RACE / GENDER: 
LOCATION: <where to find>

SURFACE: <สิ่งที่ player เห็นครั้งแรก — 1 sentence>
DEPTH: <สิ่งที่ player ค้นพบหลัง quest — 1 sentence>

GOAL: <สิ่งที่ NPC อยากได้>
FLAW: <สิ่งที่ทำให้ NPC พลาด>
SECRET: <สิ่งที่ NPC ไม่อยากให้ใครรู้>

VOICE / SPEECH PATTERN: 
- Vocab: <formal/casual/dialect>
- Pet phrase: "..."
- Pause habit: <stutter/long pause/talks fast>

ARC (if companion):
- Act 1: <surface persona>
- Act 2: <conflict / vulnerability shown>
- Act 3: <resolution — change or break>

RELATIONSHIP DIMENSION:
- Trust (0-100): start at __
- Romance flag: yes/no
- Loyalty trigger: <choice that locks loyalty>
- Break trigger: <choice that breaks alliance>
```

---

## Dialogue Tree Patterns

### Notation Standard

```
[NODE_ID]
SPEAKER: "dialogue text"
DIRECTION: <whisper/shout/sob/angry>
EMOTION FLAG: <happy/sad/neutral/angry/fearful>

PLAYER OPTIONS:
  [A] "<option text>"
       requires: <condition>
       sets: <state change>
       → goto [NODE_ID]
       
  [B] "<option text>"
       check: <skill check>
       success → [NODE_X]
       fail → [NODE_Y]
```

### Common Patterns

**Pattern 1: Investigation Tree**
```
[INTERROGATE_SUSPECT]
  ├─ [PRESS_HARD] (intimidation check)
  │    ├─ pass → suspect breaks
  │    └─ fail → suspect lawyers up (locks branch)
  ├─ [APPEAL_EMOTION] (empathy check)
  │    └─ pass → suspect confesses
  ├─ [PRESENT_EVIDENCE] (requires: found_letter)
  │    └─ → suspect contradicts self
  └─ [LEAVE]
       └─ → return later (no penalty)
```

**Pattern 2: Romance Gate**
```
[PERSONAL_TALK]
  ├─ [ASK_PAST] (requires: trust > 60)
  │    → [BACKSTORY_REVEAL]
  ├─ [FLIRT] (requires: romance_flag = true)
  │    → [ROMANCE_PROGRESS]
  ├─ [SUPPORT] 
  │    → trust +5
  └─ [DISMISS]
       → trust -10
```

**Pattern 3: Faction Loyalty Test**
```
[FACTION_CHOICE_POINT]
  - "Faction A asks you to attack Faction B's caravan"
  
  ├─ [AGREE_ATTACK]
  │    sets: faction_a_rep +30, faction_b_rep -50, faction_b_quest_chain locked
  │    
  ├─ [WARN_FACTION_B]
  │    sets: faction_b_rep +30, faction_a_rep -50, faction_a_companion leaves
  │    
  ├─ [STAGE_FAKE_ATTACK] (requires: persuasion > 70)
  │    sets: faction_a_rep +20, faction_b_rep +10 (secretly), trust skill +5
  │    
  └─ [REFUSE_BOTH]
       sets: faction_a_rep -20, opens neutral faction quest
```

---

## Quest Design Templates

### Quest Anatomy (5 Acts)

```
ACT 1: HOOK
- Player encounters quest giver / event
- Question raised
- Stakes established

ACT 2: SETUP
- Travel / preparation
- Meet supporting NPCs
- First obstacle (combat / puzzle / social)

ACT 3: COMPLICATION (TWIST)
- Information that recontextualizes everything
- New choice introduced
- Stakes raised

ACT 4: CLIMAX
- Major decision point (2-4 choices)
- Confrontation
- Test of player's stated values

ACT 5: RESOLUTION + ECHO
- Immediate reward (item, XP, $$$)
- World state changes (faction rep, NPC fate)
- Future quest unlocked or locked
- Companion reaction
```

### Quest Type Quick Reference

| Type | Hook source | Length | Branches |
|------|-------------|--------|----------|
| Main | Story progression | 60-90 min | 1-3 endings |
| Side | NPC request | 15-45 min | 2-4 endings |
| Companion | Companion's past | 30-60 min | 2-3 endings |
| Faction | Reputation tier reached | 30-45 min | 1-2 endings |
| Discovery | Exploration | 5-30 min | usually 1 ending, big lore reward |
| Repeatable | Bounty board | 10-15 min | 1 ending (procedural) |

### "Fetch Quest" Done Right
Fetch quest = bad. UNLESS:
- Object has narrative weight (memento, evidence)
- Journey > destination (drama on the way)
- Twist on delivery (giver dead / lied)
- Player choice at end (give / keep / destroy)

---

## Environmental Storytelling Recipes

### Recipe 1: "Crime Scene"
**Goal:** Player reconstructs what happened

Place:
- Body (posture tells cause of death)
- 1-2 misplaced objects (signs of struggle)
- Trail (footprints / blood / dropped item)
- 1 readable clue (note / journal entry)
- 1 contradictory element (player must notice)

### Recipe 2: "Past Glory"
**Goal:** Show fallen empire / lost civilization

Place:
- Statue (intact head, broken body)
- Mosaic / mural depicting peak era
- Weapon out of era (proves invasion)
- Modern occupant (villager living in palace ruins)
- Optional: NPC dialogue confirming theory

### Recipe 3: "Recently Abandoned"
**Goal:** Build dread — what made them leave?

Place:
- Hot food still on table
- Toys mid-play
- Door barricaded from inside (failed)
- Scratch marks on door (something broke through)
- Hidden child note ("they took mom")

### Recipe 4: "Ritual Site"
**Goal:** Hint at cult / ancient practice

Place:
- Geometric pattern on floor
- Candles in specific positions
- Sacrificial item (animal bones / specific gem)
- Robes neatly folded
- Codex page that explains pattern (reward exploration)

### Recipe 5: "Living Diorama"
**Goal:** Show ongoing event without scripted cutscene

Place:
- 2 NPCs in mid-conversation (player overhears)
- NPC repairing something (player learns lore from observation)
- Children playing game that mirrors world's history
- Festival prep (player sees culture without exposition)

---

## Codex / Lore Drop Format

### Length tiers
- **Tiny lore drop (50-100 words):** journal page, gravestone, signage
- **Small (200-400):** letter, note, in-character document
- **Medium (500-1,000):** book chapter, historical record
- **Long (1,500+):** full in-game book — for hardcore lore fans

### Voice
- ทุก codex ต้องมี **in-world author** ชัดเจน
- Voice ของ author = personality of writer (scholar / soldier / commoner)
- ห้ามเขียนเป็น 3rd person omniscient — ไม่ใช่ wiki

### Structure (for any size)
```
[Header: title, author, date, location found]

Hook (1-2 sentences) — why someone would read this

Body — content + author's bias

Closing — leaves question / connects to other lore
```

---

## State / Variable Naming Convention

```
# Prefix system:
relationship_<npc>      # 0-100, romance/loyalty
faction_<name>_rep      # -100 to 100
quest_<id>_state        # not_started / active / complete / failed
flag_<event>            # boolean (e.g., flag_killed_brother)
choice_<quest>_<step>   # enum (e.g., choice_q12_ending = "merciful")
counter_<thing>         # int (e.g., counter_deceptions)
inventory_<item>_owned  # boolean

# Example reactive dialogue check:
if relationship_lyra > 70 AND choice_q08_ending == "spared_villain":
    show: "ผู้กล้าผู้ปรานี ไลรารักคุณ"
elif choice_q08_ending == "killed_villain":
    show: "ผู้กล้าผู้ตัดสิน"
```
