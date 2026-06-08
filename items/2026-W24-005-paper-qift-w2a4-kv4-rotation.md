---
id: "2026-W24-005"
type: paper
title: "Qift: Shift-Friendly No-Zero W2 Post-Training Quantization for Rotated W2A4/KV4 LLM Inference"
url: "https://arxiv.org/abs/2606.02823"
discovered: "2026-06-08"
published: "2026-06-01"
authors: [Chi-Wei Huang, Chia-Chi Tsai]
venue: "arxiv"
models: [meta-llama/Llama-3.1]
architectures: [transformer]
methods: []
tech: [kv-cache-quant, rotation, low-bit-2, low-bit-4, calibration-free, per-channel, outlier-handling]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
W2A4/KV4という超積極的な量子化設定でのPTQ手法。標準的なW2量子化のレベルセット{-2,-1,0,+1}がW2A4/KV4設定下でゼロが崩壊することを分析。事前学習済み重みは「ほぼゼロ中心」であり、Hadamard回転でガウス化されることを理論的に示す。ゼロを除いた固定レベルセット{±0.5, ±1.5}を採用するQiftを提案。学習済みコードブックなし・訓練なしで一貫した改善を実現。

## 手法
- 問題分析: ゼロを含むW2レベルセットは回転後の重みで特に崩壊する
- 解決: No-zero level set {±0.5, ±1.5}を固定採用（偶数対称でハードウェア効率高）
- ハードウェア実装: シフト演算のみで実現可能（"shift-friendly"）
- 組み合わせ: Hadamard回転 + 非対称量子化と組み合わせて使用

## 評価
- 対象モデル: LLaMA-2-7B、LLaMA-3.1-8B
- 設定: W2A4/KV4（重み2bit、活性化4bit、KV4bit）
- 結果: パープレキシティ・ダウンストリーム精度で標準W2より一貫して改善
- 追加コスト: 学習なし・校正データなし

## 既存手法との差分
QuaRot/QuIP等のrotation系はW4が主体。本手法はrotation+W2+KVの三者同時量子化に特化した最初の実用的フレームワーク。No-zero level setという単純な変更で効果的。

## 注目度コメント
kv-cache-quantとrotationが両方focus。W2という2bitへのアグレッシブな量子化にKV4を組み合わせる実用的アプローチ。TurboQuant/PolarQuant（focus手法）との比較として定例で取り上げたい。
