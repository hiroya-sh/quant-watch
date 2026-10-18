---
id: "2026-W43-005"
type: paper
title: "SpectrumQuant: Spectrum Alignment for LLM Quantization"
url: "https://arxiv.org/abs/2610.20303"
discovered: "2026-10-19"
published: "2026-10-14"
authors: ["Dwaipayan Haldar", "Indranil Patra", "Azhar Yousuf", "Chandra Sekhar Seelamantula"]
venue: "arXiv:2610.20303v1"
models: []
architectures: [transformer]
methods: [SpinQuant, QuaRot]
tech: [calibration, rotation, weight-only, ptq, low-bit-4]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
SpinQuant/QuaRot 系列の後継。活性のスペクトル(固有値分布)を特定目標に揃える「スペクトルアラインメント」をローテーション探索に組み込むことで、既存回転ベース PTQ の最適化目的関数の盲点を埋める。

## 手法 / 評価のポイント
- 系列: SpinQuant / QuaRot 系列の拡張
- 貢献: スペクトルアラインメント目的関数で回転行列を学習
- 既存よりロバストな超低ビット挙動を主張

## 注目度コメント
SpectrumQuant: spectrum-alignment extension of SpinQuant/QuaRot family
