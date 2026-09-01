---
id: "2026-W33-012"
type: paper
title: "GyRot: Leveraging Hidden Synergy between Rotation and Fine-grained Group Quantization for Low-bit LLM Inference"
url: "https://arxiv.org/abs/2607.27694"
discovered: "2026-08-10"
published: "2026-07-30"
authors: [Sangjin Kim, Yuseon Choi, Byeongcheol Kim]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [QuaRot, SpinQuant]
tech: [rotation, low-bit-4, weight-only, block-wise]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
回転とfine-grainedグループ量子化はそれぞれ有望だが、回転のグローバル性とグループスケールの局所性のミスマッチで併用時に精度劣化やHWオーバーヘッドが生じる。GyRotはアルゴリズム-HW協調でこのギャップを埋める。

## 手法
Coarse Rotation, Fine Grouping(CoRFiG)とHarmonic-Aligned Permutation(HAP)で回転とグループ量子化を協調統合。スケール係数精度を緩めつつ量子化容易性を高めるアクセラレータ。

## 評価
- 対象モデル: LLM
- ビット幅: low-bit(4bit級) weight
- 精度劣化: 回転×グループ量子化の相乗で精度維持
- スループット/メモリ: 専用アクセラレータで回転オーバーヘッド削減

## 既存手法との差分
回転とグループ量子化を単純併用する既存法に対し協調設計で干渉を解消。

## 注目度コメント
回転量子化のHW実装コストという実務課題に踏み込む。カスタムHW前提。
