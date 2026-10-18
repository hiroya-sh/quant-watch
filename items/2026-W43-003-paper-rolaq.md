---
id: "2026-W43-003"
type: paper
title: "RoLaQ: Joint Rotation and Range Calibration for 2-Bit KV Caches in Multi-Head Latent Attention"
url: "https://arxiv.org/abs/2610.20686"
discovered: "2026-10-19"
published: "2026-10-15"
authors: ["Shiyu Ji", "Peng Ling", "Chen Lin", "Shupeng Li", "Yixuan Wang"]
venue: "arXiv:2610.20686v1"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer]
methods: []
tech: [calibration, rotation, kv-cache-quant, low-bit-2, pre-rope-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MLA(Multi-Head Latent Attention)KV キャッシュを 2-bit まで下げる PTQ。回転(rotation)でレンジを平坦化し、適応的レンジ校正を組み合わせることで、既存 MLA KV 量子化が破綻する 2-bit 域でも精度を保つ主張。focus:kv-cache-quant 直撃。

## 手法 / 評価のポイント
- 対象: MLA 系 KV cache(DeepSeek-V3/V4 系に効く)
- ビット幅: 2-bit
- 手法: 回転でレンジ平坦化 + 適応レンジ校正

## 注目度コメント
RoLaQ: 2-bit MLA KV cache with Rotation + Range Cal — focus:kv-cache-quant bump
