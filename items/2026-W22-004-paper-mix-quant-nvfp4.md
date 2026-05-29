---
id: "2026-W22-004"
type: paper
title: "Mix-Quant: Quantized Prefilling, Precise Decoding for Agentic LLMs"
url: "https://arxiv.org/abs/2605.20315"
discovered: "2026-05-21"
published: "2026-05-19"
authors: [Haiquan Lu, Zigeng Chen, Gongfan Fang]
venue: "arxiv"
models: []
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, mixed-precision]
priority: high
sources: [arxiv, hf-papers]
status: new
hf_upvotes: 28
related: ["2026-W22-002", "2026-W22-007"]
---

## 日本語要約

Prefilling フェーズに NVFP4（FP4）量子化を適用し、Decoding フェーズでは BF16 精度を維持するフェーズ認識型量子化フレームワーク。長コンテキストのエージェント型 LLM ワークフローでの Prefilling ボトルネックを解決。Prefilling で最大 3× 高速化しつつ、精度損失は軽微。Blackwell GPU の NVFP4 ネイティブ命令を活用。

## 手法

- Phase-aware quantization: Prefilling=NVFP4 (W4A4)、Decoding=BF16
- Prefilling と Decoding で異なる精度を使い分けることで精度とスループットをトレードオフ
- 長コンテキスト・エージェントタスクに対してベンチマーク

## 評価

- 対象モデル: 各種 LLM（エージェント用途）
- ビット幅: Prefilling = NVFP4 (FP4)、Decoding = BF16
- 精度劣化: エージェントベンチマークで軽微
- スループット: Prefilling 最大 3× 高速化

## 既存手法との差分

ThriftAttention (2026-W22-007) と問題意識が近いが、ThriftAttention が Attention 計算のFP4/FP16 選択的混合であるのに対し、Mix-Quant は Prefill/Decode フェーズ全体の分離戦略。

## 注目度コメント

`NVFP4`（focus method）。28 HF upvotes。エージェント LLM 向けという実用路線が際立つ。
