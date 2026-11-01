---
id: "2026-W45-016"
type: paper
title: "ResidualQuant: KV Cache Quantization for Looped Transformers with 2-Bit Residuals"
url: "https://arxiv.org/abs/2610.10381"
discovered: "2026-11-02"
published: "2026-10-07"
updated: "2026-10-29"
version: "v2"
authors: ["Heejun Kim", "Junyoung Lee", "SangLyul Cho", "Dongsu Han", "Insu Han"]
venue: "arXiv"
arxiv_categories: ["cs.LG"]
models: []
architectures: ["transformer"]
methods: []
tech: ["kv-cache-quant", "low-bit-2", "mixed-precision", "rotation"]
priority: high
sources: [arxiv]
status: updated
related: []
---

## 日本語要約

**Title**: ResidualQuant: KV Cache Quantization for Looped Transformers with 2-Bit Residuals

Looped Transformers improve parameter efficiency by applying shared Transformer blocks over recurrent loops, increasing computational depth without increasing the parameter count. However, KV cache memory still scales with loop count, becoming a key memory bottleneck that limits batch size and inference throughput. KV cache quantization can alleviate this bottleneck, but existing methods often suf...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) Looped Transformers improve parameter efficiency by applying shared Transformer blocks over recurrent loops, increasing computational depth without increasing the parameter count. However, KV cache memory still scales with loop count, becoming a key memory bottleneck that limits batch size and inference throughput. KV cache quantization can alleviate this bottleneck, but existing methods often suffer substantial accuracy degradation at aggressive low-precision regimes. We observe that looped Transformers offer a unique opportunity: KV states across loops are highly similar. Based on this obser...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

Looped Transformers improve parameter efficiency by applying shared Transformer blocks over recurrent loops, increasing computational depth without increasing the parameter count. However, KV cache memory still scales with loop count, becoming a key memory bottleneck that limits batch size and inference throughput. KV cache quantization can alleviate this bottleneck, but existing methods often suffer substantial accuracy degradation at aggressive low-precision regimes. We observe that looped Transformers offer a unique opportunity: KV states across loops are highly similar. Based on this observation, we propose ResidualQuant, which uses the final-loop KV states as a reference and represents the remaining loops with low-precision residuals. Our method further combines least-square scaling a...

## 注目度コメント

**HIGH** — 定例議題候補。
