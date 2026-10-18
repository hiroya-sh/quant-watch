---
id: "2026-W43-031"
type: paper
title: "FORGE: Procedural Weight Generation for Sparse MoE Inference"
url: "https://arxiv.org/abs/2610.16890"
discovered: "2026-10-19"
published: "2026-10-12"
authors: ["Chanyoung Moon", "Travis Pence", "Daisuke Yamada", "Jiaqi Mo", "Yanxin Zhang"]
venue: "arXiv:2610.16890v1"
models: []
architectures: [moe]
methods: []
tech: [moe-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MoE エキスパートの重みを HBM から読まず、SM 内の小さなアクセラレータ(RGU)が O(log^2 d) のローター係数から**プロシージャに再生成**するアプローチ。ギガバイト級の重みがメガバイト未満のシードに近似される。量子化ではないが HBM 帯域問題への別解。

## 手法 / 評価のポイント
- 対象: Sparse MoE エキスパートの重み
- 手法: on-chip RGU で O(log^2 d) ローター係数から再生成
- 効果: ギガバイト重み → メガバイト未満のシード

## 注目度コメント
FORGE: procedural on-chip weight generation for Sparse MoE
