---
id: "2026-W47-022"
type: paper
title: "Planners Exploit Deterministic Error: Dithered Low-Bit World Models"
url: "https://arxiv.org/abs/2611.11780"
discovered: "2026-11-16"
published: "2026-11-09"
authors: [arxiv:2611.11780]
venue: "arXiv:2611.11780"
models: []
architectures: []
methods: []
tech: [calibration-free, low-bit-4]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Model-based planner (MPPI / CEM) は learned world model を 1 制御ステップで数千回クエリする。**量子化で安くするのは自然だが**、round-to-nearest activation 量子化 + 無校正だと planning success が最大 **100 pt 崩壊**することがある。world model 単体の予測誤差は増えないのに、planner が**決定論的な量子化誤差を悪用**する。本稿は **dithered activation quantization** でこの崩壊を回避。

## 手法
- activation 量子化時に stochastic rounding (dither) を注入
- round-to-nearest の決定論的な偏りを防ぐ
- 校正不要(calibration-free)

## 評価
- MPPI / CEM + world model (低次元ロボ制御)
- 量子化: INT4/INT8 activation
- success rate / 予測誤差 / 計算コスト

## 既存手法との差分
通常の LLM 量子化は accuracy 指標のみで判定するが、planning のような **argmax 連鎖**では決定論誤差が悪化する。planner 用の量子化は**要校正**ではなく**要 dithering**。

## 注目度コメント
LLM reasoning でも同種の問題が起きる可能性(reasoning chain = planner 的)。量子化後の **temperature / rounding 戦略**を再考する契機になる論文。
