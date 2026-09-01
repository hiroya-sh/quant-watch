---
id: "2026-W35-021"
type: github
subtype: library
title: "NVIDIA Megatron Core 0.19.0"
url: "https://github.com/NVIDIA/Megatron-LM/releases/tag/core_v0.19.0"
discovered: "2026-09-01"
published: "2026-08-20"
repo: "NVIDIA/Megatron-LM"
release_tag: "core_v0.19.0"
models: [nvidia/Nemotron]
architectures: [moe, transformer]
methods: [NVFP4, MXFP4]
tech: [moe-quant, low-bit-fp8, low-bit-fp4, microscaling-formats]
priority: normal
sources: [github]
status: new
related: []
---
## 日本語要約
学習側。**量子化チェックポイントのストリーミングロード**(FP8 / MXFP8 / blockwise-FP8 / NVFP4 を逐次 dequantize)が入り、モデル全体分の BF16 スクラッチ確保が不要になった。MoE 側では fused shared-expert MLP により量子化実行への道が開かれている。

## 量子化関連の変更点(release body 全文スキャン)
- **Streaming quantized checkpoint loading**: FP8 / MXFP8 / blockwise-FP8 / **NVFP4** テンソルをモデル全体分の BF16 スクラッチを確保せず逐次 dequantize (#4451)
- **Fused shared-expert MLP**: grouped GEMM で shared expert を通し、fused GEMM + SwiGLU + **量子化実行**への経路を用意 (#5604)
- Quantile Balancing router: quantile 推定由来の per-expert routing bias による auxiliary-loss-free 負荷分散 (#5349)
- **MXFP8 学習パス**: Nemotron 3 Super MXFP8 のサンプルあり
- Partial CUDA Graph のメモリ最適化 (#5451)

## focus 突合(release 本文全文検索)
- NVFP4: **該当あり**(#4451)
- moe-quant: **該当あり**(#5604, #5349)
- TurboQuant / PolarQuant / QJL / gemma-4: 出現なし

## 影響範囲
- 学習/継続学習を行う場合のチェックポイントロードのメモリピークが下がる。

## 注目度コメント
ModelOpt 0.46.0 の Megatron export 対応(NVFP4 4/6 は HF/Megatron export のみ対応)と対になる更新。学習→量子化→エクスポートの導線が NVIDIA スタック内で締まってきている。
