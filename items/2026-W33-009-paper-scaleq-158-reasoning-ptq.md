---
id: "2026-W33-009"
type: paper
title: "Attend to Your Own Thoughts: Breaking the Barrier for PTQ of Reasoning LLMs through 1.58-Bit Quantization (ScaleQ-1.58)"
url: "https://arxiv.org/abs/2608.01078"
discovered: "2026-08-10"
published: "2026-08-02"
authors: [Shigeng Wang, Chao Li, Yangyuxuan Kang]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [AutoRound]
tech: [low-bit-1bit, low-bit-2, ptq, calibration]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
推論LLM向けのスケーラブルな三値(1.58bit)PTQフレームワークScaleQ-1.58。最新の学習型微分可能三値化CAT-Qでも、モデルの推論過程を無視した従来校正では数学・コードの難問で性能が崩壊することを発見。

## 手法
Attend to Your Own Thoughts(AYOT)校正: 高精度事前学習モデルが生成した推論トレースと最終回答を校正に使い、三値PTQでも推論能力を保つ。

## 評価
- 対象モデル: 推論LLM
- ビット幅: 1.58-bit (ternary weight)
- 精度劣化: 難問での性能崩壊をAYOT校正で回避
- スループット/メモリ: 三値化で最大圧縮

## 既存手法との差分
推論過程を無視する既存校正(CAT-Q含む)に対し、自己生成の推論トレースを校正データに使う。

## 注目度コメント
1.58bit/BitNet系の適用先が推論LLMへ。BitNetウォッチ(W30-W31で継続)の延長線上。
