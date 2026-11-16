---
id: "2026-W47-012"
type: paper
title: "Translating KV Caches Between Hybrid-Attention Language Models: MLA Latents, Linear-Attention States and Sparse-Attention Indexers"
url: "https://arxiv.org/abs/2611.12062"
discovered: "2026-11-16"
published: "2026-11-09"
authors: [arxiv:2611.12062]
venue: "arXiv:2611.12062"
models: []
architectures: [hybrid, linear-attention]
methods: []
tech: [kv-cache-quant, sparse-attention, latent-compaction]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
A モデルから B モデルに会話を**引き継ぐ**とき、通常は履歴を再読み込みする必要がある。KV cache translation は A の cache を B のフォーマットに**直接変換**する。GQA では既存研究があるが、現在のフロンティア OSS は MLA latents / linear-attention states / sparse-attention indexer と**不均一な cache 形態**を使うため、翻訳器を各組合せで再設計する必要がある。

## 手法
- MLA(DeepSeek 系)の low-rank latent → GLA / linear-attention の state
- sparse-attention indexer(DSA)の index → full-attention の KV
- 3 つの cache 形態間での双方向変換
- 翻訳器は小さな learned projection で、target モデルの context ingestion を回避

## 評価
- 対象モデル: DeepSeek-V4 / GLM-5.2 / Qwen3.5 系の **hybrid attention**
- 指標: 翻訳後の精度 vs. フル再読み込み vs. 空 cache
- latency / メモリ

## 既存手法との差分
GQA 間の翻訳(例: Llama → Qwen の ヘッド数違い)を超え、**異アーキテクチャ hybrid 間**でも cache 継承を可能にする。routing 層の情報保持が鍵。

## 注目度コメント
2026 Q4 の OSS は MLA, DSA, GLA が混在。model swap/routing でのレイテンシを下げる基盤技術。vLLM / SGLang の model switch 実装の方向性と重なる。
