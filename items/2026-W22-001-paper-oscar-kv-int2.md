---
id: "2026-W22-001"
type: paper
title: "OSCAR: Offline Spectral Covariance-Aware Rotation for 2-bit KV Cache Quantization"
url: "https://arxiv.org/abs/2605.17757"
discovered: "2026-05-18"
published: "2026-05-18"
authors: [Zhongzhu Zhou, Donglin Zhuang, Jisen Li]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-2, rotation, calibration, outlier-handling]
priority: high
sources: [arxiv, hf-papers]
status: new
hf_upvotes: 187
related: ["2026-W22-003", "2026-W22-005", "2026-W22-013"]
---

## 日本語要約

KVキャッシュをINT2（2ビット）まで圧縮するPTQ手法。Attention中のCovariance構造をオフライン推定し、そこから固定回転行列とクリッピング閾値を導出する。独自INT2 Attentionカーネルを実装し、KVメモリ約8×削減・大バッチ時最大7×スループット向上を実証。SGLang/vLLM対応の実用システムとして公開。

## 手法

- AttentionのQueryを利用してKV分布のCovarianceをオフラインで推定（ランタイムオーバーヘッドなし）
- Hadamard的回転でActivation分布を整形し、INT2量子化誤差を低減
- チャネルごとのクリッピング閾値を共分散から自動導出（外れ値対策）
- カスタムINT2 Attentionカーネル（CUDA）で推論時のオーバーヘッドをほぼゼロに

## 評価

- 対象モデル: Llama-3 系、Mistral 系
- ビット幅: KV = INT2
- 精度劣化: 未記載（要確認）
- スループット: 大バッチで最大7×向上、KVメモリ8×削減

## 既存手法との差分

PolarQuant・TurboQuant系と異なり、回転行列を学習せずCovariance推定のみで導出するためCalibration-freeに近い運用が可能。KVQuant比で実用デプロイ性を重視。

## 注目度コメント

`kv-cache-quant`（focus）＋2ビット超低精度の実用システム。187 HF upvotes。SGLang/vLLM直接対応は実装コストが低く火曜定例で紹介価値高い。
