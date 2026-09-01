---
id: "2026-W36-014"
type: paper
title: "A Method for Layer Bit-Width Allocation in LLM Quantization via Performance Maximization Under a Quality-Degradation Constraint"
url: "https://arxiv.org/abs/2608.28003"
discovered: "2026-09-01"
published: "2026-08-28"
venue: "arXiv (cs.LG, cs.AI)"
models: [google/gemma-3]
architectures: [transformer]
methods: [GPTQ, AWQ]
tech: [mixed-precision, weight-only, trtllm-ready]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
Gemma-3-1B を対象に、**「許容できる生成品質劣化の予算」制約下でのレイテンシ最小化**として層ビット割当を定式化。文献で使われる一様層量子化(GPTQ / AWQ)や、加速効果が実証されていない割当手法(MixLLM / TorchAO)とは異なるアプローチだと主張。

## 手法
先行研究 SA-PTQ 由来の層感度プロファイルを、**TensorRT-LLM の activation pass-through モードの内側で適用**。前段で導入したグルーピング(5+5, 10+10, all26)に従ってブロック単位で層ごとに精度を決め、FFN / Attention / lm_head の速度寄与を分離して評価。

## 評価
- 対象: Gemma-3-1B
- 実行環境: TensorRT-LLM
- クロック速度を実測

## 既存手法との差分
「品質劣化予算 → 速度最大化」という向きの定式化と、TRT-LLM 実機での測定。

## 注目度コメント
focus model は gemma-4 だが gemma-3 系。小型モデルでの mixed-precision の実測例として、[[items/2026-W36-017-paper-layer-importance-metric|Layer Importance Metric]](同じく Gemma 3 1B)と同週に出た。
