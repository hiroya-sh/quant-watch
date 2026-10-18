---
id: "2026-W43-038"
type: github
subtype: library
title: "ggml-org/llama.cpp: v0.7.0"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/v0.7.0"
discovered: "2026-10-19"
published: "2026-10-18"
repo: "ggml-org/llama.cpp"
release_tag: "v0.7.0"
models: [moonshotai/Kimi-K2.7, MiniMaxAI/MiniMax-M3]
architectures: [moe, dense, hybrid, transformer]
methods: [NVFP4, MXFP4, GGUF]
tech: [kv-cache-quant, moe-quant, mixed-precision, speculative-decoding, llamacpp-ready]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
llama.cpp v0.7.0。**LiliCorr speculative decoding** と **GLM5-Next MTP speculative decoding**、**MoE エキスパートの host-memory GPU LRU cache**(`--moe-cache-mib`、オフロード時 decode 最大 2.2x)、サポート追加モデル: K2 Horizon (dense + MoVA, Kimi K2 系の最新)、Prism Bonsai 2 27B (ternary)、EmbeddingGemma-2 (text+vision+audio)、MiniCPM-V 4.7、Nemotron Super 3.5 VL / Nemotron Bolt 74B A9B、LiquidAI d1 系。**compressed-tensor mixed-precision NVFP4 checkpoint の変換対応**(#28636)。server デフォルトポートが 9931 に変更。

## 量子化関連の変更点
- **MoE host-memory expert GPU LRU cache** (`--moe-cache-mib`) で decode 最大 2.2x #29887, マルチ GPU 共有 #30112
- **LiliCorr speculative decoding**(DFlash 上に小さなドラフト Transformer)#30506
- **GLM5-Next MTP speculative decoding + sparse attention optimized path** #29928
- **convert: compressed-tensor mixed-precision NVFP4 checkpoint 対応** #28636 — focus:NVFP4
- K2 Horizon(Kimi K2.7 系)dense + MoVA, `-sm tensor` 分割 #29535
- Prism Bonsai 2 27B(**ternary** モデル)#29600
- MiniCPM-V 4.7(マルチモーダル) #29416、Nemotron Super 3.5 VL #30520
- Hexagon の tiled/flat q1_0/q2_0 + Hadamard MUL_MAT 対応 (個別ビルド #30627)
- OpenCL **MXFP4 MoE bin kernel for Adreno X1** (個別ビルド)
- SYCL IQ3_S/IQ3_XXS persistent reordered weight(prefill 用)
- kleidiai: SME2 Q4_K / Q6_K matmul(ARM)
- BREAKING: サーバのデフォルトポートが **8080 → 9931**

## 注目度コメント
focus:NVFP4 / kv-cache-quant / moe-quant が同一リリースに同居
