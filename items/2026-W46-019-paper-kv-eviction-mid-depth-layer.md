---
id: "2026-W46-019"
type: paper
title: "Who Should Score the Cache? Mid-Depth Layers Are the Best Judges of KV-Cache Eviction"
url: "https://arxiv.org/abs/2611.02230"
discovered: "2026-11-09"
published: "2026-11-01"
authors: ["Ekaterina Seregina"]
venue: "arXiv:2611.02230"
models: []
architectures: []
methods: []
tech: ["calibration", "kv-cache-eviction"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

KV eviction の "どの層でスコアするか" を初めて体系的に検討。21 モデルで 18 の per-layer cache モデル (0.5B-109B) で scoring layer の深さが eviction 品質を支配することを発見。long-context retrieval 精度は浅い層で崩壊、depth 0.4-0.75 で peak、最終層で劣化。Top-k eviction を answer survival probability のモデル化で説明可能。calibration prompts で scoring layer を選ぶ手法を提案し、18 モデル中 16 で own-layer default を超え、7 モデルで有意改善 (14B 以下で)。shared-cache モデル (Gemma-4-E2B など) の「書き手が scoring する」ペナルティも説明可能。

## 手法

eviction を top-k cut としてモデル化し answer survival probability を prefill attention から計算。calibration prompt で最適 scoring layer を選択。

## 評価

- モデル: 21 モデル (0.5B-109B)
- 評価: long-context retrieval 精度
- 改善: 18 中 16 モデルで default 超え、7 モデルで有意 (14B 以下)
- gemma-4 言及: Gemma-4-E2B で書き手-scoring のペナルティ説明

## 注目度コメント

kv-cache-quant/eviction focus — "どの層が eviction を scoring すべきか" は KVCache 評価の盲点だった。shared KV の設計との結びつきが明確で、engine 実装の判断材料になる。
