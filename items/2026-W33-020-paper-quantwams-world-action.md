---
id: "2026-W33-020"
type: paper
title: "QuantWAMs: Calibrating at the Right Granularity for World Action Models"
url: "https://arxiv.org/abs/2607.28405"
discovered: "2026-08-10"
published: "2026-07-30"
authors: [Jiacheng Zhou, Jinfan Lv, Ruixuan Li]
venue: "arXiv"
models: []
architectures: [transformer]
methods: []
tech: [ptq, vla-quant, calibration, outlier-handling]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
World Action Models(WAM)は将来観測と行動を同時予測するが、反復的デノイズと閉ループ実行で配備コストが高い。既存PTQは開ループ目的・均質モデル仮定・配備を反映しない校正分布に依存しWAMに不向き。

## 手法
QuantWAMsはモデル構造・ロールアウト分布・タスク目的で定まる校正コンテキストに量子化判断を整合。shared-basis外れ値校正など3戦略を導入。

## 評価
- 対象モデル: World Action Models
- ビット幅: PTQ
- 精度劣化: 校正粒度の適正化で閉ループ精度維持
- スループット/メモリ: WAM配備コスト削減

## 既存手法との差分
開ループ校正の既存PTQに対し、閉ループ実行・ロールアウト分布を反映した校正を採用。

## 注目度コメント
VLA/WAMへの量子化拡張(vla-quant)。ロボ/身体性AI領域だが量子化校正の粒度議論は汎用性あり。
