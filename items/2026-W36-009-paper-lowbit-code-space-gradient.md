---
id: "2026-W36-009"
type: paper
title: "Fine-Tuning Low-Bit Models with Gradient in Quantized Code Space"
url: "https://arxiv.org/abs/2608.30908"
discovered: "2026-09-01"
published: "2026-08-31"
venue: "arXiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [qat, low-bit-4, weight-only]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
低ビットモデルのファインチューニングは、最終的にデプロイするチェックポイントを同じ低ビット形式に保ったまま量子化モデルを適応させること。この設定では適応は「量子化コードとスケールに対する最適化問題」になる。既存の連続的な低ビット学習は効率的だが、straight-through estimator の誤差や post-quantize gap で歪む。離散探索は deployment-faithful だが有限の学習予算下では非効率すぎる。

## 手法
**code surrogate gradient** をデプロイ可能なコード空間の1次信号として用いて最適化を加速し、guided search でデプロイ忠実性を保つ。

## 評価
- 算術推論、指示追従、構造化言語のタスク群

## 既存手法との差分
連続緩和(STE)と離散探索の中間。コード空間で勾配相当の信号を作る。

## 注目度コメント
QLoRA 的な「量子化ベース + 高精度アダプタ」ではなく、**出荷形式そのものを低ビットに保つ**方向。auto-round v0.15.0 の model-free WOQ / MXFP scale 探索とも文脈が近い。
