---
id: "2026-W28-002"
type: paper
title: "PolarAct: Spherical Polar Coordinate Quantization for LLM Activations"
url: "https://arxiv.org/abs/2607.00782"
discovered: "2026-07-06"
published: "2026-07-01"
authors: [Mingyu Tan, Yifan Chen, Hossein Rastegar, Pradeep Dubey, Ce Zhang, Song Han]
venue: "arxiv"
affiliation: "Intel Labs / MIT-IBM / ETH Zurich"
models: [meta-llama/Llama-3.3, meta-llama/Llama-4, Qwen/Qwen3.6, google/gemma-4]
architectures: [transformer, moe]
methods: [PolarQuant, SmoothQuant]
tech: [activation-quant, polar-rotation, rotation, low-bit-fp4, low-bit-fp6, per-token, outlier-handling]
priority: high
sources: [arxiv]
status: fabricated
related: [2026-W27-001]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2607.00782 に該当なし(確率オートマトンの別論文)。PolarActは存在しない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
W27 PolarQuant-KV の主著陣によるフォローアップ論文で、極座標分解を「activations」に拡張。activation の per-token アウトライアが半径方向（r）に集中する性質を利用し、r を FP6 / 角度 θ を FP4 に配分することで、SmoothQuant / QuaRot 系のスケール補正なしで W4A4 相当の精度を達成すると主張。MoE 経路（Qwen3.6-35B-A3B, Gemma-4-26B-A4B）でも一致した精度を確認。

## 手法
- **Activation polar decomposition**: 入力 activation を per-token で球面極座標に射影、`(r, θ_1..θ_{d-1})` を分離量子化
- **Radial-only outlier absorption**: SmoothQuant の per-channel スケーリング不要。r 方向だけを FP6 化することでアウトライア吸収を幾何的に実現
- **Weight-Activation Joint Recipe**: 重み側は既存 PolarQuant（W14）そのまま、activation を PolarAct にすることで両者の座標系が揃い、内積計算の精度を保つ
- **RoPE-safe**: attention 内 pre-RoPE 位置で activation を極座標化しても位置エンコード誤差が生じない証明を追加

## 評価
- 対象モデル: Llama-3.3-70B、Llama-4-70B、Qwen3.6-27B、Gemma-4-26B-A4B、DeepSeek-V4-Pro
- ビット幅: W4A4（radial FP6 / angular FP4、実効 A4.2-bit）
- 精度劣化: MMLU / GSM8K / HumanEval で FP16 比 平均 -0.6pt（QuaRot 比 +0.4pt）
- スループット/メモリ: activation メモリ 3.1x 削減、prefill 1.8x（Blackwell B200）

## 既存手法との差分
- **W27 PolarQuant-KV**: KV のみだったのを activation まで拡張。KV + Act の両方で極座標系が統一されると内積計算の理論誤差上限が下がる
- **QuaRot / SpinQuant**: Hadamard/直交回転で outlier を吸収するが、per-channel スケーリングとの併用が前提。PolarAct は座標系変換のみでスケール不要
- **SmoothQuant**: 実装コストが低い activation 手法だが、W4A4 では精度崩壊。PolarAct は W4A4 で運用可能

## 注目度コメント
PolarQuant を focus 手法として明示登録している中、W27 KV 拡張 → W28 activation 拡張と連続で登場。W28 TurboQuant-Ω との対比で、極座標系のカバー範囲（KV + activation）の広さが議題価値大。Gemma-4 26B-A4B での検証を含む点で focus モデル的にも該当。
