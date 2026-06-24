---
id: "2026-W26-008"
type: paper
title: "Mix-QVLA: Task-Evidence-Aware Mixed-Precision Quantization of Vision-Language-Action Models"
url: "https://arxiv.org/abs/2606.19565"
discovered: "2026-06-22"
published: "2026-06-17"
authors: [Navin Ranjan, Andreas Savakis]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [vla-quant, mixed-precision, ptq, low-bit-4, activation-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
ロボティクス向けVision-Language-Action（VLA）モデルへの混合精度PTQ手法。量子化後にタスク証拠（task-evidence）が保持されているかをaction-tokenの全精度参照決定に対してアンカリングし、勾配重み付きタスク証拠マップで比較することで層ごとの感度スコアを算出。エビデンス強度（mass）と帰因分布歪み（distribution distortion）の2軸でビット幅を最適化。OpenVLA-OFTでLIBERO benchmark評価。メモリ15.4GB→4.1GBへの削減と1.52倍の推論高速化を実現しながら成功率97.1%→96.3%に抑制。

## 手法
- **Gradient-Weighted Task-Evidence Map**: 全精度モデルと量子化モデルの活性化を比較してタスク証拠の保持を評価
- **Evidence-Mass & Attribution-Distribution Distortion**: 証拠の強度変化と分布変化の2軸で量子化損失を特性評価
- **Soft-Bottleneck Objective**: 境界レベルの劣化を層感度スコアに変換
- **Phase-Dependent Sensitivity**: タスク実行段階（知覚→計画→実行）に応じた感度プロファイリング

## 評価
- OpenVLA-OFT on LIBERO benchmark
- メモリ: 15.4 GB → 4.1 GB（2.7x削減）
- 推論速度: 1.52x高速化
- 成功率: 97.1% → 96.3%（0.8%ポイント損失）

## 既存手法との差分
VLAモデル特有のaction-tokenへの影響を中心に量子化感度を評価する点が独自。汎用PTQ手法の適用では見落とされるアクション実行への影響を明示的に考慮。

## 注目度コメント
vla-quantはtaxonomyのtech項目。ロボティクス・エンボディドAI向けVLAの量子化は新興領域。W24以降のvla-quant論文の継続。メモリ2.7x削減は実デプロイ（エッジロボット等）で意義大きい。
