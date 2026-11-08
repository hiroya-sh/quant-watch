---
id: "2026-W46-013"
type: paper
title: "LowRAM: Low-Rank Keys and Amortised Values for Composable KV Cache Compression at Test-Time"
url: "https://arxiv.org/abs/2611.07025"
discovered: "2026-11-09"
published: "2026-11-04"
authors: ["Teresa Delgado", "Hugo Hazard", "Martin Benfeghoul", "Jun Wang"]
venue: "arXiv:2611.07025"
models: []
architectures: []
methods: []
tech: ["kv-cache-quant", "kv-cache-eviction", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

LowRAM: per-head 軽量 predictor を test-time に当てて value を key から回帰し、再構成が悪い token のみ residual を保存する value cache amortisation。クロス層 low-rank key compression と組み合わせ、3 モデルファミリーで near-lossless。4x 圧縮で peak decode throughput を 5x に。量子化と eviction と直交構成可能で、長文で 26.9x 圧縮 94.5% baseline 性能。「key と value を構造的に別物として扱うと KV 圧縮が効率的・aggressive・composable になる」。

## 手法

value を key から予測する per-head predictor を test-time fit (または meta-learned で prefill overhead 削減)。cross-layer low-rank key compression と合わせ、decode step ごとに部分 KV のみ再構成。

## 評価

- モデル: 3 モデルファミリー
- 圧縮: 4x near-lossless, decode throughput 5x
- 構成可能: quant + eviction と直交, 長文で 26.9x @ 94.5% baseline

## 注目度コメント

kv-cache-quant focus — W36/W45 の KV 圧縮シリーズに "key と value を別構造として扱う" 新軸を追加。vLLM への移植は難しくなさそう。
