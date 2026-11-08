---
id: "2026-W46-014"
type: paper
title: "TriAttention: Unified Sparse Mixed-Precision Attention for Long-Context LLM Inference"
url: "https://arxiv.org/abs/2611.07256"
discovered: "2026-11-09"
published: "2026-11-05"
authors: ["Hanzhi Zhang", "Qiao Zhang", "Qinglei Cao", "Heng Fan"]
venue: "arXiv:2611.07256"
models: []
architectures: ["transformer"]
methods: []
tech: ["mixed-precision", "calibration", "kv-cache-quant", "low-bit-4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Attention の sparsity と quantization を統合した TriAttention。QK タイルを skip / 4-bit / 8-bit に割り当て、4-bit は量子化 tolerance 高い interaction を低コストで保持。各 head の計算領域を 2 つの diagonal-distance 境界で表現し、オフライン較正で境界ペアを探索、計算 budget 共有の下で head 毎最適配分。prefill で生成した quantized K/V を decode 用の compressed KV cache として再利用。end-to-end 生成で torch attention 7.88x, BF16 2.65x の speedup を実現し汎用・長文タスクで品質維持。

## 手法

QK タイルに {skip, 4bit, 8bit} を割り当てる。head ごとに 2 つの diagonal-distance 境界で policy を表現。normalized projected-output error でオフライン較正、model-wide allocator で budget 分配。prefill 時の quantized KV を decode で再利用。

## 評価

- モデル: (未明示)
- ビット幅: 4bit / 8bit mixed sparse
- スループット: end-to-end 7.88x vs torch attn, 2.65x vs BF16
- 精度: 汎用・長文で基準モデル同等

## 注目度コメント

kv-cache-quant focus + mixed-precision + sparse-attention の 3 軸統合。implementation 詳細がしっかりしており、vLLM/TRT-LLM の sparse+quant パスとの接続点として有望。
