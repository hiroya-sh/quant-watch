---
id: "2026-W43-037"
type: github
subtype: library
title: "ModelCloud/GPTQModel: v7.6.0"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.6.0"
discovered: "2026-10-19"
published: "2026-10-18"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.6.0"
models: [Qwen/Qwen3.5, deepseek-ai/DeepSeek-V4]
architectures: [moe, transformer, dense]
methods: [GPTQ, AWQ, NVFP4, MXFP4, MXFP6, GGUF, EXL3, HQQ, bitsandbytes, AutoRound]
tech: [weight-only, activation-quant, low-bit-fp8, low-bit-fp4, low-bit-4, mixed-precision, ptq]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
GPTQModel v7.6.0。**MLX / Apple Silicon ネイティブカーネルを一括追加**: GPTQ / AWQ / GGUF (Q1_0/Q2_0/Q4_0/Q8_0/Q4_K/Q5_K/Q6_K/TQ1_0/TQ2_0/MXFP4) / NVFP4 / ParoQuant / QQQ / FP8 / bitsandbytes / RTN / GPTAQ / EXL3 trellis を MLX kernel で実行。**OCP MXFP4/MXFP8 の自動 weight decoding**、**FP8/NVFP4 ソースの W4A16 自動 decode**、**GB10 GPTQ W4A activation stream**(FP8 A8 / NVFP4 A4 over INT4 weights)。Qwen4Exp / olmoe / qwen3_vl_moe / exaone4_5 / intervl / MiMo V2.6 / Xing4.0-29B-A4B / zdtaichu5_0 など新モデル多数対応。GPTQ Hessian 反転のピークメモリ削減、CUDA block updates 2-8bit 統一。

## 量子化関連の変更点
- **MLX GPTQ/AWQ/GGUF/NVFP4/FP8/ParoQuant/QQQ/BitsAndBytes/EXL3 kernel 群**: Apple Silicon で主要量子化フォーマットを一式ネイティブ実行 (PR #3117-#3155, 大量)
- **auto-decode native FP8/NVFP4 → W4A16** #3084, 対応テスト #3087
- **OCP MXFP4/MXFP8 の自動 weight decoding** #3109
- **GB10 GPTQ W4A activation stream**: INT4 weights + FP8(A8) / NVFP4(A4) activation — focus:NVFP4 #3228
- 新モデル: Xing4.0-29B-A4B, qwen4_exp_text, olmoe, qwen3_vl_moe, exaone4_5, intervl, MiMo V2.6 Flash-RL/Pro-RL (#3089-#3120)
- Qwen3.5-MoE multimodal 校正の routing 修正 #3086
- DeepSeek-V4 fused expert checkpoint の materialize #3097
- GPTQ Hessian 反転のピークメモリ削減 #3106, #3107
- CUDA block updates を 2〜8 bit で統一化 #3105
- MLX native MXFP8 で正確 FP8 推論 #3140

## 注目度コメント
本リリースは実装側の変更が主。
