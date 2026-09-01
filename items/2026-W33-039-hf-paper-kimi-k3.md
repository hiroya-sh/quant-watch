---
id: "2026-W33-039"
type: hf-paper
title: "Kimi K3: Open Frontier Intelligence"
url: "https://huggingface.co/papers/2607.24653"
arxiv_url: "https://arxiv.org/abs/2607.24653"
discovered: "2026-08-10"
published: "2026-07-28"
authors: [Kimi Team]
hf_upvotes: 486
models: [moonshotai/Kimi-K2.7]
architectures: [moe, linear-attention, hybrid]
methods: [MXFP4]
tech: [low-bit-fp4, moe-quant, vllm-ready, kv-cache-quant]
priority: high
sources: [hf-papers, arxiv]
status: new
related: []
---

## 日本語要約
Moonshot AIの新フロンティアモデルKimi K3。2.8Tパラメータのマルチモーダル LatentMoE(896 experts, top-16, 3584次元の潜在空間でルーティング)、1Mトークン文脈、KDA線形attention層×69とMLA層×24をインターリーブ、MoonViT3d視覚タワーを持つ。**nativeなMXFP4チェックポイントとして配布**され、SGLangがday-0対応(item 027)。

## 手法
LatentMoEアーキ(潜在空間ルーティング)とKDA線形attention + MLAのhybrid構成。重みをnative MXFP4で配布することで2.8T級モデルの実行を現実的にする設計。

## 評価
- 対象モデル: Kimi K3 (2.8T MoE)
- ビット幅: MXFP4 (native)
- 精度劣化: (技術報告参照、native量子化前提の設計)

## HF Papersでの注目度
- upvote数: 486(今週のHF Papersトップ級)
- コメントの傾向: フロンティアOSSモデルの公開として注目

## 注目度コメント
2.8TをnativeでMXFP4配布し、SGLangがday-0でMXFP4サービング(item 027)。native低bit配布という潮流の代表例で、監視方針(エンジンで完結する評価)にも合致。議題候補。
