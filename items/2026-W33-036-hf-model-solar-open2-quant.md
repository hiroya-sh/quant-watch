---
id: "2026-W33-036"
type: hf-model
title: "Solar-Open2 量子化 (W4A8/NVFP4, 120B/250B)"
url: "https://huggingface.co/vessl/Solar-Open2-250B-W4A8"
discovered: "2026-08-10"
published: "2026-08-04"
base_model: "upstage/Solar-Open2"
models: []
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, vllm-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
W31で初出したUpstage Solar-Open2に対し量子化が継続。Solar-Open2-250B-W4A8(vessl: 149 DL)、Solar-Open2-120B-A15B-REAM-148E-NVFP4-v2(Baekpica: 68 DL)など。250B級MoEのW4A8/NVFP4化。

## 量子化仕様
- ベースモデル: upstage/Solar-Open2 (120B-A15B / 250B, MoE)
- 量子化手法: W4A8 / NVFP4(REAM expert削減併用)
- ビット幅: W4A8 / 4bit(NVFP4)
- 対象: weight+activation(W4A8)、MoE

## 精度報告(あれば)
- community報告。REAM(expert reduction)併用版あり

## ダウンロード/利用状況
- 中規模DL。W31から継続の量子化

## 注目度コメント
W31登録候補モデルの継続。250B MoEのW4A8はvLLM経路(compressed-tensors)で扱える(vllm-ready)。
