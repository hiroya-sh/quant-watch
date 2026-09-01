---
id: "2026-W34-033"
type: hf-paper
title: "OasisKV: Scaling In-Decode KV Cache Beyond HBM with Lookahead Sparse Prefetch"
url: "https://huggingface.co/papers/2608.08097"
arxiv_url: "https://arxiv.org/abs/2608.08097"
discovered: "2026-08-17"
published: "2026-08-10"
authors: [Can Xiao, Sukmin Cho, Junbong We, Zhixiong Niu]
hf_upvotes: 24
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, sparse-attention, speculative-decoding]
priority: normal
sources: [hf-papers, arxiv]
status: new
related: []
---
## 日本語要約
LLM 推論は compute より memory 制約が支配的で、長文/長推論では KV cache がメモリ容量と帯域を占める。OasisKV は decode 時 attention が本質的に疎である点を活かし、**関連トークンの KV だけを HBM に保持**して full KV を HBM から切り離す memory-centric 設計。speculative decoding の lookahead トークンで将来重要トークンを事前予測し prefetch する。

## 手法
decode-time sparse attention + speculative lookahead による重要 KV の予測的 prefetch。full KV storage を HBM から decouple。

## 評価
- 対象: 長文 decode ワークロード
- 観点: HBM 容量圧の緩和、batch/throughput 拡大

## HF Papersでの注目度
- upvote数: 24
- コメントの傾向: KV cache/HBM 容量問題への実システム提案として注目

## 注目度コメント
量子化そのものではないが KV cache のメモリ削減(疎性+prefetch)で FP8 KV 量子化と補完的。HF daily_papers で今週唯一の量子化隣接アイテム。
