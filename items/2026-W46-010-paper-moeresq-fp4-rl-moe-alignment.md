---
id: "2026-W46-010"
type: paper
title: "Aligning Training and Rollout Policies for End-to-End FP4 RL on Mixture-of-Experts LLMs"
url: "https://arxiv.org/abs/2611.04376"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Hei Yi Mak", "Hoang Le", "Mehran Taghian Jazi", "Yunke Peng"]
venue: "arXiv:2611.04376"
models: []
architectures: ["moe", "dense"]
methods: []
tech: ["moe-quant", "low-bit-fp4", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

MoE LLM の end-to-end FP4 RL post-training では dense 向け recovery recipe が効かず、原因は router 離散決定による training-inference 対称性の崩壊と判明。MoE-ReSQ は training 側と inference 側に symmetric な補正を強制し、training-inference alignment (Pearson, router selection matching rate) を回復。full-precision とのギャップを大きく縮小。「symmetric recovery が FP4 MoE RL の鍵」。

## 手法

MoE RL rollout と training の両側に同じ量子化補正を同時適用し、router の expert 選択率を揃える。

## 評価

- モデル: MoE LLM (RL post-training)
- ビット幅: FP4 (W4A4)
- 精度: full precision に接近
- 指標: Pearson correlation of train/infer probs, router selection matching rate

## 注目度コメント

MoE focus + NVFP4/FP4 — W45 FourSight と同じ「FP4 RL 不安定性」の MoE 側解法。symmetric recovery は実装難度低く、llm-compressor / modelopt の AutoQuantize と結合しやすい。
