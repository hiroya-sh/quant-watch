---
id: "2026-W23-027"
type: paper
title: "NestedKV: Nested Memory Routing for Long-Context KV Cache Compression"
url: "https://arxiv.org/abs/2605.26678"
discovered: "2026-06-01"
published: "2026-05-26"
authors: [Hong Chen, Xiang Liu, Yubo Gao, Yuxuan Fan, Bo Wang, Yuanlin Chu, Yuanguo Lin, Xuming Hu]
venue: "arXiv:2605.26678"
models: [Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, kv-cache-compression-non-quant, long-context-quant, calibration-free]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
長コンテキストLLMのKVキャッシュ圧縮のためのhierarchicalなトークン選択手法。グローバル・ブロック・スライディングウィンドウの3階層でマルチタイムスケールのcosine anomalyスコアリングを行い、head-adaptive mixingとsurprise-gatedルーティングを組み合わせる。Qwen3-4Bで低保持率（r=0.75）にてLongBench+19.10ポイント改善（vs KeyDiff）。

## 手法
KVキャッシュの選択的保持戦略。3段階のhierarchicalスコアリングで「どのトークンを保持すべきか」を決定する。量子化（精度削減）ではなく選択圧縮（eviction）。

## 評価
- 対象モデル: Qwen3-4Bなど
- ビット幅: N/A（eviction）
- 精度劣化: KeyDiff比でLongBench+19.10pt (r=0.75)、LooGLE/RULER/InfiniteBenchでも改善
- スループット/メモリ: 低保持率での性能維持

## 既存手法との差分
KeyDiff等の既存eviction手法より低保持率での性能改善が大きい。階層的マルチスケールアプローチで局所・グローバル両方のコンテキスト重要性を捉える。

## 注目度コメント
量子化ではなくevictionだが、kv-cache-quant周辺の研究として長コンテキスト推論の文脈で関連。
