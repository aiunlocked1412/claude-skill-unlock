# Prompt Formula — Notion Builder

## Template เก็บ context

```
ผู้ใช้: <solo / team X คน / company X คน>
อาชีพ/อุตสาหกรรม: <dev / marketing / agency / consultant / content>
Tools ปัจจุบัน: <Asana / Trello / Slack / Linear / ...>
Pain point: <ข้อมูลกระจาย / ทำซ้ำ / หาไม่เจอ / no version control>
Skill level: <beginner / intermediate / advanced>
Budget: <free / personal $10/เดือน / team $20/user/เดือน>
Integration ที่ต้องการ: <Slack / Gmail / Calendly / GitHub>
```

## PARA Schema Recipe

```
📁 Projects (มี deadline + outcome)
  Properties: Name, Status, Due, Priority, Area (relation), Tasks (relation), Notes
  Views: Active / Upcoming / Completed

🎯 Areas (ความรับผิดชอบต่อเนื่อง)
  Properties: Name, Owner, Health 🟢🟡🔴, Projects (relation)
  Views: All / By Health

📚 Resources (reference)
  Properties: Name, Type, Topic (multi-select), URL, Source, Read?
  Views: To Read / Read / By Topic

🗄️ Archives (สิ่งที่จบ)
  Auto-archive: Project ที่ Status = Done > 30 วัน
```

## Team Database Recipe

```
1. Projects DB
   - Name, Status, Owner, Start, Due, OKR (relation), Tasks (rollup count)
   
2. Tasks DB
   - Name, Status, Assignee, Project (relation), Sprint (relation), Due, Priority

3. Sprints DB
   - Name, Start, End, Goal, Tasks (rollup), Velocity (formula)

4. OKRs DB
   - Objective, Quarter, Owner, Key Results (text), Progress % (rollup from projects)

5. Meetings DB
   - Name, Date, Attendees (people), Agenda, Decisions, Action Items (relation to Tasks)

6. People DB
   - Name, Role, Team, Manager, Start, OKRs (relation)

7. Wiki DB
   - Title, Tags, Owner, Last Reviewed, Status (current/outdated)
```

## Relation Patterns

```
Pattern: Project ↔ Tasks (1-to-many)
- Project.Tasks (Relation) → auto creates Tasks.Project
- Project.Completed % = Rollup(Tasks where Status=Done) / Rollup(Tasks total)
- Project.Health = Formula: if completed% < 50 and due near → 🔴

Pattern: OKR ↔ Projects ↔ Tasks (3-level rollup)
- OKR.Projects (Relation)
- OKR.Progress = Rollup(Project.Completed %).avg()

Pattern: Meeting → Action Items
- Meetings.Action Items (Relation to Tasks)
- Filter Tasks: "From Meeting = This week's standup"

Pattern: Sprint Burndown
- Sprint.Total Hours = Rollup(Tasks.Estimated Hours).sum()
- Sprint.Done Hours = Rollup(Tasks where Status=Done).Hours.sum()
- Sprint.Burndown % = Done/Total * 100
```

## View Recipes

```
View: My This Week
- Filter: Assignee = me AND Due ≤ today + 7 days AND Status ≠ Done
- Sort: Priority desc, Due asc

View: Overdue
- Filter: Due < today AND Status ≠ Done
- Group: Owner

View: Sprint Board
- Type: Board
- Group: Status (To Do / In Progress / Review / Done)
- Filter: Sprint = current

View: Calendar
- Type: Calendar
- Property: Due Date
- Filter: Owner = me
```

## Automation Recipes

```
Native Notion:
- When Status changes to Done → set Completed Date = today
- When created → set Status = Not started
- When Due is past → set Priority = P0

Via Zapier/Make:
- Gmail star ⭐ → create Notion Task (Assignee = me, Status = To Do)
- Calendly booking → create Meeting page (auto-fill attendees)
- Loom recording finished → create Doc with embed
- Linear ticket created → mirror to Notion Task

Via Notion AI:
- Summarize meeting notes → save as page property "Summary"
- Translate doc → ภาษาไทย
- Suggest tags from content
```

## Tips

- **Start small** — 3-5 databases first, expand later
- **Names matter** — singular for entity (Project not Projects in URL)
- **Templates within database** — สร้าง template button สำหรับ entry ที่ใช้บ่อย
- **Sync block** — share content ข้าม page (ไม่ copy-paste)
- **Backup monthly** — Settings → Export → ZIP

## Limitation ที่ต้องรู้

- **5,000 rows** = query ช้า
- **API rate** = 3 req/sec
- **Formula** ซับซ้อนเกิน 5 บรรทัด → switch to Airtable/SQL
- **Sync delay** ของ relation อาจช้า 5-30 วินาที
