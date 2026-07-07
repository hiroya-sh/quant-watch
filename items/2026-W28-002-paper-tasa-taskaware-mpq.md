---
id: "2026-W28-002"
type: paper
title: "Beyond Activation Alignment: The Alignment-Diversity Tradeoff in Task-Aware LLM Quantization"
url: "https://arxiv.org/abs/2607.00908"
discovered: "2026-07-07"
published: "2026-07-01"
authors: [Fei Wang, Chao Xue, Taoran Liu, Li Shen, Ye Liu, ChangXing Ding]
venue: "arxiv (cs.LG)"
affiliation: "（要確認）"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5]
architectures: [transformer]
methods: [TASA]
tech: [mixed-precision, ptq, calibration]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了 (Submitted 1 Jul 2026)"
related: []
---

## 日本語要約
校正データ構成と mixed-precision ビット割当を同時最適化する 2 段階フレームワーク **TASA (Task-Aware Sensitivity Analysis)**。（論文主張）2 つの現象を指摘：(1)「Perplexity Illusion」= perplexity ベースの感度で重要とされる層は、推論性能に効く層と Kendall τ 相関がほぼゼロ、(2)「Alignment-Diversity Tradeoff」= target タスクのみの校正はむしろ害になり、汎用ドメインデータが感度を安定化。training-free の gradient-trace alignment 基準で校正混合を探索し、perplexity と推論指向の感度を統合して層間/層内ビット割当。

## 評価（論文主張値）
- 適切に割当てた **3.5bit** モデルが、タスク非考慮の 4bit ベースラインに匹敵/凌駕
- LLaMA-3-8B の GSM8K で最強 W3 ベースライン比 +20 絶対ポイント超と主張
- 対象: LLaMA-3-8B, Qwen2.5-7B

## 注目度コメント
mixed-precision + 校正データ選択。「perplexity 感度 ≠ 推論感度」は評価設計に効く知見。focus 直撃なしだが手法として有用。
