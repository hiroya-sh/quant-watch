---
id: "2026-W46-023"
type: paper
title: "Where Should a KV-Cache Repair Budget Go? Distractor Structure and Contextual Compatibility in Non-Prefix Reuse"
url: "https://arxiv.org/abs/2611.06397"
discovered: "2026-11-09"
published: "2026-11-04"
authors: ["Yuxing Peng", "Zhiqing Tang", "Weijia Jia"]
venue: "arXiv:2611.06397"
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Non-prefix KV reuse (chunk ごとに独立符号化し連結) で small repair budget をどこに使うべきかを 3 モデル × 4 dataset (dialogue memory, open-domain QA, API doc) で検証。Reuse は full-prefill QA の 19-100% を失い、他 chunk の種別が target と同じほど損失大。target 周辺を recompute する "contextual compatibility" の方が、target full-prefill KV の挿入より 7/7 設定で良い。QA 用の retriever + 隣接 reorder + top chunk recompute が 5% budget で 6/9 設定で infoflow-style reorder を有意に上回る。

## 手法

full-prefill との KV を直接合わせるのではなく、reused cache に対して target を re-compute して "contextual compatibility" を作る。

## 評価

- モデル: 7B-8B x3
- データ: dialogue memory, open-domain QA, API doc
- 改善: 5% budget で 6/9 設定で infoflow 上回り

## 注目度コメント

KV reuse の運用知見。prefix-cache の上に non-prefix を乗せる最近の RAG serve と直結。
