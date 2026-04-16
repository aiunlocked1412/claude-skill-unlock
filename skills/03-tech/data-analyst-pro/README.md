# Data Analyst Pro

> AI Data Analyst — SQL + Insight + Dashboard — แปลงตัวเลขเป็น action

## ใช้ยังไง

```
/data-analyst-pro
```

## ทำอะไรได้บ้าง

- เขียน SQL optimized (PostgreSQL, MySQL, BigQuery, Snowflake)
- Optimize query ช้า → เร็ว
- วิเคราะห์ insight จาก data (finding + so-what + action)
- ออกแบบ Dashboard spec (layout + chart type + filter)
- Funnel analysis (หาจุดที่ผู้ใช้หาย)
- Cohort / Retention analysis
- AOV / LTV / Churn calculation

## Use cases

- วิเคราะห์ยอดขาย e-commerce
- หาสาเหตุ user churn
- ออกแบบ dashboard สำหรับ CEO / CMO
- Optimize query ที่ทำ dashboard ช้า
- Cohort retention analysis (SaaS)
- A/B test result analysis

## ไฟล์ใน skill นี้

```
data-analyst-pro/
├── SKILL.md
├── README.md
├── templates/
│   ├── prompt-main.md       # SQL best practices + insight framework
│   └── output-template.md
└── examples/
    └── example-output.md    # E-commerce 6 เดือน + churn + funnel
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — วิเคราะห์ยอดขาย e-commerce 6 เดือน พร้อม funnel drop-off

## Tips

- แปะ schema (CREATE TABLE) มาด้วย → query แม่นขึ้น
- บอก database engine (Postgres/MySQL/BQ) ให้ชัด — syntax ต่างกัน
- บอกคำถามธุรกิจจริง ไม่ใช่แค่ "select ข้อมูลนี้" — AI จะแนะนำ insight ได้

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — เขียนโค้ดเชื่อม database
- `/web-designer-pro` — ออกแบบหน้า dashboard
- `/devops-helper` — ตั้ง cron + pipeline ETL
