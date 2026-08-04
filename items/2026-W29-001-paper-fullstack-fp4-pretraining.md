---
id: "2026-W29-001"
type: paper
title: "Full-Stack FP4: Stable LLM Pretraining with Quantized Projections, Optimizers, and Attention"
url: "https://arxiv.org/abs/2607.04422"
discovered: "2026-07-13"
published: "2026-07-05"
authors: [Siyu Ding, Mingchuan Ma, Jiabo Tong, Xingrun Xing, Ziming Wang, Guoqi Li]
venue: "arxiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, qat, mixed-precision]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
NVFP4 事前学習を linear 層だけでなく **optimizer 状態・optimizer 演算・attention まで含めた「フルスタック 4bit」** に拡張する初の完全フレームワーク(論文主張)。3つのモジュールが異なる数値破綻パターンを持つと指摘: linear 層は次元伝播する誤差増幅、AdamW 二次モーメントは heavy-tail 非負値で低精度分母に脆弱、attention は forward/backward の量子化一貫性が必要。これらを個別に解決する安定化設計を提案。

## 注目ポイント
- 既存 NVFP4 事前学習(linear 層のみ)の未踏部分を埋める主張。「first complete NVFP4 pretraining framework」
- focus の NVFP4 に直撃。学習側の 4bit 化トレンドの現在地を測る素材

## 注目度コメント
NVFP4 の適用範囲が推論から学習フルスタックへ広がる流れの代表例。優先度 high(NVFP4 focus bump)。
