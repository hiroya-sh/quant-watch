---
id: "2026-W46-015"
type: paper
title: "TACT-KV: Tri-Axis Cosine Transform for Compressing Volumetric KV Caches in Medical VLMs"
url: "https://arxiv.org/abs/2611.07593"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Chongyu Qu", "Ritchie Zhao", "Yufan He", "Dong Yang"]
venue: "arXiv:2611.07593"
models: []
architectures: []
methods: []
tech: ["calibration", "calibration-free", "kv-cache-quant", "low-bit-1bit", "speculative-decoding"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

3D 医用 VLM 向け calibration-free KV 圧縮 TACT-KV。CT/MRI のような 3 軸構造を活かし、separable 3D DCT で KV 周波数領域へ変換、reverse water-filling で per-layer bit budget を周波数ビンに割り当て、固定 scalar codebook で量子化。TACT-KV は "distortion reduction は変換後のスペクトル集中度で決まる" closed-form を導出。6 医用 VLM × 2 3D CT ベンチで 11/12 ケース最低 1-bit flip rate、同様の優位が汎用 4 VLM × video にも波及。同 HBM で decoding batch を最大 8x 拡大。

## 手法

3 軸 separable DCT で KV を周波数領域に変換、reverse water-filling でビン単位にビット割当、固定 scalar codebook で量子化。calibration なし。

## 評価

- モデル: 6 medical VLM + 4 general VLM
- ベンチ: 3D CT + video task
- 精度: 11/12 ケースで最低 1-bit flip rate
- スループット: 同 HBM で decoding batch 8x

## 注目度コメント

kv-cache-quant focus — 3 軸構造を使った KV 圧縮は "空間相関があるモダリティ全般" に拡張可能。calibration-free は実運用上の魅力大。
