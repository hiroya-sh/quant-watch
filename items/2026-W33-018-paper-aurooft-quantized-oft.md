---
id: "2026-W33-018"
type: paper
title: "Beyond Rotations: AuroOFT for Expressive Quantized Orthogonal Fine-Tuning"
url: "https://arxiv.org/abs/2608.05253"
discovered: "2026-08-10"
published: "2026-08-05"
authors: [Yue Han, Dianlin Wang]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [SpinQuant]
tech: [rotation, weight-only, low-bit-4, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
量子化直交ファインチューニング(qoft)は凍結量子化重みの前に構造化活性回転を学習しパラメータ効率的に低bitモデルを適応するが、更新が線形直交変換に限られ入力依存の非線形補正ができない。

## 手法
AuroOFTはqoftを安定な量子化互換ブランチとして残しつつ、各適応線形層にzero-startのゲート付き低ランク非線形残差を付加。活性をRMS正規化コンパクト潜在空間に写し適応非線形基底で補正。

## 評価
- 対象モデル: 低bit LLM
- ビット幅: low-bit(4bit級) weight + 適応残差
- 精度劣化: 非線形補正で表現力向上
- スループット/メモリ: パラメータ効率的な適応

## 既存手法との差分
線形直交変換に限る既存qoftに、非線形低ランク残差を追加して表現力を拡張。

## 注目度コメント
量子化モデルのタスク適応(qoft)の表現力拡張。低bitモデルの下流適応に有用。
