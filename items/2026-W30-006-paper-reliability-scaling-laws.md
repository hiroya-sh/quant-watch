---
id: "2026-W30-006"
type: paper
title: "Reliability Scaling Laws for Quantized Large Language Models"
url: "https://arxiv.org/abs/2607.10855"
discovered: "2026-07-20"
published: "2026-07-12"
authors: []
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [ptq, low-bit-2, low-bit-3, low-bit-4]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
量子化 LLM の「摂動入力に対する信頼性」を体系評価し、スケーリング則として整理した研究。6種類の量子化手法で 2/3/4/8bit に量子化したモデルについて、(1) 不確実性(確立された uncertainty 指標での信頼性評価)を含む3要素で reliability を測定。クリーン入力の標準指標では見えない量子化の劣化モードを明らかにする。

## 手法
評価研究+スケーリング則の当てはめ。ビット幅×手法×摂動強度のグリッドで信頼性指標を測定。

## 評価
- 対象モデル: 複数 LLM(本文参照)
- ビット幅: 2 / 3 / 4 / 8 bit、6手法
- 精度劣化: 摂動下の信頼性劣化がクリーン性能より急峻
- スループット/メモリ: N/A(信頼性評価)

## 既存手法との差分
量子化評価を perplexity / タスク精度から「摂動頑健性・不確実性校正」へ拡張し、ビット幅に対する法則性を示す点。

## 注目度コメント
量子化モデルを本番投入する際の評価軸として有用。vLLM 評価ポリシーの摂動テスト設計の参考になる。normal。
