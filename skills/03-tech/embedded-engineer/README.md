# Embedded Engineer

> AI วิศวกร Embedded/IoT — Arduino/ESP32/Raspberry Pi, Sensor Integration, MQTT/BLE/LoRa, Firmware, Battery Optimization

## ⚡ ใช้ยังไง

```
/embedded-engineer
```

## 🎯 ทำอะไรได้บ้าง

- ✅ Firmware Development (Arduino C, ESP-IDF, MicroPython, Rust)
- ✅ Sensor Integration (I2C, SPI, UART, Analog) พร้อม wiring diagram
- ✅ Communication Stack (MQTT, BLE, LoRa, WiFi, Zigbee, 4G/NB-IoT)
- ✅ Battery Optimization (deep sleep, adaptive sampling, peripheral control)
- ✅ OTA Firmware Update (secure, signed, rollback-safe)
- ✅ IoT Backend Integration (AWS IoT, MQTT broker, InfluxDB, Grafana)
- ✅ Full IoT Architecture (hardware + firmware + cloud pipeline)

## 💡 Use cases

- Maker/Hobbyist อยากสร้าง weather station ด้วย ESP32
- Engineer พัฒนา smart farm sensor node ที่ใช้ battery 1 ปี
- บริษัทอยากเปิด OTA update สำหรับ device ที่ติดตั้งทั่วประเทศ
- Startup สร้าง BLE wearable สำหรับ health monitoring
- Dev เชื่อมต่อ GPS tracker กับ MQTT backend

## 📦 ไฟล์ใน skill นี้

```
embedded-engineer/
├── SKILL.md      # ไฟล์หลัก (Claude อ่าน)
└── README.md     # คุณกำลังอ่านอยู่
```

## 📊 ตัวอย่างผลลัพธ์

Firmware code (C/MicroPython) + wiring table + library list + power budget estimate + OTA procedure

## 🎓 Tips

- ระบุ **platform** (ESP32/Arduino/RPi) + **sensor ที่ใช้** → ได้ code ที่ตรง hardware
- บอก **power source** (battery ขนาดไหน + ต้องการอยู่กี่เดือน) → ได้ sleep strategy
- ระบุ **protocol** (WiFi/LoRa/BLE) + **range ที่ต้องการ** → ได้ stack ที่เหมาะสม

## 🔗 Skills ที่ใช้คู่กัน

- `/cloud-architect` — IoT cloud backend (AWS IoT Core, time-series DB)
- `/ml-engineer` — edge inference บน Raspberry Pi / Coral
- `/security-audit` — firmware security review, OTA signing
