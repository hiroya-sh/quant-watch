---
id: "2026-W23-011"
type: paper
title: "JacQuant: STE-Free Quantization-Aware Training via Learned Jacobian Surrogates"
url: "https://arxiv.org/abs/2605.25469"
discovered: "2026-06-01"
published: "2026-05-25"
authors: [Kai Yi, Vignesh Vivekraja, Harshit Khaitan, Steven Li]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [qat, low-bit-2, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Straight-Through Estimator（STE）の代わりに軽量なJacobianサロゲートモデルを学習する量子化認識訓練フレームワーク。STE由来の勾配バイアスを解消することで、特に≤2ビットの超低ビット量子化で精度改善を実現。LLMベンチマークで既存のSTE系QATを上回り、追加計算コストは無視できる程度。

## 手法
量子化演算の真の勾配（Jacobian）を軽量サロゲートネットワークで近似し、STE特有の「勾配が常に1」という近似誤差を排除。サロゲートはキャリブレーションデータで事前学習し、QAT本訓練時の計算オーバーヘッドを最小化。

## 評価
- 対象モデル: LLMファミリー（詳細は要確認）
- ビット幅: ≤2ビット（主に2-bit）
- 精度劣化: STE系QATより改善（ベンチマーク複数）
- スループット/メモリ: 追加コスト微小

## 既存手法との差分
STE（すべてのQAT手法の基盤）を根本から置換。WINDQuant（RL系）と異なり勾配推定に特化。超低ビット（1〜2bit）の信頼性向上への寄与が大きい。

## 注目度コメント
2ビット以下のQATが実用化できるかは重要テーマ。JacQuantの手法は他の量子化手法と直交的に組み合わせ可能な可能性あり。
