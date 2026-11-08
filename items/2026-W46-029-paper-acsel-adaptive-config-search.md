---
id: "2026-W46-029"
type: paper
title: "ACSeL: Adaptive Configuration Search for Hardware-Constrained LLM Inference"
url: "https://arxiv.org/abs/2611.07570"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Bokun Wang", "Hung-Yueh Chiang", "Diana Marculescu"]
venue: "arXiv:2611.07570"
models: []
architectures: ["transformer"]
methods: []
tech: ["mixed-precision", "calibration"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

制約付き edge serving のためにモデルサイズ・batch・quant 手法・mixed-precision recipe を同時探索する ACSeL。relative model quality degradation (RMQD) proxy (small cal set での次トークン分布 divergence) で品質を安いコストで評価、few-shot median calibration (FMC) で latency を少数 end-to-end profile から補正、BandPareto で層別 mixed-precision を効率探索。RTX A6000 と Jetson Thor Edge で FMC が latency 予測を大きく改善。

## 手法

RMQD proxy + FMC latency 較正 + BandPareto 構造探索の 3 コンポーネント。

## 評価

- GPU: RTX A6000, Jetson Thor Edge
- 内容: memory + latency SLO 内で品質最大化
- 結果: FMC が latency 予測を大幅改善

## 注目度コメント

実運用寄り (edge SLO 内の configuration search)。serving stack と直結、Jetson Thor の設定探索は NVIDIA の推しに沿う。
