---
id: "2026-W46-009"
type: paper
title: "GC-MoE: Overlapping Expert-Parallel Token Dispatch with FP8/FP4 Grouped GEMM via CUDA Green Contexts"
url: "https://arxiv.org/abs/2611.04222"
discovered: "2026-11-09"
published: "2026-11-03"
authors: ["Yong Li", "Kan Liu", "Tao Lan"]
venue: "arXiv:2611.04222"
models: []
architectures: ["moe"]
methods: []
tech: ["moe-quant", "low-bit-fp8", "low-bit-fp4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

Hopper/Blackwell 向け FP8/FP4 MoE 推論オペレータ GC-MoE。CUDA Green Contexts でデバイスを「small communication partition」と「large compute partition」に分割し、dispatch と GEMM を独立に tune。token-ring handshake で ring の最初の block から計算開始、double-buffered receive counter で cross-rank barrier 除去。8x H20 GPU で DeepSeek-V4.1-Flash decode を routed + shared expert 平均 1.188x 高速化。オープンソース。

## 手法

CUDA Green Context でデバイス partition。dispatch と GEMM のカーネルを独立起動し、token-ring handshake で早期オーバーラップ、double-buffer で barrier 除去。Blackwell は operand-swapped tcgen05 block-scaled MMA, Hopper は in-register FP4 decode の register-A WGMMA。

## 評価

- モデル: DeepSeek-V4.1-Flash (focus adjacent)
- ビット幅: FP8 / FP4
- GPU: H20 x8 / Hopper / Blackwell
- スループット: decode 1.188x average (routed + shared expert)

## 注目度コメント

MoE focus — W45 の DeepGEMM MegaMoE / SGLang monokernel の延長線上。Green Context で "dispatch と GEMM の SM 競合" を解く新設計。オープンソースで vLLM への接続も可能性あり。
