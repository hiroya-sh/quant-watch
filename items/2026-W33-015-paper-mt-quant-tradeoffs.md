---
id: "2026-W33-015"
type: paper
title: "Studying quantization trade-offs for efficient inference deployment in machine translation"
url: "https://arxiv.org/abs/2607.29397"
discovered: "2026-08-10"
published: "2026-07-31"
authors: [Jim Zhao, Sohir Maskey, Koen Oostermeijer]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [SmoothQuant, AWQ]
tech: [weight-only, activation-quant, low-bit-4, low-bit-8]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
翻訳モデルの量子化がオーケストレーションレベルの実負荷下でレイテンシ/スループットに与える影響を検証。EuroLLMとHy-MT2の2系統(1.7B〜22B)を単一A100/H100で評価。

## 手法
document-chunking戦略とW4A8/W8A8量子化を組合せた実サーバ環境ベンチ。品質と実効スループットの両面を統制条件下で測定。

## 評価
- 対象モデル: EuroLLM, Hy-MT2 (1.7B–22B)
- ビット幅: W4A8 / W8A8
- 精度劣化: 品質維持しつつ効率化(条件依存)
- スループット/メモリ: 単一A100/H100でのレイテンシ/スループット

## 既存手法との差分
理論精度中心の量子化評価に対し、実運用オーケストレーションでのレイテンシ/スループットを測る。

## 注目度コメント
Hy-MT2(W31で登録候補に挙がったtencent Hy系)を実機評価。W4A8/W8A8の実負荷比較は実務的。
