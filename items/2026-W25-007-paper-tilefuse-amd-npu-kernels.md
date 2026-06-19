---
id: "2026-W25-007"
type: paper
title: "TileFuse: A Fused Mixed-Precision Kernel Library for Efficient Quantized LLM Inference on AMD NPUs"
url: "https://arxiv.org/abs/2606.11357"
discovered: "2026-06-15"
published: "2026-06-09"
authors: [Wesley Pang, Gregory Hyegang Jun, Feiyang Liu, Deming Chen]
venue: "arxiv"
models: [meta-llama/Llama-3.2]
architectures: [transformer]
methods: [AWQ]
tech: [weight-only, low-bit-4, low-bit-fp8, activation-quant, block-wise, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
AMD XDNA2 NPU（Ryzen AI搭載）向けのAWQ-style W4A16・W8A16対応カーネルライブラリ。重みレイアウト、メタデータ配置、unpacking/dequantization/GEMM演算のfusionを共同設計。GEMM 121.6%高速化・GEMV 281%高速化・prefill 2.0x低レイテンシ・エネルギー消費64.6%削減をRyzen AIラップトップで実証。

## 手法
- Tile-based fusion: unpacking・dequant・行列積を単一カーネルにfuse
- XDNA2特化レイアウト: AIE（AI Engine）のタイル構造に合わせた重みレイアウト最適化
- W4A16/W8A16: AWQ量子化済みモデルをNPU上でネイティブ実行
- エネルギー効率: GPU比でバッテリー消費を大幅削減

## 評価
- AMD Ryzen AIラップトップ（XDNA2 NPU）で測定
- モデル: LLaMA-3.2-1B/3B
- GEMM 121.6%高速化、GEMV 281%高速化（既存NPUカーネル比）
- Prefill 2.0x低レイテンシ、エネルギー64.6%削減

## 既存手法との差分
TileFuseはXDNA2向けに特化した量子化カーネル最適化。AMDのlmstudio/llama.cppのAIEバックエンドとは独立した研究実装。NPU上での量子化LLM実行に向けた基礎研究。

## 注目度コメント
エッジ/NPU向け量子化カーネルとして注目。Apple SiliconへのMLXのような位置づけをAMD XDNA2で目指すもの。TileFuseのライブラリ公開が鍵。
