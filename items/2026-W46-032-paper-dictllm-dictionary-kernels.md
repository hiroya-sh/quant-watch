---
id: "2026-W46-032"
type: paper
title: "DictLLM: Post-training Compression of Large Language Model with Dictionary Kernels"
url: "https://arxiv.org/abs/2611.08082"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Jinho Park", "Se Young Chun", "Mingoo Seok"]
venue: "arXiv:2611.08082"
models: []
architectures: ["transformer"]
methods: []
tech: ["ptq"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

DictLLM: グループ化層の重みを shared dictionary + layer-specific sparse coefficient に分解する post-training compression。(1) 入力スケール付き SVD で shared dictionary、(2) dictionary-aware Hessian で coefficient をスパース化、(3) sparse coefficient でさらに dictionary を refine、(4) factor-specific Hessian (入力 cov / dictionary-aware) で両方を強い量子化。LLaMA-7B で 5.1x 圧縮で WikiText2 PPL +2.9pt。「post-training low-rank compression の Pareto frontier を押す」。

## 手法

SVD + sparse coefficient + Hessian-aware 量子化の 4 ステップで、1 グループあたり dictionary 1 つのみ保持。

## 評価

- モデル: LLaMA-7B
- 圧縮: 5.1x
- 精度: PPL +2.9pt
- 対象: 言語モデル + zero-shot reasoning

## 注目度コメント

factorization + 量子化を combined にする post-training。既存 low-rank 手法の上を Pareto で押す点に意義あり。
