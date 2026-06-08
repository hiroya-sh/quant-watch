---
id: "2026-W24-002"
type: paper
title: "AlphaQ: Calibration-Free Bit Allocation for Mixture-of-Experts Quantization"
url: "https://arxiv.org/abs/2606.04980"
discovered: "2026-06-08"
published: "2026-06-03"
authors: [Wanqi Yang, Yuexiao Ma, Alexander Conzelmann, Xiawu Zheng, Michael W. Mahoney, T. Konstantin Rusch, Shiwei Liu]
venue: "arxiv"
models: []
architectures: [transformer, moe]
methods: []
tech: [moe-quant, calibration-free, mixed-precision, ptq, block-wise]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MoEモデルのメモリ削減を目的とした校正データ不要の混合精度量子化手法。Heavy-Tailed Self-Regularization（HT-SR）理論を活用し、各Expertの重みスペクトル特性（Power-Law指数）からビット幅を決定する。校正データが不要なためプロプライエタリなモデルにも適用可能。Qwen1.5-MoEで平均3.5ビットの精度を保ちながら4倍のメモリ圧縮を達成。

## 手法
- HT-SR理論: 重みのべき乗則（Power-Law）指数が強いExpertはより良い学習状態にあると判定
- ビット割当: 指数が強いExpert → 高精度（多ビット）、弱いExpert → 低精度（少ビット）
- グローバル予算制約の下で量子化誤差を最小化する最適化問題として定式化
- キャリブレーションデータ不要（重みのスペクトル解析のみ）

## 評価
- 対象モデル: Qwen1.5-MoE（3.5-bit平均で全精度相当の精度）
- ビット幅: 混合精度（平均3.5bit）
- メモリ圧縮: 4倍
- 精度: 校正依存ベースラインを上回る

## 既存手法との差分
校正データ依存の既存MoE量子化手法（MxMoE, MoQAE等）を超え、データなしでspectrumから精度を推定。プロプライエタリMoEモデルへの応用可能性が高い。

## 注目度コメント
moe-quantとcalibration-freeが両方focus技術。HT-SR理論の適用は量子化分野では新鮮。Kimi-K2/DeepSeek-V4等の大型MoEへの適用可能性について定例で議論したい。
