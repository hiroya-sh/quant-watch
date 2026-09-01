---
id: "2026-W35-014"
type: paper
title: "Beyond Dense Adam States: Adaptive Log-Space Quantization for Memory-Efficient Optimizers"
url: "https://arxiv.org/abs/2608.22322"
discovered: "2026-09-01"
published: "2026-08-23"
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [block-wise, low-bit-fp8, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
低精度 optimizer-state 手法は通常、密な Adam 系の1次・2次モーメントを前提に設計・評価される。しかしメモリ効率型 optimizer はこの前提から外れる — Adafactor は2次モーメントを factorize し、CAME は factored confidence state を加え、APOLLO は射影勾配空間で統計を保持する。同じ量の状態再構成誤差でも、状態のトポロジと更新セマンティクスによって更新誤差は変わる。

## 手法
言語モデル事前学習の optimizer-state トレースでこの異質性を特徴づけたうえで、**Adaptive Log-Space (AL) 量子化**を提案。非負の状態向けのブロック単位表現で、ブロックごとに非零レンジを適応させ、厳密ゼロ不変条件 $q=0 \Leftrightarrow x=0$ を強制する。AL8 / AL16 を独立した符号付きモーメンタム符号化と状態別の精度選択に組み合わせる。

## 評価
- LLM 事前学習の optimizer 状態

## 既存手法との差分
「optimizer 状態の種類ごとに量子化設計を変える」点。単一方式を全状態に適用しない。

## 注目度コメント
推論側ではなく学習側の量子化。Megatron-Core 0.19.0 の MXFP8 学習パスと同じ「学習時低精度」文脈。
