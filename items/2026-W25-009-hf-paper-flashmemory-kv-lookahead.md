---
id: "2026-W25-009"
type: paper
title: "FlashMemory-DeepSeek-V4: Lightning Index Ultra-Long Context via Lookahead Sparse Attention"
url: "https://arxiv.org/abs/2606.09079"
discovered: "2026-06-15"
published: "2026-06-09"
authors: [Yan Wang, et al.]
venue: "arxiv / HuggingFace Papers"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, kv-cache-eviction, long-context-quant, latent-compaction]
priority: normal
sources: [hf_papers]
status: new
related: ["2026-W25-008"]
---

## 日本語要約
Lookahead Sparse Attention（LSA）でDeepSeek-V4の超長文脈推論を実現する手法。未来のコンテキスト需要を先読みしてクエリに関連するKVチャンクのみを保持するNeural Memory Indexerを提案。フルモデルのロードなしでインデクサを訓練可能。500Kコンテキストでフルコンテキスト比KV-overheadを90%以上削減し、KVキャッシュを13.5%に圧縮。HuggingFace Papers 61 upvotes。

## 手法
- Lookahead Sparse Attention: 次のクエリブロックが参照するKVを先読み予測して事前にメモリ上に準備
- Neural Memory Indexer: クエリ→KVブロック重要度を予測するcoord-aware indexer（フルモデル非依存）
- KVチャンク管理: 選択されたチャンクのみGPUメモリに保持、残りはオフロード

## 評価
- DeepSeek-V4（MoE）で検証
- 500Kコンテキスト: KV overhead 90%以上削減
- KVキャッシュ容量: フルの13.5%に削減
- 精度劣化: minimal

## 既存手法との差分
SnapKV/H2Oがreactive（使われた後にevict）なのに対し、LSAはproactive（将来の需要を予測して保持）。DeepSeek-V4の長文脈応用として特化設計。

## 注目度コメント
DeepSeek-V4での検証と13.5%という圧縮率が印象的。量子化とは別軸のKVメモリ削減だが、KVキャッシュを量子化する場合との組み合わせ（圧縮+量子化）が興味深い研究方向。
