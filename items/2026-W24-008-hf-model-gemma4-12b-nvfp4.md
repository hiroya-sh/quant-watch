---
id: "2026-W24-008"
type: hf-model
title: "AxionML/Gemma-4-12B-NVFP4"
url: "https://huggingface.co/AxionML/Gemma-4-12B-NVFP4"
discovered: "2026-06-08"
published: "2026-06-04"
base_model: "google/gemma-4-12B-it"
models: [google/gemma-4]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, kv-cache-quant]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
2026年6月3日リリースのGemma 4 12B（Googleの新マルチモーダル11.95Bパラメータモデル）をNVFP4量子化したコミュニティ版。AxionMLが公開。MLP層のみW4A4でFP4量子化し、Attention層（Q/K/V/O）はBF16を維持（Gemma4はactivation外れ値がattentionに集中するため）。KVキャッシュはFP8。BF16比でモデルサイズ約50%削減（24GB→11GB）。NVIDIA TensorRT Model Optimizer v0.45.0使用。

## 量子化仕様
- ベースモデル: google/gemma-4-12B-it（256Kコンテキスト、マルチモーダル）
- 量子化手法: NVFP4 (E2M1 FP4 w/ FP8 E4M3ブロックスケール、16要素マイクロブロック)
- 対象層: MLP/FFN層のみ（Attention層はBF16のまま）
- KVキャッシュ: FP8 (E4M3)、キャリブレーション済み
- モデルサイズ: 約11GB（BF16比約50%削減）
- ツール: nvidia-modelopt v0.45.0.dev158+
- ターゲットハードウェア: Blackwell (B100/B200/B300, sm_100/103/120)

## 精度報告
- キャリブレーションデータ: CNN DailyMail + nvidia/Nemotron-Post-Training-Dataset-v2
- Attention残留はBF16なのでMLP起因の精度劣化が主要評価対象

## ダウンロード/利用状況
Gemma 4 12Bリリース翌日の即日量子化対応。256Kコンテキスト+マルチモーダルのままFP4運用可能。Blackwellでの効率推論路線の継続。コレクションにFP8版も同時公開。

## 注目度コメント
NVFPとgoogle/gemma-4（focus model）の組み合わせ。Gemma 4 12B発表週にNVFP4版が即日対応したことは注目すべき速度。Attention outliersのためMLP限定量子化という設計判断は定例で共有する価値あり。
