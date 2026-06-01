---
id: "2026-W23-010"
type: paper
title: "Max-Window Scale Estimation for Near-Lossless HiF8 W8A8 Quantization-Aware Training"
url: "https://arxiv.org/abs/2605.26189"
discovered: "2026-06-01"
published: "2026-05-25"
authors: [Yingying Cheng, Jinquan Shi, Li Zhou, Zhiyang He, Zhaoyi Sun, Fan Zhang, Jie Sun]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [low-bit-fp8, qat, calibration]
priority: normal
sources: [arxiv]
status: new
related: [2026-W23-007-hf-paper-ospnext-hif8]
---

## 日本語要約
低ビット浮動小数点QATにおけるスケール飽和と学習率問題を解析し、64ステップ履歴窓を使った保守的スケール推定＋BF16ウォームアップ戦略を提案。HiF8（High-quality FP8）W8A8 QATでOpenPangu-Embedded-1B上のMMLL精度劣化を0.43%に抑制。FP8量子化訓練の安定化に向けた実践的ガイドラインを提供。

## 手法
Delayed Tensor Scalingの失敗モードを「スケール飽和」と「積極的学習率によるknowledge loss」の2種に分類。Max-Window Scale Estimation：過去64ステップの最大テンソル値を使って保守的スケールを推定し、飽和を回避。BF16 warmupフェーズで初期不安定性を回避してからFP8に移行。

## 評価
- 対象モデル: OpenPangu-Embedded-1B
- ビット幅: W8A8 FP8 (HiF8フォーマット)
- 精度劣化: MMLU -0.43%
- スループット/メモリ: FP8 QAT による学習コスト削減

## 既存手法との差分
既存FP8 QAT（例: Nvidia H800 向け）は学習中のスケール安定性を保証しにくい。本手法は失敗モードを体系的に分析し実装が容易な対策を提示。HiF8という表記が他論文にも登場（OSP-Next等）で標準化傾向あり。

## 注目度コメント
FP8 QATの安定化は産業界で重要課題。HiF8フォーマットの普及とともに実装ガイドとして価値が高まる。
