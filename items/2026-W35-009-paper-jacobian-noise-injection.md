---
id: "2026-W35-009"
type: paper
title: "Jacobian-guided Noise Injection for Quantization Robustness in Large Language Models"
url: "https://arxiv.org/abs/2608.20988"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [qat, outlier-handling, activation-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
LLM の量子化は self-attention の離散化誤差感度に阻まれることが多い。本論文は softmax 演算子を、外れ値感受性と状態依存 Jacobian のために量子化安定性のボトルネックと同定。この Jacobian のノルムを抑えることが量子化誘起の性能劣化を bound する助けになることを理論的に示す。

## 手法
Jacobian-Guided Noise Injection: pre-attention logits に平均0のガウスノイズを注入する学習戦略。分散は Jacobian の Frobenius ノルムから直接導出する。ヒューリスティックや Jacobian の直接ペナルティに頼る既存手法と異なり、局所的な attention 感度に基づいて最適なノイズ分散を決められる。

## 評価
- SOTA LLM アーキテクチャで頑健性の改善を実証と主張

## 既存手法との差分
ノイズ分散を経験則でなく Jacobian ノルムから決める点。

## 注目度コメント
rotation/Hadamard 系の外れ値対策とは別軸(学習時ノイズ)。W36 の [[items/2026-W36-004-paper-transforms-great-inversion|Transforms for LLM Quantization]] が変換側の理論整理をしているのと対になる。
