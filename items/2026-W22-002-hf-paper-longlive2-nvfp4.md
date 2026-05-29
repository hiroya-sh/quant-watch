---
id: "2026-W22-002"
type: hf-paper
title: "LongLive-2.0: An NVFP4 Parallel Infrastructure for Long Video Generation"
url: "https://huggingface.co/papers/2605.18739"
arxiv_url: "https://arxiv.org/abs/2605.18739"
discovered: "2026-05-19"
published: "2026-05-19"
authors: []
hf_upvotes: 2110
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, kv-cache-quant, microscaling-formats]
priority: high
sources: [hf-papers, arxiv]
status: new
related: ["2026-W22-004", "2026-W22-007", "2026-W22-009"]
---

## 日本語要約

NVIDIA Blackwell GPU向けのNVFP4（W4A4）並列推論・学習インフラを長尺動画生成に適用した報告。NVFP4量子化による推論高速化に加え、KVキャッシュもNVFP4で量子化してメモリを削減。非同期ストリーミングVAEデコードと組み合わせ、長尺動画生成をBlackwell上でプロダクション運用可能なレベルに引き上げた。2110 HF upvotesという超高注目度。

## 手法

- NVFP4 (FP4, Blackwell native) でWeightとActivationをW4A4量子化
- KVキャッシュもNVFP4でさらにメモリ節約
- 非同期VAEデコードとの統合でパイプライン効率化
- 動画生成特有の長シーケンスに対応した並列実装

## 評価

- 対象モデル: 長尺動画生成モデル（LongLive-2.0系）
- ビット幅: W4A4 (NVFP4)、KV NVFP4
- 精度劣化: 動画品質への影響は論文で報告
- スループット/メモリ: Blackwell上でプロダクション対応レベル

## HF Papersでの注目度

- upvote数: 2110（今週最大。量子化論文としては異例の注目度）
- コメントの傾向: 動画生成コミュニティと量子化コミュニティ双方からの反響

## 注目度コメント

`NVFP4`（focus method）かつ`kv-cache-quant`（focus tech）。Blackwellでの量子化実用化事例として。2110 upvotes は今週断トツ。
