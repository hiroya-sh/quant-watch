---
id: "2026-W22-017"
type: paper
title: "Breaking Modality Heterogeneity in Low-Bit Quantization for Large Vision-Language Models"
url: "https://arxiv.org/abs/2605.19929"
discovered: "2026-05-19"
published: "2026-05-19"
authors: [Yi Zhong, Haotong Qin, Xindong Zhang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [low-bit-4, activation-quant, ptq, outlier-handling, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要약

VLM（Vision-Language Model）の低ビットPTQでテキストとビジョンのActivation分布の不均質性が精度劣化の主因になることを特定。SplitQフレームワークでモダリティ別に独立した量子化パラメータを適用。テキストとビジョントークンで異なるスケール・ゼロポイントを使うことで量子化誤差を低減。

## 手法

- モダリティ別Activation分析: テキストvsビジョンのActivation分布の根本的差異を定量化
- SplitQ: モダリティごとに独立したスケールとゼロポイントを割り当て
- PTQ（Calibration-based）

## 評価

- 対象モデル: 各種VLM（LLaVA, QWen-VL等）
- ビット幅: 4ビット（低ビットPTQ）
- 精度劣化: 均一量子化比で大幅改善
- スループット/メモリ: 未記載

## 既存手法との差分

既存手法がLLM用の均一量子化パラメータをVLMに転用するのに対し、SplitQはVLM固有のモダリティ非均質性を明示的に扱う。
