---
id: "2026-W26-001"
type: paper
title: "MODE: Modality-Decomposed Expert-Level Mixed-Precision Quantization for MoE Multimodal LLMs"
url: "https://arxiv.org/abs/2606.17118"
discovered: "2026-06-22"
published: "2026-06-15"
authors: [Yuanteng Chen, Peisong Wang, Zhilei Liu, Nanxin Zeng, Yuantian Shao, Shiqiang Lang, Tao Liu, Chuangyi Li, Qinghao Hu, Gang Li, Jing Liu, Jian Cheng]
venue: "arxiv"
models: []
architectures: [transformer, moe]
methods: []
tech: [moe-quant, mixed-precision, ptq, weight-only, activation-quant, per-channel]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
マルチモーダルMoEモデルへの混合精度PTQ手法。既存のエキスパート重要度推定が視覚トークン偏重と視覚内容の冗長性により歪むという問題を発見し、「モダリティ分解頻度分析」で視覚・テキストトークンへの各エキスパートの寄与を分離推定。さらに視覚冗長トークンのフィルタリング機能と、周波数ベース評価の補完として各モダリティの量子化感度を組み合わせ、整数線形計画でビット幅を最適配分。W3A16で平均性能損失2.9%以内を実現。

## 手法
- **Modality-Decomposed Frequency Analysis**: 視覚・テキストそれぞれのcalibrationデータからエキスパート選択頻度を分離算出
- **Vision Token Filtering**: 視覚入力中の冗長トークンを除去してよりクリーンな頻度統計を取得
- **Per-Modality Sensitivity**: 各モダリティでの量子化感度を周波数ベース評価の補完信号として利用
- **ILP Bit-width Assignment**: エキスパート重要度スコアをもとにビット幅を整数線形計画で最適化

## 評価
- MoEマルチモーダルLLMで検証
- W3A16でベースラインとの平均性能差2.9%以内
- 2-bit量子化でもさらに性能改善が見られると報告

## 既存手法との差分
従来のエキスパート重要度推定がテキスト/視覚の偏りを無視していたのに対し、モダリティ分解で各エキスパートへの寄与を分離評価。視覚冗長排除との組み合わせで統計品質を向上。

## 注目度コメント
moe-quantがfocus。マルチモーダル化が進むMoEモデル（Gemma 4 MoE、DeepSeek-V4マルチモーダル系）に対する量子化の実用化において重要なギャップを埋める。W24 MoQAEとのアプローチ比較が議題候補。
