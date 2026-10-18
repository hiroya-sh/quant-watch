---
id: "2026-W43-032"
type: paper
title: "When Does Compensating Inherited Quantization Error Help? Mean-Square Guarantees for Layer-Wise Quantization and Their Limits"
url: "https://arxiv.org/abs/2610.16020"
discovered: "2026-10-19"
published: "2026-10-12"
authors: ["Tianhao Guo"]
venue: "arXiv:2610.16020v1"
models: []
architectures: []
methods: []
tech: [calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
層ごとに量子化誤差を補償する PTQ がいつ効くかを平均二乗出力誤差の観点から理論解析。層ごとの丸め誤差が条件付き平均ゼロ・決定論的 2 次モーメントを満たせば補償は常に non-regret、という結果と、その外側での限界。

## 手法 / 評価のポイント
- 枠組み: 層ごと PTQ の誤差補償
- 仮定: 丸め誤差が条件付き平均ゼロ+決定論的 2 次モーメント
- 結論: 補償強度 [0,1] で mean-square non-regret

## 注目度コメント
Mean-Square Guarantees for Layer-Wise Quantization — theory
