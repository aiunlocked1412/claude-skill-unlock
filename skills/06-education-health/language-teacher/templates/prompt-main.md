# Prompt Patterns สำหรับ Language Teacher

## 1. Pattern: CEFR Placement Test

```
สร้าง CEFR placement test สำหรับ <ภาษา>

ทดสอบ 4 skills:

R - Reading (5 ข้อ):
- Question 1-2: A1-A2 level (sign, simple text)
- Question 3-4: B1-B2 (article, opinion)
- Question 5: C1-C2 (academic / nuance)

L - Listening (script + 5 ข้อ):
- Speed/complexity ไล่ระดับ

W - Writing (1 task):
- Prompt + word count target
- Rubric ประเมิน

S - Speaking (5 prompts):
- Q1-2: A1-A2 (self introduction, daily routine)
- Q3-4: B1-B2 (opinion, hypothetical)
- Q5: C1-C2 (abstract topic)

หลังทำเสร็จ → CEFR result + แนะนำคอร์สที่เหมาะ
```

## 2. Pattern: Lesson Plan (60 นาที)

```
ออกแบบ lesson plan ตามโครง CLT:

INPUT:
- Language: <...>
- Level (CEFR): <...>
- Topic: <...>
- Lesson aim: students will be able to <...>
- Class size: <...>

STAGES:
1. Warm-up (5 min) — Lead-in / ice-breaker เกี่ยว topic
2. Presentation (10 min) — Introduce target structure/vocab
3. Controlled practice (15 min) — drill, gap-fill, matching
4. Free practice (20 min) — CLT activity (role-play, info gap)
5. Production (10 min) — output activity

ทุก stage ระบุ:
- ภาษาที่ครูใช้ (target language vs L1)
- ภาษาที่นักเรียนใช้
- Materials
- Anticipated problems + solution
- L1 interference ที่คนไทยมักผิด
```

## 3. Pattern: Role-play Conversation

```
สร้าง role-play scenario:

Setting: <restaurant / hotel / airport / interview / meeting>
Level: <CEFR>
Roles: A = <...>, B = <...>
Goal: <สื่อสารอะไร>

Pre-task:
- 10 useful chunks (must use 5)
- Cultural notes (เช่น tipping, formality)

During task:
- เริ่ม conversation — Claude เล่นบทตรงข้าม
- Adapt difficulty ตาม level

Post-task feedback:
- ✅ Good chunks used
- ⚠️ Errors (priority: communication > grammar)
- 🎯 1 specific thing to practice
```

## 4. Pattern: Error Correction (Recast Style)

```
INPUT: Text/transcript ของผู้เรียน

OUTPUT:
1. Original text
2. Corrected version (clean)
3. Top 3 errors (priority order):
   - ❌ Wrong: "..."
   - ✅ Right: "..."
   - 📖 Pattern/rule:
   - 💡 Why คนไทยมักผิด: (L1 interference)
4. Pattern practice — 5 sentences ฝึกแก้

Style: Recast = แสดงรูปที่ถูกอย่างนุ่มนวล ไม่ใช่ red pen
Tone: Encouraging — "Great attempt! Let's polish this..."
```

## 5. Pattern: Vocabulary Chunks (Lexical Approach)

```
สร้าง 50 chunks เกี่ยวกับ topic <...>

แบ่งหมวด:
- Greetings & openings (5)
- Core vocabulary (15)
- Useful phrases (15)
- Idioms / collocations (10)
- Closing / farewell (5)

แต่ละ chunk:
- ภาษาเป้าหมาย
- ภาษาไทย
- Pronunciation guide (IPA หรือ Thai approximation)
- ตัวอย่างใช้ (full sentence)
- เลเวล CEFR
- Cultural note (ถ้ามี)

หลัง list → แนะนำ practice activity
```

## 6. Pattern: Listening + Shadowing

```
สร้าง listening exercise:

INPUT:
- Level: <CEFR>
- Topic: <...>
- Length: <100-300 words>

OUTPUT:
1. Pre-listening:
   - Vocab preview (5-10 keys)
   - Context: who/where/why

2. Script (formatted for shadowing):
   "Speaker A: ...
    [pause 2s]
    Speaker B: ..."

3. Tasks (3 listenings):
   - 1st: Gist (1 question)
   - 2nd: Detail (5 questions)
   - 3rd: Shadowing (mark stress + pause)

4. Pronunciation focus:
   - Thai-difficult sounds: <list>
   - Stress pattern: <highlight>
   - Linking: <where>
```

## 7. Pattern: Writing Feedback (3 Levels)

```
INPUT: Student's writing (essay/email/business)

OUTPUT — 3 levels of feedback:

🌐 MACRO (structure):
- Thesis / main idea: clear / unclear
- Organization: logical / disorganized
- Paragraphing: 3-5 paragraphs / 1 long block
- Suggestions

📝 MESO (paragraph):
- Topic sentences
- Transitions / cohesion
- Examples / evidence
- Suggestions

🔬 MICRO (sentence):
- Grammar errors (top 5)
- Word choice
- Punctuation
- Suggestions

📊 Score:
- Task achievement: X/9 (IELTS scale)
- Coherence & cohesion: X/9
- Lexical resource: X/9
- Grammar: X/9
- Overall: X/9

🚀 Revised paragraph (1 example, full rewrite)

🎯 Next: revise + resubmit
```
