---
id: "2026-W22-018"
type: paper
title: "GAMMA: Global Bit Allocation for Mixed-Precision Models under Arbitrary Budgets"
url: "https://arxiv.org/abs/2605.18475"
discovered: "2026-05-18"
published: "2026-05-18"
authors: [Zhangyang Yao, Haiyan Zhao, Haoyu Wang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [mixed-precision, ptq, calibration, block-wise]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

LLMの各コンポーネントへのビット幅割り当てをTeacher-forcedな隠れ状態再構成誤差で最適化するGAMMAフレームワーク。感度スコアの再利用性（異なるビット幅設定でも安定したランキング）が特徴で、一度プロファイルすれば任意のbitバジェットに適用可能。2.5ビット平均で3ビット品質を達成。

## 手法

- Teacher-forced hidden state reconstruction: 教師モデルの中間表現を参照した感度推定
- Score reusability: 感度ランキングが異なるbitバジェット設定でも安定 → 一回のプロファイルで複数バジェットに対応
- 任意バジェット制約下での最適ビット割り当て

## 評価

- 対象モデル: 各種LLM
- ビット幅: 平均2.5ビット（3ビット品質達成）
- 精度劣化: 既存混合精度手法（GPTQ, AWQ等）比で改善
- スループット/メモリ: 未記載

## 既存手法との差分

既存の混合精度手法は固定ビット幅設定向けに最適化するのに対し、GAMMAは感度スコアの再利用性を利用して任意バジェットに柔軟対応。
