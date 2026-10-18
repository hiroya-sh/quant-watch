---
id: "2026-W43-036"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.4.0rc0"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.4.0rc0"
discovered: "2026-10-19"
published: "2026-10-18"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.4.0rc0"
models: [MiniMaxAI/MiniMax-M3, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.7, zai-org/GLM-5.1, zai-org/GLM-5.2, nvidia/Nemotron]
architectures: [moe, hybrid, transformer]
methods: [NVFP4]
tech: [kv-cache-quant, low-bit-fp4, moe-quant, sparse-attention, trtllm-ready]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
TRT-LLM v1.4.0rc0。**MiniMax-M3 の NVFP4 KV cache 対応**(query-length buffer 再利用 / native draft KV view / sparse offload 対応)、GLM-5.3-Flash 対応、Nemotron-H MTP head の量子化チェックポイント読み込み、Qwen-Image-Layered の FP8 + Cache-DiT 対応、static FP8 Cosmos3 Nano/Super の再量子化なしロード。V2 scheduler に Mooncake store pool / CLI / preemption、Sparse KV cache の tier-aware locking と offload、DeepSeek V4 sparse KV offload 準備。SM120 FP8 context FMHA(head dim 256)、CUTLASS MoE の post-SiLU clamp。Python backend KVCacheManagerV2 削除(BREAKING)。

## 量子化関連の変更点
- **MiniMax-M3 NVFP4 KV cache**: #19422, #19768(query-length buffer 再利用), #19731(native P128 draft KV view) — focus:NVFP4 + focus:kv-cache-quant 両直撃
- Load **static FP8 Cosmos3 Nano/Super** checkpoints without re-quantization #17476
- Load quantized **Nemotron-H MTP heads** #19558, #19597
- Qwen-Image-Layered **FP8 + Cache-DiT** 対応 #16889
- GLM-5.3-Flash (glm5_next) 対応 #19136
- **Sparse KV cache**: tier-aware locking, offload with GPU metadata, DeepSeek V4 sparse KV offload 準備 #19580, #19821, #19502
- SM120 で **tiled FP8 context FMHA** (head dim 256) 対応 #19825
- CUTLASS MoE の **post-SiLU clamp**、MoE scheduler の optional finalize-before-combine #19217, #19749
- BREAKING: Python backend of KVCacheManagerV2 削除 #19154、LlmRequest fields を Python に移行 #19484

## 注目度コメント
focus:NVFP4 / kv-cache-quant / moe-quant が同一リリースに同居
