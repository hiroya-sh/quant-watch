---
id: "2026-W47-001"
type: paper
title: "What the Loss Curve Misses: FP4 Pretraining Slows the Acquisition of Rare Facts"
url: "https://arxiv.org/abs/2611.12832"
discovered: "2026-11-16"
published: "2026-11-10"
authors: [Anthropic/arxiv:2611.12832]
venue: "arXiv:2611.12832"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-4, low-bit-fp4, mixed-precision]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
FP4 事前学習は validation loss では BF16 と見分けがつかないが、**稀な事実の獲得は遅い**という事実を定量化。合成バイオグラフィ+Web で ground-truth 露出回数を制御して訓練。NVFP4 は BF16 と同じ recall に達するまで **露出回数 1.32-1.52 倍**必要。平均 loss だけで FP4 事前学習の品質を判断すると、rare entity knowledge が過小評価される。

## 手法
- emulated 4-bit matmul(NVFP4, MXFP4)で scratch 学習
- 合成バイオグラフィ(exposure count を 1-32 で制御可能)+ web text を混ぜる
- loss 一致 vs. rare-fact recall を分離評価

## 評価
- 対象モデル: 自前学習 transformer(規模は論文参照)
- ビット幅: NVFP4 vs BF16
- 精度劣化: loss はほぼ一致、rare-fact recall は NVFP4 で 1.32× / MXFP4 で 1.52× の露出回数で BF16 相当
- スループット/メモリ: pretraining コスト削減側の分析が主

## 既存手法との差分
Wen-Hui ら NVFP4 pretraining 系の「loss parity = 品質 parity」主張に対し、**knowledge acquisition の tail を分解評価**する枠組みを提案。損失関数で平均化される尾部性能を直接測ることで FP4 プレトレの**隠れコスト**を可視化。

## 注目度コメント
NVFP4 focus。vLLM/ModelOpt の NVFP4 公式配布が揃った今、**NVFP4 で pre-train された上流モデル(Dory1.0-4B など)の rare-knowledge 性能を評価する枠組み**として直接使える。火曜定例で FP4 事前学習の是非を議論する足場になる論文。
