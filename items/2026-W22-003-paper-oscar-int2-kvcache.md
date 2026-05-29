---
id: "2026-W22-003"
type: hf-paper
title: "OScaR: The Occam's Razor for Extreme KV Cache Quantization in LLMs and Beyond"
url: "https://huggingface.co/papers/2605.19660"
arxiv_url: "https://arxiv.org/abs/2605.19660"
discovered: "2026-05-21"
published: "2026-05-19"
authors: [Zunhai Su, Rui Yang, Chao Zhang]
hf_upvotes: 39
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-2, rotation, outlier-handling, per-token]
priority: high
sources: [hf-papers, arxiv]
status: new
related: ["2026-W22-001", "2026-W22-005", "2026-W22-013"]
---

## 日本語要約

KVキャッシュのToken Norm Imbalance（TNI）という課題を特定し、これを解決するOScaR（Omni-Scaled Canalized Rotation）を提案。Canalized Rotation + Omni-Token Scalingの組み合わせでINT2量子化をほぼ無損失で達成。BF16 FlashDecoding-v2比で最大3.0×デコード高速化、5.3×メモリ削減、4.1×スループット向上。テキスト・マルチモーダル・オムニモーダルLLMに対応。

## 手法

- Token Norm Imbalance (TNI): トークン間のKV normのばらつきがINT2量子化の主障害と特定
- Canalized Rotation: 回転行列でKVの方向分布を均一化
- Omni-Token Scaling: トークン横断のスケーリングでnormのばらつきを吸収
- データ依存のCalibrationなし（Calibration-free）

## 評価

- 対象モデル: 各種LLM（text/multimodal/omnimodal）
- ビット幅: KV = INT2
- 精度劣化: ほぼ無損失（論文中で詳細）
- スループット: BF16比4.1×向上、メモリ5.3×削減

## 既存手法との差分

OSCAR (2605.17757) と同週公開の競合手法。OSCARがオフラインCovariance推定ベースなのに対し、OScaRはTNI概念を新たに定義してCalibration-freeで対応。手法の哲学が異なる。

## 注目度コメント

`kv-cache-quant`（focus）＋INT2達成。OSCAR (2026-W22-001) との比較議論が火曜定例の議題に最適。39 HF upvotes。
