---
id: "2026-W47-020"
type: paper
title: "Looping Deeper Without Growing the KV Cache: Recurrent Depth for Causal Encoder-Decoders"
url: "https://arxiv.org/abs/2611.13378"
discovered: "2026-11-16"
published: "2026-11-10"
authors: [arxiv:2611.13378]
venue: "arXiv:2611.13378"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant]
priority: normal
sources: [arxiv]
status: new
related: [2026-W46-006-paper-dory10-4b-looped-normalized-gpt]
---

## 日本語要約
Looped LM は parameter を増やさず compute を深められるが、各 round で全層 KV を保持すると serving batch size が制限される。本稿は **causal encoder-decoder (CED)** 構成を設計し、ループ中の **KV 増加ゼロ**を達成。sparse encoder 層のみが round で global KV を書き、decoder 層は再利用する。

## 手法
- asymmetric stack: encoder = sparse global KV generator, decoder = reuse
- 各 loop で decoder 側 KV を書き直さない
- W46 Dory1.0-4B の last-loop-only KV を一般化

## 評価
- loop 深さ × accuracy / loop 深さ × serving batch / loop 深さ × KV メモリ
- 2 ループ以上での accuracy 保持

## 既存手法との差分
Dory1.0-4B (W46) は最後の loop だけ KV を書く特殊構成、本稿は CED による**構造的一般化**。

## 注目度コメント
Looped LM が 2026 Q4 の新潮流(W45 LoopKV, W46 Dory1.0-4B)として定着。**KV 増加ゼロ**の looped が本物なら、looped モデルの量子化 KV 需要がさらに下がり、looped + NVFP4 KV の組合せ最適化が変わる可能性。
