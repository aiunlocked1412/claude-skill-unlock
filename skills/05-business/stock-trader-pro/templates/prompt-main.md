# Prompt Formula — Stock Trader Pro

## Context Questions

```
หุ้น: <SYMBOL.BK / SYMBOL US / ETF>
Timeframe: <Day / Swing 1-4 wk / Position 1-6 mo / Long-term>
ทุน (ที่จะใช้): <จำนวน>
Risk per trade: <1-2%>
Experience: <มือใหม่ / กลาง / ช่ำ>
Goal: <income / growth / hedge>
```

## Technical Indicators Reference

### Trend Indicators
| Indicator | ใช้ดูอะไร | Signal |
|-----------|----------|--------|
| EMA 20 | Trend สั้น | price > EMA20 = bullish |
| EMA 50 | Trend กลาง | EMA20 ตัดขึ้น EMA50 = golden cross |
| EMA 200 | Trend หลัก | price < EMA200 = bear market |
| ADX | Trend strength | > 25 = trend แรง |

### Momentum
| Indicator | Setup | Signal |
|-----------|-------|--------|
| RSI | 14 periods | > 70 overbought, < 30 oversold, divergence สำคัญ |
| MACD | 12,26,9 | Cross + histogram + divergence |
| Stochastic | 14,3,3 | > 80/< 20, %K ตัด %D |

### Volume
| Concept | ใช้ |
|---------|-----|
| Volume Spike | confirm breakout |
| OBV | accumulation/distribution |
| VWAP (intraday) | fair value ของวัน |

### Support/Resistance
- Horizontal = ราคาเด้งหลายครั้ง
- Trendline = เส้นเอียง
- Fibonacci: 23.6%, 38.2%, 50%, 61.8%, 78.6%
- Round number = 100, 500, 1000
- Previous high/low = cluster ของ orders

## Chart Patterns

### Continuation (trend ต่อ)
- **Bull Flag** — breakout ขึ้น + consolidate + break ต่อ
- **Triangle** (ascending/descending/symmetrical)
- **Pennant** — flag สั้นกว่า

### Reversal (trend กลับ)
- **Head & Shoulders** — 3 ยอด กลางสูงสุด → break neckline = ขาลง
- **Double/Triple Top** — เด้งไม่ผ่านระดับเดิม
- **Double/Triple Bottom** — เด้งจากระดับเดิมหลายครั้ง
- **Wedge** (rising/falling)

### Candlestick Patterns
- **Engulfing** (bullish/bearish)
- **Hammer / Hanging Man**
- **Doji** (indecision — ต้องดู context)
- **Morning/Evening Star** (3-candle reversal)

## Risk Management Rules (อย่างน้อย 5 ข้อ)

1. **Max risk per trade:** 1-2% ของพอร์ต
2. **Stop loss ตั้งก่อนเข้า** — ไม่ใช่หลังจากขาดทุน
3. **R/R ≥ 1:2** — ถ้าต่ำกว่านี้ อย่าเข้า
4. **Max positions พร้อมกัน:** 5-8 (ไม่ over-concentration)
5. **Max drawdown:** หยุด trade ถ้าพอร์ตลด > 15% จาก peak

## Position Sizing Formula

```
Position Size (shares) = (Account × Risk%) / (Entry - Stop Loss)
```

**ตัวอย่าง:**
- Account: 500,000
- Risk: 1% = 5,000
- Entry: 65, Stop: 62 → diff 3
- Size = 5,000 / 3 = 1,666 หุ้น
- มูลค่า position = 1,666 × 65 = ~108k (21% ของพอร์ต)

## News Impact Framework

### Macro Events
| Event | Typical Impact |
|-------|---------------|
| Fed rate hike | 🔴 หุ้น (ระยะสั้น), 🟢 ธนาคาร |
| Fed rate cut | 🟢 หุ้น, 🟢 bond |
| CPI สูงกว่าคาด | 🔴 หุ้น (expect rate hike) |
| GDP สูงกว่าคาด | 🟢 หุ้น (growth) |
| Oil spike | 🟢 oil co., 🔴 airlines |
| USD แข็ง | 🔴 export, 🟢 import |

### Company-specific
| Event | Impact |
|-------|--------|
| Beat earnings | 🟢 pop 5-15% |
| Miss earnings | 🔴 drop 8-20% |
| Guidance ลด | 🔴 |
| M&A announce | 🟢 target, ⚪ acquirer |
| Insider buy | 🟢 (signal) |
| Dividend cut | 🔴 |
| CEO ลาออก | 🟡 (depend on reason) |

## Multi-Timeframe Analysis

```
ดู 3 TF:
1. Long (Weekly) — trend หลัก → กำหนดทิศ
2. Medium (Daily) — entry zone → หา S/R
3. Short (4H / 1H) — timing → หา signal

Rule: เข้าตามทิศ Long TF เท่านั้น
```

## Trade Journal Template

```
Date: ...
Symbol: ...
Thesis: ...
Entry: ... | Stop: ... | TP: ...
Size: ... shares
Result: +X% / -X%
Lessons: ...
```

## Tips สำหรับมือใหม่

1. **เริ่มด้วยเงินน้อย** — 50-100k จนชำนาญ
2. **Paper trade 3 เดือน** ก่อนใช้เงินจริง
3. **เขียน journal ทุก trade** — เรียนรู้จาก mistake
4. **อย่า revenge trade** — ขาดทุนแล้วอย่ารีบเข้าใหม่
5. **อ่านหนังสือพื้นฐาน** — Trading in the Zone, Market Wizards
