---
id: "2026-W25-005"
type: paper
title: "Drop-by-Drop: Multi-Bitwidth Quantization for LLMs Using Additive Codebooks"
url: "https://arxiv.org/abs/2606.12876"
discovered: "2026-06-15"
published: "2026-06-11"
authors: [Liza Babaoglu, Shuangyi Chen, Ashish Khisti]
venue: "arxiv"
models: [Qwen/Qwen3, meta-llama/Llama-3.1, google/gemma-3, mistralai/Mistral]
architectures: [transformer]
methods: []
tech: [weight-only, mixed-precision, calibration, ptq, low-bit-4, low-bit-2]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
単一の訓練済みモデルから推論時に精度レベルを切り替えられるマルチビット幅PTQ手法。LLM重みのガウス分布性を利用してMatryoshkaスタイルの教師あり学習で加算的コードブックを構築し、サブセット選択だけで任意のビット幅での推論が可能。Qwen、LLaMA、Gemma、Mistralで検証。

## 手法
- Additive Codebooks: コードブックを積み重ねる設計。1つ目のコードブックで粗い近似、2つ目以降で残差を細化
- Matryoshka-style supervision: 各サブセット（コードブック数）での誤差を同時に最小化
- ガウス分布活用: LLM重みのガウス性を利用した効率的コードブック初期化
- 推論時bit幅選択: コードブック数を選ぶだけで2-bit/3-bit/4-bitを切り替え

## 評価
- Qwen3-7B、LLaMA-3.1-8B、Gemma-3-7B、Mistral-7Bで検証
- 2-bit/3-bit/4-bitの動的切り替え
- 結果: 各ビット幅での既存PTQに対し競争力のある精度

## 既存手法との差分
AnyPrecision（重みを1モデルに統合）の系譜だが、加算コードブックによる推論時精度制御という点で新規。エッジ展開でメモリ/精度トレードオフを動的調整する用途に適する。

## 注目度コメント
単一モデルで複数精度を使い分けるユースケース（デバイス性能に応じた動的量子化）への回答。学術的新規性は高いが、実装・展開の複雑さとのトレードオフが課題。
