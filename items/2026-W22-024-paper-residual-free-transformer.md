---
id: "2026-W22-024"
type: paper
title: "The Quantization Benefits of Residual-Free Transformers"
url: "https://arxiv.org/abs/2605.25880"
discovered: "2026-05-25"
published: "2026-05-25"
authors: [Yiping Ji, Mahalakshmi Sabanayagam, Peyman Moghadam]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [activation-quant, rotation, low-bit-4, calibration-free]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

残差接続（Residual Connection）がActivationのガウス性を破壊し、低ビット量子化精度を低下させることを理論・実験両面で示す。Residual-freeトランスフォーマー（残差接続を除去した設計）と直交初期化・スペクトル最適化の組み合わせで量子化ロバスト性を大幅改善。アーキテクチャ設計段階での量子化耐性向上という新アプローチ。

## 手法

- 残差接続の量子化への影響を理論分析: 訓練中にActivationの非ガウス性が強まるメカニズムを解明
- Residual-freeアーキテクチャ + 直交初期化 + スペクトル最適化
- 低ビット量子化ロバスト性を事前に埋め込む設計

## 評価

- 対象モデル: Transformer（言語・画像）
- ビット幅: 低ビット（詳細は論文）
- 精度劣化: 標準Transformer比で大幅に量子化ロバスト性向上
- スループット/メモリ: アーキテクチャ変更の計算コスト増なし

## 既存手法との差分

既存手法は既訓練モデルへのPTQ/QATが中心だが、本手法はアーキテクチャ設計段階で量子化耐性を組み込む。新規モデル設計への示唆。
