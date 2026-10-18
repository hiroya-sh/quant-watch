---
id: "2026-W43-026"
type: paper
title: "BELT : BEhavior-Aligned Low-Rank KV Cache Compression with Learned Top-k Rank Allocation"
url: "https://arxiv.org/abs/2610.17966"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Yaoyang Liu", "Shuwei Shen", "Jincheng Tang", "Jinguang Liu", "Jinbao Xue"]
venue: "arXiv:2610.17966v1"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, latent-compaction]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
KV cache を学習済みの低ランク射影で圧縮し、ヘッドごとに保持ランクを学習的に配分する BELT。rank 配分がヘッド特性に適応的に反応することを示す。

## 手法 / 評価のポイント
- 対象: KV cache の低ランク圧縮
- 貢献: ヘッド別の保持ランクを学習的に配分
- 位置づけ: Virtual Head Attention 系の対抗

## 注目度コメント
BELT: Behavior-Aligned Low-Rank KV Cache Compression with learned rank allocation
