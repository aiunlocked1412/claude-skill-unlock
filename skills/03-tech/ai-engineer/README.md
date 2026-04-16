# AI Engineer

> AI Integration Specialist — Integrate LLM API, RAG, fine-tuning, prompt engineering, คุมต้นทุน

## ใช้ยังไง

```
/ai-engineer
```

## ทำอะไรได้บ้าง

- เลือก model ตามงาน + คำนวณต้นทุน (Haiku/Sonnet/Opus, GPT-4o/o1, Gemini)
- Build RAG pipeline (pgvector, Pinecone, Weaviate)
- Prompt engineering + optimization (caching, few-shot, chain-of-thought)
- Fine-tuning guide (เมื่อไหร่ควรทำ vs RAG)
- Defense prompt injection
- Token economics — ลด cost 50-90% ผ่าน caching + model switching

## รองรับ

- **API:** OpenAI, Anthropic (Claude), Google Gemini, Mistral, Ollama (local)
- **Vector DB:** pgvector, Pinecone, Weaviate, Qdrant, Chroma
- **Framework:** LangChain, LlamaIndex, Vercel AI SDK, Anthropic SDK
- **Deploy:** Next.js route, FastAPI, Cloudflare Workers, Lambda

## Use cases

- เริ่ม integrate ChatGPT/Claude เข้า product
- ทำ chatbot ที่รู้ข้อมูล internal (RAG)
- Bill OpenAI พุ่ง — หาวิธีลด
- Prompt ตอบไม่ดี — ปรับ structure
- Defense prompt injection ใน production
- Migrate จาก OpenAI ไป Claude (or vice versa)

## ไฟล์ใน skill นี้

```
ai-engineer/
├── SKILL.md                # ไฟล์หลัก
├── README.md
├── templates/
│   ├── prompt-main.md      # prompt patterns + cost formula
│   └── output-template.md  # blueprint format
└── examples/
    └── example-output.md   # Thai support RAG (pgvector + Claude)
```

## ตัวอย่างผลลัพธ์

ดู [`examples/example-output.md`](./examples/example-output.md) — Thai customer support chatbot ครบ pipeline

## Tips

- บอก traffic estimate (call/day, avg tokens) — กำหนด architecture
- บอก data sensitive ไหม — ส่งผลเลือก local vs cloud
- ถ้า optimize cost ให้ส่งตัวอย่าง prompt + log usage
- บอก language ของ user — ไทย token หนักกว่า eng 2-3 เท่า

## Skills ที่ใช้คู่กัน

- `/programmer-pro` — review โค้ด integrate API
- `/database-architect` — schema สำหรับ vector DB + chat history
- `/security-engineer` — prompt injection + PII redaction
- `/devops-helper` — deploy + monitor token usage
