# ML Engineer

> AI วิศวกร Machine Learning Production — Model Deployment, MLOps Pipeline, Feature Store, Model Monitoring, A/B Testing

## ⚡ ใช้ยังไง

```
/ml-engineer
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Model Deployment (REST API, batch, streaming, edge inference)
- ✅ MLOps Pipeline ครบวงจร (training → validation → deploy → monitor → retrain)
- ✅ Feature Store Design (online + offline store, point-in-time correctness)
- ✅ Model Monitoring (data drift, prediction drift, performance degradation)
- ✅ A/B Testing Framework (traffic split, statistical significance, guard metrics)
- ✅ Model Packaging (Docker, ONNX, TorchServe, Triton, BentoML)
- ✅ Full MLOps Architecture สำหรับ team

## 💡 Use cases

- Data Scientist อยาก deploy model ออก production ครั้งแรก
- ทีม ML อยากตั้ง pipeline ที่ retrain อัตโนมัติ
- Engineer ต้องการ monitor model drift ใน credit scoring
- บริษัทอยากทำ A/B test ระหว่าง model เก่าและใหม่
- Startup ออกแบบ feature store สำหรับ recommendation system

## 📦 ไฟล์ใน skill นี้

```
ml-engineer/
├── SKILL.md      # ไฟล์หลัก (Claude อ่าน)
└── README.md     # คุณกำลังอ่านอยู่
```

## 📊 ตัวอย่างผลลัพธ์

Architecture diagram + FastAPI serving code + Docker config + monitoring dashboard spec + A/B test plan

## 🎓 Tips

- ระบุ **framework** (PyTorch/TF/sklearn) + **latency SLA** → ได้ serving stack ที่เหมาะ
- บอก **scale** (QPS) → ได้ auto-scaling strategy ที่ถูกต้อง
- ระบุ **retraining frequency** → ได้ trigger strategy และ pipeline design

## 🔗 Skills ที่ใช้คู่กัน

- `/cloud-architect` — infra สำหรับ MLOps platform (K8s, GPU node)
- `/blockchain-dev` — on-chain ML model verification
- `/security-audit` — audit data pipeline และ model access
