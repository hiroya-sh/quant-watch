---
id: "2026-W34-016"
type: paper
title: "Lonic: Algorithm-Hardware Co-Design for Energy-Efficient Fully Local Online SNN Training with INT4 Precision"
url: "https://arxiv.org/abs/2608.12500"
discovered: "2026-08-17"
published: "2026-08-13"
authors: [Peilin Chen, Xiaoxuan Yang]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [low-bit-4, qat]
priority: watching
sources: [arxiv]
status: new
related: []
---
## 日本語要約
SNN の完全局所オンライン学習を INT4 低精度で実現するアルゴリズム・ハード共設計。reconfigurable multiplier-free integer PE array、dual-optimization zero-gating、temporal prefix-accelerated 局所学習データフロー等で学習効率を改善。Apple M4/Nvidia V100 比で平均17.44倍/66.28倍のエネルギ効率。

## 手法
INT4 局所オンライン学習アルゴリズム + 専用ハードの共設計。

## 評価
- 対象: SNN
- ビット幅: INT4 学習
- 効率: M4 比17.44x / V100 比66.28x

## 既存手法との差分
LLM でなく SNN の INT4 学習ハード共設計。

## 注目度コメント
LLM 外だが低精度学習の cs.AR 事例。watching。新タグ候補 snn-quant。
