---
id: "2026-W36-017"
type: paper
title: "A Layer Importance Metric for Quantization Accounting for the Speed-Quality Trade-off in Autoregressive Models"
url: "https://arxiv.org/abs/2608.26926"
discovered: "2026-09-01"
published: "2026-08-27"
venue: "arXiv (cs.LG)"
models: [google/gemma-3]
architectures: [transformer]
methods: []
tech: [mixed-precision, weight-only, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
小型言語モデル (sLLM) はメモリ・計算予算の限られたデバイスに載る。自己回帰の推論はメモリ帯域律速で、一様量子化はしばしば有害 — アーキテクチャの冗長性が小さく、低精度に鈍感な層がごく少数しかないため。

## 手法
直交する2基準を組み合わせた複合指標を提案:
- **情報保持**: 正規化した SQNR ベースの係数
- **スループット利得**: roofline ベースのレイテンシ解析でモデル化

## 評価
- **Gemma 3 1B** をプロファイルした結果、**FFN ブロックと埋め込み行列が加速の最有望ターゲット**
- 候補ごとにシミュレート量子化から正規化品質スコア、roofline から正規化速度スコアを推定

## 既存手法との差分
「精度感度だけ」でも「速度だけ」でもなく、両者を正規化して合成した層重要度。

## 注目度コメント
[[items/2026-W36-014-paper-layer-bitwidth-allocation-trtllm|W36-014]] と同じ Gemma 3 1B・同じ問題設定が同週に別グループから。小型モデルの mixed-precision は「FFN と embedding を狙う」で概ね一致している。
