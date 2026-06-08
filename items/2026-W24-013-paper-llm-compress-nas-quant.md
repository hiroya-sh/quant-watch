---
id: "2026-W24-013"
type: paper
title: "LLM Compression with Jointly Optimizing Architectural and Quantization Choices"
url: "https://arxiv.org/abs/2606.04063"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Hoang-Loc La, Truong-Thanh Le, Amir Taherkordi, Phuong Hoai Ha]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [mixed-precision, ptq, calibration, per-channel]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
アーキテクチャ選択と量子化ビット幅を同時に最適化する微分可能NASフレームワーク。線形層のアーキテクチャ設定（ヘッド数、FFN幅等）と各層の混合精度量子化ビット幅を統一探索空間で共同最適化。逐次的NAS→量子化に対し最大1.4x高速推論または同等レイテンシで7タスク平均最大6%精度向上。

## 手法
- 微分可能NAS: アーキテクチャ係数と量子化ビット幅を連続パラメータで表現
- 共同最適化: アーキテクチャ探索と量子化探索を分離せず統一目標で学習
- 対象: トランスフォーマー線形層（アーキテクチャ+ビット幅の二重自由度）

## 評価
- 対象: 複数LLMファミリー（具体モデル名は論文参照）
- 結果: 逐次最適化比で1.4x推論速度向上（同精度条件）
- 精度: 同レイテンシ条件で最大6%向上

## 既存手法との差分
アーキテクチャとビット幅の同時最適化は新規。既存NAS＋量子化の逐次アプローチより探索空間の活用が効率的。

## 注目度コメント
NAS×quantizationの共同最適化は今後の研究方向として注目。実用化にはサーチコストの課題が残る。
