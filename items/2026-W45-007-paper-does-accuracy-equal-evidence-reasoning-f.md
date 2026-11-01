---
id: "2026-W45-007"
type: paper
title: "Does Accuracy Equal Evidence? Reasoning Faithfulness under KV Cache Compression"
url: "https://arxiv.org/abs/2608.01631"
discovered: "2026-11-02"
published: "2026-08-03"
updated: "2026-10-24"
version: "v2"
authors: ["Mengting Ai", "Jingrui He", "Yue Guo"]
venue: "arXiv"
arxiv_categories: ["cs.CL"]
models: []
architectures: []
methods: []
tech: ["kv-cache-quant"]
priority: high
sources: [arxiv]
status: updated
related: []
---

## 日本語要約

**Title**: Does Accuracy Equal Evidence? Reasoning Faithfulness under KV Cache Compression

KV cache compression is commonly evaluated by final-answer accuracy, implicitly assuming that preserving the answer also preserves the reasoning that supports it. We test this assumption for large reasoning models and show that it can fail: under compression, correct answers and the validity of their visible supporting rationales can be preserved at different rates. We study this failure with a co...

(本記事は arXiv の abstract を機械要約せず原文抜粋のみ掲載。詳細は原著参照。)

## 手法

(arXiv abstract より) KV cache compression is commonly evaluated by final-answer accuracy, implicitly assuming that preserving the answer also preserves the reasoning that supports it. We test this assumption for large reasoning models and show that it can fail: under compression, correct answers and the validity of their visible supporting rationales can be preserved at different rates. We study this failure with a controlled fixed-trace replay protocol, which holds reasoning content fixed and isolates whether compression preserves usable information from an already available trace. We evaluate ten token-eviction ...

## 評価

- 対象モデル: abstract 参照
- ビット幅: abstract 参照
- 精度劣化: abstract 参照
- スループット/メモリ: abstract 参照

## 既存手法との差分

(原著参照 — 詳細な比較は本文の Related Work / Experiments を参照)

## 原著 Abstract (抜粋)

KV cache compression is commonly evaluated by final-answer accuracy, implicitly assuming that preserving the answer also preserves the reasoning that supports it. We test this assumption for large reasoning models and show that it can fail: under compression, correct answers and the validity of their visible supporting rationales can be preserved at different rates. We study this failure with a controlled fixed-trace replay protocol, which holds reasoning content fixed and isolates whether compression preserves usable information from an already available trace. We evaluate ten token-eviction KV compression methods and one quantization method on three models across mathematical reasoning, scientific QA, clinical calculation, and long-context retrieval. We measure final accuracy, answer-cha...

## 注目度コメント

**HIGH** — 定例議題候補。
