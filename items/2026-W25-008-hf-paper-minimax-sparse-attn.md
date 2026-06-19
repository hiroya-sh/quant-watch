---
id: "2026-W25-008"
type: paper
title: "MiniMax Sparse Attention: Blockwise Sparse Attention for Long-Context Efficiency"
url: "https://arxiv.org/abs/2606.13392"
discovered: "2026-06-15"
published: "2026-06-12"
authors: [Xunhao Lai, et al. (MiniMax)]
venue: "arxiv / HuggingFace Papers"
models: [MiniMaxAI/MiniMax-M2.7]
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant, paged-attention, per-token]
priority: high
sources: [hf_papers]
status: new
related: []
---

## 日本語要約
MiniMaxによるブロックワイズスパース注意機構。GQA上に2分岐アーキテクチャ（Top-k KVブロック選択のIndex Branch + 精密スパース注意のMain Branch）を構築し、exp-free Top-k選択とKV-outerスパース注意のカスタムGPUカーネルを実装。1Mコンテキストで一トークンあたりの注意計算28.4x削減、H800 GPUでprefill 14.2x・decode 7.6x高速化を実証。HuggingFace Papers 262 upvotes（今週最多）。

## 手法
- Index Branch: Top-k KVブロックをsparse selectionで選択（exp-free softmax近似）
- Main Branch: 選択されたKVブロックに対して精密な注意計算
- KV-outer sparse attention: KVペアの外積スパース化による計算削減
- カスタムGPUカーネル: H800向けに最適化

## 評価
- MiniMax独自モデルで評価
- 1Mコンテキスト: 注意計算コスト28.4x削減
- H800 GPU: prefill 14.2x、decode 7.6x高速化
- 精度劣化: 報告なし（full attentionと同等）

## 既存手法との差分
Flash Attentionが計算効率化（exact）なのに対し、MiniMax SAはTop-k近似による意味的スパース化。Hyper AttentionやSparse Flash Attentionより実用的なblockwise実装。KV量子化とは独立だが実質的な「KV compute削減」として同等効果。

## 注目度コメント
kv-cache-compression-non-quantとして分類するが実質的効果はKV cache削減と同等。262 upvotesで今週最多注目。1Mコンテキスト推論の実用化に向けたMiniMaxの技術基盤。vLLMへの統合可能性に注目。
