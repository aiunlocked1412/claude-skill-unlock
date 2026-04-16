# Programmer Pro

> AI Senior Developer — review โค้ด debug refactor อธิบาย รองรับทุกภาษา

## ใช้ยังไง

```
/programmer-pro
```

## ทำอะไรได้บ้าง

- Code review 6 มิติ (correctness, security, performance, maintainability, testability, best practices)
- Debug error + หา root cause
- Refactor โค้ดเก่าให้อ่านง่าย maintainable
- อธิบายโค้ดทีละบรรทัดสำหรับมือใหม่
- เขียน unit test ให้
- Optimize performance (SQL, React, algorithm)

## รองรับภาษา

JavaScript, TypeScript, Python, Go, Rust, Java, C#, PHP, Ruby, Swift, Kotlin, SQL, Shell script และอื่นๆ

## Use cases

- Review PR ก่อน merge
- Debug error ที่ติดนาน
- Migrate โค้ดจาก callback เป็น async/await
- หา N+1 query ในโค้ด backend
- Audit security ของ endpoint สำคัญ
- เรียนภาษาใหม่ — ขอให้ explain โค้ด open source

## ไฟล์ใน skill นี้

```
programmer-pro/
├── SKILL.md                 # ไฟล์หลัก (Claude อ่าน)
├── README.md                # คุณกำลังอ่านอยู่
├── templates/
│   ├── prompt-main.md       # review checklist
│   └── output-template.md   # format รายงาน
└── examples/
    └── example-output.md    # ตัวอย่าง review React infinite loop
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — review React component ที่มี useEffect infinite loop

## Tips

- วางโค้ดทั้งไฟล์ดีกว่าแค่ snippet — AI เห็น context ครบ
- บอก framework + version เพื่อคำแนะนำที่แม่น
- Debug error → paste stack trace เต็มๆ อย่าตัด

## Skills ที่ใช้คู่กัน

- `/qa-tester-pro` — เขียน test case ให้โค้ดใหม่
- `/devops-helper` — ขึ้น CI/CD หลัง refactor เสร็จ
- `/data-analyst-pro` — optimize SQL query ในโค้ด
