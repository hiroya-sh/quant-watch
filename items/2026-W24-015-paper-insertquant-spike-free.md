---
id: "2026-W24-015"
type: paper
title: "Massive Spikes in LLMs are Bias Vectors: Mechanistic Uncovering and Spike-Free Quantization"
url: "https://arxiv.org/abs/2606.02288"
discovered: "2026-06-08"
published: "2026-06-01"
authors: [Yung-Chin Chen, Chung Peng Lee, Ze-Wei Liou, Naveen Verma]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [outlier-handling, activation-quant, ptq, calibration-free, rotation]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
LLMの量子化を困難にするactivation spikeのメカニズムを解明。スパイクは単純なスカラーバイアスでなく「構造的なバイアスベクトル」として一定ベクトルに収束することを示す。W_K・W_Q・W_V重みが協調してスパイクを増幅・投影し、位置エンコーディングの摂動に対して「回転安定ゾーン」でスパイクを保護していることを実証。これを利用してスパイクをクランプしつつ事前計算テンプレートベクトルで機能を復元するINSERTQUANTを提案。テキスト・ビジョントランスフォーマー（ViT）を含むクロスモーダルな汎化性を示す。

## 手法
- 機構分析: Attention重み（W_K, W_Q, W_V）の協調によるスパイク増幅・保護メカニズムを解明
- INSERTQUANT: スパイクをクランプ後、事前計算済みテンプレートベクトルで機能的な動作を復元
- 既存手法との差: per-tensor手法はテキスト特化、INSERTQUANTはViTにも汎化

## 評価
- 対象: LLM + ViT（クロスモーダル）
- 結果: スパイクフリー活性化で低ビット量子化の精度向上
- 汎化: テキスト→ビジョントランスフォーマーへの適用

## 既存手法との差分
SmoothQuant等の既存外れ値対処法はスパイクの性質を表面的に捉えるのみ。本研究はメカニズムレベルの解明と、それに基づく精密な復元法を提供。

## 注目度コメント
外れ値問題の根本原因をAttention重みの協調メカニズムから解明する点は学術的に価値が高い。ViTへの汎化はマルチモーダルモデル量子化にも応用可能。
