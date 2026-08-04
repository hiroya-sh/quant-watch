---
id: "2026-W29-003"
type: paper
title: "GIFT: Geometry-Informed Low-precision Gradient Communication for LLM Pretraining"
url: "https://arxiv.org/abs/2607.07494"
discovered: "2026-07-13"
published: "2026-07-08"
authors: [Jieying Wang, Shuyuan Fan, Mingkai Zheng, Zhao Zhang]
venue: "arxiv (cs.DC, cs.LG)"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, rotation]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
LLM 事前学習の勾配通信を FP8 / NVFP4 の低精度で行う際、**異方性の強い勾配を「等方に近い座標系」へ変換してから量子化**する geometry-informed スケーリング GIFT。ユークリッド空間での線形/非線形マッピング量子化は方向依存の歪みで精度劣化する、という問題意識。通信量削減と忠実度の両立を主張。

## 注目ポイント
- NVFP4 の用途が weight/activation から**勾配通信**へ拡大する例
- 回転・座標変換による量子化前処理(QuaRot 系の発想)を通信に適用

## 注目度コメント
推論量子化ではなく学習インフラ側だが、NVFP4 フォーマットのエコシステム拡大として記録。優先度 high(NVFP4 focus bump)。
