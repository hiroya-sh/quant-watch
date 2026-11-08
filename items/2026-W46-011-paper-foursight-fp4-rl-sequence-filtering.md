---
id: "2026-W46-011"
type: paper
title: "FourSight: Stable FP4 RL Post-Training via Sequence Filtering and Sparse Channel Compensation"
url: "https://arxiv.org/abs/2611.04887"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Yining Wei", "Tianyuan Wu", "Gu Gong", "Yuechen Tao"]
venue: "arXiv:2611.04887"
models: []
architectures: []
methods: ["NVFP4"]
tech: ["low-bit-fp4", "speculative-decoding", "ptq", "outlier-handling"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

NVFP4 (W4A4) を RL post-training に導入すると rollout 品質が落ち TIM (training-inference mismatch) が増幅される。FourSight は TIM-aware sequence filtering（drifted trajectory を除外）と sparse precision compensation（top-variance channel のみ BF16、他は NVFP4）を組み合わせ、fused SpliceGEMM カーネルで overhead を抑制。step-to-accuracy を 1.76-2.60x 改善、FP4 step time 比 +2.3% 以内、120B 規模まで検証。

## 手法

(1) TIM-aware sequence filtering で mismatch 大の sequence を更新対象から除外。(2) sparse precision compensation で top-variance channel を BF16 温存、他は NVFP4 のまま。(3) fused SpliceGEMM カーネルで混合精度計算の overhead 削減。

## 評価

- モデル: 1.5B〜120B
- ビット幅: NVFP4 W4A4 (+ top variance BF16)
- 精度: full precision に接近
- 効率: step-to-accuracy 1.76-2.60x 改善, step time +2.3% 以内

## 注目度コメント

NVFP4 focus — W45 miniTE と同じ「FP4 RL 不安定性」を sparse compensation で解く。MoE-ReSQ と並行して読むと FP4 RL の全景が揃う。
