---
id: "2026-W28-008"
type: paper
title: "KV-Evict-Q: Joint KV Eviction and Quantization for Attention-Dense Long-Context Inference"
url: "https://arxiv.org/abs/2607.02591"
discovered: "2026-07-06"
published: "2026-07-04"
authors: [Zhenyu Zhang, Ying Sheng, Tianyi Zhou, Beidi Chen, Zhangyang Wang]
venue: "arxiv"
affiliation: "UT Austin / CMU / Together AI"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.6]
architectures: [transformer]
methods: [KVQuant, PolarQuant]
tech: [kv-cache-quant, kv-cache-eviction, long-context-quant, low-bit-3, per-token, sparse-attention]
priority: normal
sources: [arxiv]
status: new
related: [2026-W27-001, 2026-W28-003]
---

## 日本語要約
KV cache の「eviction（枝刈り）」と「quantization」を独立軸として扱うのではなく、joint 最適化する研究。CMU H2O / Together AI Streaming-LLM 系の後継。128K 文脈で、eviction 率 40% + PolarQuant-KV 3-bit で FP16 比 メモリ 12x 削減、精度劣化 ROUGE-L -0.5pt。W28 KV-Codex のフローチャートに joint 軸を追加する提案。

## 手法
- **Joint policy**: 各 token に対して「evict / keep-FP16 / keep-3bit / keep-4bit」の 4 択を attention weight 統計から決定
- **Learned selector**: 校正データ 128 samples で軽量 MLP を学習し token 分類
- **PolarQuant-KV との統合**: keep-3bit / keep-4bit 選択されたトークンは PolarQuant-KV レシピで量子化
- **Runtime overhead**: selector 追加コストは attention forward 全体の 1.2%

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.6-27B
- ビット幅: keep 部分は 3-bit / 4-bit 混在、evict は完全削除
- 精度劣化: 128K LongBench ROUGE-L FP16 比 -0.5pt（PolarQuant-KV 単体 -0.4pt からの追加劣化 -0.1pt）
- スループット/メモリ: メモリ 12x（quant 5x + eviction 40%）、decode 2.4x

## 既存手法との差分
- **H2O / Streaming-LLM**: eviction のみ、量子化なし
- **W27 PolarQuant-KV / W28 TurboQuant-Ω**: quantization のみ、eviction なし
- KV-Evict-Q は両者を統合し、メモリ削減率の上限を大幅に押し上げ

## 注目度コメント
kv-cache-quant が focus tech の一つ。W28 KV-Codex（W28-003）の「フローチャート」に第 3 軸（eviction 率）を追加する提案として位置づけられ、実装コストと精度のトレードオフに関する議論を深める。
