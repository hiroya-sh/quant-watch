---
id: "2026-W22-019"
type: hf-paper
title: "GQLA: Group-Query Latent Attention for Hardware-Adaptive Large Language Model Decoding"
url: "https://huggingface.co/papers/2605.15250"
arxiv_url: "https://arxiv.org/abs/2605.15250"
discovered: "2026-05-18"
published: "2026-05-18"
authors: []
hf_upvotes: 13
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, latent-compaction, per-token]
priority: normal
sources: [hf-papers]
status: new
related: []
---

## 日本語要約

DeepSeekのMLA（Multi-head Latent Attention）を拡張し、2通りの等価なデコード経路（MQA-absorb / GQA経路）を持つGQLAを提案。MQA-absorbパスではper-tokenKVキャッシュをGQAベースラインの28.125%に圧縮。H100とH20 GPUの特性に応じて最適経路を切り替えるハードウェア適応デコード。量子化そのものではなく構造的KV削減だが、KVメモリ削減の文脈で重要。

## 手法

- MLA構造を解析し、代数的に等価な2デコード経路を導出
- MQA-absorb経路: KVキャッシュをlatent表現に圧縮（28.125%）
- GQA経路: デコード計算をGPU特性に最適化
- ハードウェア（H100/H20）のメモリ帯域に応じて経路を選択

## 評価

- 対象モデル: DeepSeek系LLM（MLA搭載）
- ビット幅: 変更なし（構造的圧縮）
- 精度劣化: 等価変換のため精度劣化なし
- スループット: H100/H20で最適化されたデコードスループット

## 既存手法との差分

量子化ではなくアーキテクチャ的等価変換によるKV削減。MLA搭載モデル（DeepSeek）特有の手法であり、他アーキテクチャへの直接適用は不可。
