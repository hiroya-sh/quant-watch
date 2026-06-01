---
id: "2026-W23-002"
type: paper
title: "HARP: Hadamard-Preconditioned Adaptive Rotation Processor for Extreme LLM Quantization"
url: "https://arxiv.org/abs/2605.29843"
discovered: "2026-06-01"
published: "2026-05-28"
authors: [Artur Zagitov, Gleb Molodtsov, Aleksandr Beznosikov]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [rotation, low-bit-4, low-bit-2, calibration, ptq, weight-only, activation-quant]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
固定ランダム直交変換（SpinQuant/QuaRot等）を超える学習可能な回転基底を導入するPTQ手法。キャリブレーションデータを用いて各層ごとにHadamard前処理＋適応回転を学習し、2〜4ビット量子化での外れ値問題を効果的に抑制。1Bから70Bモデルまで一貫してperplexity・zero-shot精度が改善。FP16比で128 tok/s（元61 tok/s）と約2倍のスループット。

## 手法
Hadamard行列をベースにした回転前処理に学習可能な成分を追加。各線形層に対して個別の回転基底をキャリブレーション中に最適化する。固定ランダム回転（SpinQuant: Hadamard+ランダム行列）と異なり、データ適応的に外れ値を均一化できる。

## 評価
- 対象モデル: 1B〜70Bパラメータの複数LLMファミリー
- ビット幅: 2〜4ビット（W4A4, W2A2等）
- 精度劣化: 固定回転手法比で改善（perplexity・zero-shot両方）
- スループット/メモリ: 128 tok/s vs FP16 61 tok/s（約2.1x）

## 既存手法との差分
SpinQuant・QuaRotは回転行列を固定（ランダム初期化後最適化なし or Hadamard固定）。HARPはHadamard前処理を保ちつつ残差部分を学習可能にすることで、より適切な外れ値分散を実現。

## 注目度コメント
TurboQuant・PolarQuant・QJLがfocusメソッドだが、HARPは「rotation-basedをさらに進めた」手法として直接比較対象になる可能性あり。2-bit量子化の改善も注目点。
