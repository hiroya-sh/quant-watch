---
id: "2026-W22-015"
type: paper
title: "Decomposing MXFP4 quantization error for LLM reinforcement learning: reducible bias, recoverable deadzone, and an irreducible floor"
url: "https://arxiv.org/abs/2605.20402"
discovered: "2026-05-19"
published: "2026-05-19"
authors: [Xiaocan Li, Shiliang Wu, Zheng Shen]
venue: "arxiv"
models: []
architectures: [transformer]
methods: [MXFP4]
tech: [low-bit-fp4, microscaling-formats, qat]
priority: normal
sources: [arxiv]
status: new
related: ["2026-W22-014"]
---

## 日本語要約

MXFP4演算を使ったLLM強化学習における量子化誤差を理論的に3成分（削減可能なバイアス、回復可能なDeadzone、不可避なフロア）に分解。各成分がRLの異なる学習経路を支配することを証明し、それぞれへの対処法を提案。MXFP4 RL学習の品質問題に対する数学的基盤を提供。

## 手法

- 量子化誤差の3成分分解: Reducible Bias / Recoverable Deadzone / Irreducible Floor
- 各成分がRLの異なる報酬/価値推定経路に対してどう影響するかを理論証明
- 各成分に応じた補正・回避戦略を導出

## 評価

- 対象モデル: LLM（RL学習文脈）
- ビット幅: MXFP4（FP4 microscaling）
- 精度劣化: 理論的分析中心（詳細は論文）
- スループット/メモリ: 未評価（理論論文）

## 既存手法との差分

MXFP4のPTQ精度を扱う既存研究（TORQ等）と異なり、RL学習（QAT的文脈）でのMXFP4誤差を理論的に解析する初の研究。
