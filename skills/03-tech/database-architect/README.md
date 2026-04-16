# Database Architect

> AI DBA — ออกแบบ schema, indexing, optimize query, migration safety สำหรับ Postgres/MySQL/MongoDB

## ใช้ยังไง

```
/database-architect
```

## ทำอะไรได้บ้าง

- ออกแบบ schema ใหม่ (normalize → table → constraint)
- Index audit + recommend (B-tree, GIN, GiST, BRIN)
- EXPLAIN ANALYZE — debug slow query
- Migration plan zero-downtime (add/drop/rename column)
- Choose database — SQL vs NoSQL vs hybrid
- Connection pool tuning + replication strategy

## รองรับ

- **Relational:** PostgreSQL, MySQL, SQLite, SQL Server
- **NoSQL:** MongoDB, Redis, DynamoDB
- **Vector:** pgvector, Pinecone
- **Tools:** Prisma, Drizzle, TypeORM, Knex, Alembic, Flyway

## Use cases

- เริ่ม project ใหม่ — ออกแบบ schema ตั้งแต่เริ่ม
- Query ช้า 5+ วินาที — หาว่าทำไม
- Table ใหญ่ขึ้น 10M+ rows — ต้อง index ใหม่
- Migration ที่ rename column ตอน production
- เลือก SQL vs NoSQL สำหรับ feature ใหม่
- Plan migration จาก MySQL ไป Postgres

## ไฟล์ใน skill นี้

```
database-architect/
├── SKILL.md                # ไฟล์หลัก
├── README.md
├── templates/
│   ├── prompt-main.md      # schema + index decision matrix
│   └── output-template.md  # blueprint format
└── examples/
    └── example-output.md   # e-commerce schema + index plan
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — e-commerce schema (users, products, orders) + index strategy

## Tips

- ส่ง schema ปัจจุบัน + sample query ที่ช้า
- ส่งผล `EXPLAIN ANALYZE` (กับ BUFFERS option) ให้ดู
- บอก traffic pattern (read-heavy, write-heavy, mixed)
- บอก row count ตอนนี้ + 1 ปีข้างหน้า

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — review query / ORM usage ใน code
- `/data-analyst-pro` — analyze query log สำหรับ pattern
- `/devops-helper` — backup + replication setup
- `/security-engineer` — RLS + parameterized query audit
