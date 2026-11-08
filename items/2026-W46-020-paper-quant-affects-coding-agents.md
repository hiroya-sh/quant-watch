---
id: "2026-W46-020"
type: paper
title: "Beyond Accuracy: How Quantization Affects Coding Agents"
url: "https://arxiv.org/abs/2611.02368"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Areej Mehboob", "Muhammad Ali Shafique", "Muhammad Usman Qadeer", "Hamza Farooq"]
venue: "arXiv:2611.02368"
models: []
architectures: ["transformer"]
methods: ["GPTQ", "AWQ"]
tech: ["low-bit-4", "ptq"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Qwen2.5-Coder-Instruct (7B/14B/32B) + Devstral-Small-2507 (24B) を BF16 vs 4-bit AWQ/GPTQ で比較 (OJBench, 3 seed)。最終精度に有意差はないが、行動が大きく変化。AWQ で Qwen-7B の one-shot solve 17→0、loop solve 10→25。Qwen-32B は全成功で tool を使用、Devstral はほぼ使わない。失敗モードも異なり、Qwen-32B はコンパイルエラーが量子化で微増、Devstral は runtime error → wrong answer / timeout にシフト。「量子化の agent 堅牢性は精度だけでなく trajectory, tool use, failure mode で評価すべき」。

## 手法

OJBench 競プロ問題を 3 seed で run、trajectory / tool use / failure type を集計。

## 評価

- モデル: Qwen2.5-Coder-Instruct 7B/14B/32B, Devstral-Small-2507 24B
- ビット幅: BF16 / 4bit AWQ / 4bit GPTQ
- 精度: 有意差なし (累計)
- 行動: 量子化で one-shot→loop 解法にシフト, failure mode が大きく変化

## 注目度コメント

量子化 evaluation 方法論の視点を広げる重要作。既存ベンチマークの "精度" で見逃すリスクを明文化。
