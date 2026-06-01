---
id: "2026-W23-009"
type: paper
title: "QAM-W: Joint 2D Codebook Quantization for LLM Weights via Hadamard Rotation and Activation-Aware Scaling"
url: "https://arxiv.org/abs/2605.26339"
discovered: "2026-06-01"
published: "2026-05-25"
authors: [Preetam Sharma, Kacper Dobek]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [weight-only, rotation, outlier-handling, calibration, mixed-precision]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
重み行の座標ペア構造を保持する2Dコードブック量子化手法。L2正規化＋ブロックHadamard回転で重みを変換後、2次元コードブックで量子化することでビット数を削減しながら精度を維持。~5.5 bpwでBF16のWikiText-2 perplexityとの差±0.4%以内。SmoothQuant W8A8と同等精度を大幅に少ないビット数で実現。

## 手法
重み行にL2正規化を適用してHadamard回転後、行の要素ペア（2D）を共同コードブックで量子化。活性化統計を利用したスケーリングで量子化フレンドリーな重み分布に変換。1D量子化より情報密度が高く、同ビット幅でより高精度。

## 評価
- 対象モデル: 1.1B〜13Bパラメータ、4ファミリー5モデル
- ビット幅: 3.5〜5.5 bits per weight
- 精度劣化: BF16比 WikiText-2 ±0.4%以内（5.5bpw時）
- スループット/メモリ: 要確認

## 既存手法との差分
SmoothQuant（W8A8）と同等精度を5.5bpwで実現。QuIP#等のベクトル量子化と概念は近いが、2Dペア構造の保持とHadamard前処理の組み合わせが特徴。

## 注目度コメント
5.5bpwという中間的ビット幅設定が実用的。Hadamard回転を使う系統の手法として関連手法（QAM-W, HARPなど）が同週に複数出現。
