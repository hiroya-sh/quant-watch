---
id: "2026-W22-022"
type: paper
title: "InfoQuant: Shaping Activation Distributions for Low-Bit LLM Quantization"
url: "https://arxiv.org/abs/2605.26175"
discovered: "2026-05-25"
published: "2026-05-25"
authors: [Ke Li, Dong An, Xiaoling Zang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [activation-quant, kv-cache-quant, low-bit-4, rotation, outlier-handling, full-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

W4A4KV4という全成分4ビット量子化においてFP精度の97%を平均で達成するInfoQuantを提案。Peak Suppression Orthogonal Transformation（PSOT）でActivationを量子化しやすい形に整形し、適応的な外れ値トークン選択も導入。LLaMA-2 13BでW4A4KV4の精度劣化を先行手法比42%削減。

## 手法

- PSOT (Peak Suppression Orthogonal Transformation): Activationのピークを抑制する直交変換
- 適応的外れ値トークン選択: 量子化に悪影響を与えるトークンを特定して混合精度処理
- W4A4KV4の同時最適化（重み・Activation・KVキャッシュ全て4ビット）

## 評価

- 対象モデル: LLaMA-2 13B（他のLLMも評価）
- ビット幅: W4A4KV4（全成分4ビット）
- 精度劣化: FP比97%を達成、先行手法比42%削減
- スループット/メモリ: 未記載

## 既存手法との差分

W4A4KV4は量子化研究の重要なターゲットだが、既存手法は97%水準を達成できていなかった。PSOTという新変換の導入で大幅改善。
