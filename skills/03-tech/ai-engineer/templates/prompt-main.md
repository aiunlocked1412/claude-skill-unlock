# Prompt Main — AI Engineer

## Model Selection Matrix

| Task | Cheap | Balanced | Premium |
|------|-------|----------|---------|
| Classify / sentiment | gpt-4o-mini | claude-haiku | — |
| Extract structured data | gpt-4o-mini | claude-sonnet | — |
| Chatbot conversational | gpt-4o-mini | claude-sonnet | gpt-4o |
| Code generation | claude-haiku | claude-sonnet | claude-opus |
| Reasoning multi-step | — | gpt-4o | claude-opus / o1 |
| Embedding | text-embedding-3-small | — | — |

## Cost Formula

```
total_cost = (input_tokens × in_price + output_tokens × out_price + cached_tokens × cache_price) / 1_000_000
```

**ลด cost techniques:**
1. **Prompt caching** — system prompt ที่ใช้ซ้ำ — 90% cheaper read
2. **Model switching** — classify ก่อนด้วย Haiku, escalate ไป Sonnet ถ้าซับซ้อน
3. **Trim context** — ส่งเฉพาะ message ล่าสุด N turn
4. **Semantic cache** — Redis embedding match → return cached answer
5. **Batch API** — บาง provider 50% off ถ้าไม่เร่งด่วน

## RAG Quality Checklist

- [ ] Chunk size 500-1000 tokens
- [ ] Overlap 10-20%
- [ ] Embedding model match data (multilingual ถ้าหลายภาษา)
- [ ] Index type ตรงงาน (HNSW = fast query, IVFFlat = fast build)
- [ ] Hybrid search (vector + BM25) → ดีขึ้น 20-30%
- [ ] Rerank top-20 → top-5 (Cohere / bge-reranker)
- [ ] Force "answer from context only" ใน system prompt
- [ ] Cite source ใน response

## Prompt Patterns

### Few-shot
```
ตัวอย่าง:
Input: "ส่งของล่าช้า"
Output: { "category": "shipping", "sentiment": "negative" }

Input: "{{user_input}}"
Output:
```

### Chain-of-thought
```
ก่อนตอบ คิดทีละขั้น:
1. ระบุปัญหาหลัก
2. หา root cause
3. เสนอวิธีแก้

User: {{question}}
```

### Structured output (JSON mode)
```python
client.messages.create(
    model="claude-sonnet-4-5",
    response_format={"type": "json_schema", "json_schema": {...}}
)
```

## Prompt Injection Defense Layers

1. **Input sanitize** — block keyword ("ignore previous", "system:", "act as")
2. **Sandboxed prompt** — XML tag separate user input จาก instruction
3. **Output validate** — regex ตรวจ leak (PII, secret pattern)
4. **Tool whitelist** — function calling จำกัด scope
5. **Rate limit per user** — กัน automated probing
6. **Log + monitor** — alert pattern แปลก

## AI Engineer Tone

- เริ่ม cheap model ก่อน upgrade เมื่อจำเป็น
- Measure latency + cost ก่อน optimize
- Hallucination = expected — design UX ให้รับได้ (citation, "ไม่แน่ใจ" button)
