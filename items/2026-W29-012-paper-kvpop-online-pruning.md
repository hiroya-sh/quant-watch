---
id: "2026-W29-012"
type: paper
title: "KVpop -- Key-Value Cache Compression with Predictive Online Pruning"
url: "https://arxiv.org/abs/2607.05061"
discovered: "2026-07-13"
published: "2026-07-06"
authors: [Lukas Hauzenberger, Niklas Schmidinger, Anamaria-Roberta Hartl, David Stap, Thomas Schmied, Sebastian Böck]
venue: "arxiv (cs.LG, cs.AI) / HF Papers 2026-07-07 (20 upvotes)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, kv-cache-compression-non-quant]
priority: normal
sources: [arxiv, hf-papers]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認、HF daily_papers 掲載確認"
related: []
---

## 日本語要約
固定予算の KV eviction ポリシーを **keep-or-drop 判定の直接教師あり学習**で獲得する KVpop。静的ヒューリスティックやプロキシスコアが将来のトークン有用性を追えない問題に対し、dense attention map を実体化せずに計算できる novel な future-attention ターゲットでスコアラを訓練。スコアリングを一定トークン数遅延させる delayed memory-based scorer も導入。

## 注目ポイント
- 学習型 eviction の中で「未来の attention」を直接教師にする点が新しい
- HF Papers でも 20 upvotes と注目度あり

## 注目度コメント
量子化ではなく eviction 系(focus 外)だが、KV 圧縮の有力路線として記録。優先度 normal。
