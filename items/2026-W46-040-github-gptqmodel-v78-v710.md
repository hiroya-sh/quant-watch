---
id: "2026-W46-040"
type: github
subtype: library
title: "ModelCloud/GPTQModel: v7.8.0 → v7.9.0 → v7.10.0 (3 releases in window)"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.10.0"
discovered: "2026-11-09"
published: "2026-11-02"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.10.0"
models: []
architectures: ["moe", "transformer", "hybrid"]
methods: ["GPTQ", "AWQ", "GGUF", "NVFP4", "MXFP4", "EXL3", "bitsandbytes", "AutoRound"]
tech: ["low-bit-fp8", "low-bit-fp4", "low-bit-2", "low-bit-4", "weight-only", "mixed-precision"]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約

GPTQModel が本週 3 連続リリース: **v7.8.0 (staged GSQ + RDNA4 kernels + CUDA GGUF ネイティブ SIMD 推論)**、**v7.9.0 (RTX 4090/RDNA4 launch tables, AllSpark W8A16, GSQ/RCO + MLX 最適化)**、**v7.10.0 (Ricursive Ripple 65B 対応)**。**v7.8 で GGUF の全 ggml tensor type (K-quant + IQ 各種 + MXFP4/NVFP4) を CPU カバーし、AVX2 で torch path 比 3-100x 高速化**。**v7.9 で RDNA4 bitsandbytes 4bit GEMM が vendor HIP の 1.4-6.3x (M≥16)**、AllSpark W8A16 を CUDA (5090/4090) + RDNA4 (gfx1200/1201) に、EXL3 2-bit を RDNA4 shared memory に収めた。**v7.10 で Ricursive Ripple (`ricursive`) 65B preview を搭載**、decode を batch16 行あたり 10x 高速化 (fused RMSNorm + native GQA)、`gptqmodel.reshard()` で per-layer safetensors shard 対応。

## 量子化関連の変更点

- **Ricursive Ripple 65B**: Transformers 5 generation/masking patches、per-head Q/K norm、gated-attention、`v_proj` Hessian isolation。GPTQModel 側で focus 外だが HF では prithivMLmods NVFP4-GB202-GGUF (DL 258), ModelCloud GPTQ-W4A16-v2 (DL 141), dealignai UNCENSORED-NVFP4 (DL 126) が 11-04 以降公開され、GPTQ W4A16 + NVFP4-GGUF 配布が同時成立。
- **GGUF CPU カバレッジ (v7.8)**: 全 K-quant / IQ / MXFP4 / NVFP4 を CPU 推論、AVX2 で torch 比 3-100x、per-shape autotuning。新 `gguf` install extra。
- **AllSpark W8A16 (v7.9)**: 5090/4090 と RDNA4 (gfx1200/1201) で per-channel 8bit GPTQ/AWQ を加速。CUDA graph capture 対応。
- **MLX 最適化 (v7.9)**: GPTQ/RTN quantization +4.95x/+2.6x、GGUF Q6_K/TQ2_0 block pack +15-31%、Q4_K/Q5_K coalesced read、qmv_wide 6-11 row batch +2.18x、group-16 decode +8%。**GSQ/RCO** の native MLX search + GPU/ANE profiling で Apple Silicon 側の品質最適化が初めて揃う。
- **RDNA4 kernel サポート (v7.8)**: GPTQ GEMV/GEMM/dequant, ParoQuant GEMM, AWQ GEMM/GEMV, GGUF Triton, bitsandbytes 4-bit に測定済み launch table を全追加。RDNA4 bitsandbytes 4bit GEMM が vendor HIP の 1.4-6.3x (M≥16)。
- **EXL3 2-bit (v7.9)**: RDNA4 の 64 KiB shared memory に収まる実装。
- **staged GSQ (v7.8)**: public method adapters, distributed staged training, per-block bit allocation (RCO search)、IST-DASLab reference との bit-identical を測定。HIPRTC compile の fused scalar relaxation (ROCm) + segment-sum scale gradient (1.5x no VRAM cost)。
- **v7.10 Validation**: GPTQ / AWQ / QQQ / ParoQuant / FP8 / bitsandbytes / EXL3 / GGUF / VPTQ に method-specific integer bit-width validation、EXL3 の fractional trellis width 拒否、MoE routing-bypass batch size 検証。
- **v7.10 ROCm**: W4A FP8/NVFP4 と ExLlamaV2/VPTQ の HIP 非対応 path を明示 gating で fast failure。
- 新モデル (v7.8): RecursiveSI Flint, Raon-1 mini, Gemma 3 multimodal checkpoint、Qwen2.5-Omni thinker lm_head、Transformers 5.22 Qwen-Omni layout。
- 新モデル (v7.9): LFM3, LFM3-VL, LFM3-Omni text-decoder 量子化、OLMo/Helium、Qwen2 resume。

## 影響範囲

- v7.9 は Marlin/Machete/Swordfish の method 固有 enum を `BACKEND.MARLIN/MACHETE/SWORDFISH` に統合 (legacy string aliases は hf_ API で保持)。
- v7.9 で Transformers/Optimum の native load hook を追加 (dynamic settings, fused/MoE 構造, rotation, W4A policy 保持)。
- v7.10 で per-layer reshard を導入、`gptqmodel.reshard()` が byte-for-byte tensor copy + metadata 保持 + config/tokenizer コピー。

## 注目度コメント

**週 3 回のリリースで Apple Silicon / RDNA4 / Ricursive 対応が一気に進んだ**。focus method は直接触らないが、GGUF CPU 推論 3-100x と RDNA4 の bitsandbytes 4-bit 1.4-6.3x は量子化コミュニティの "手元で測る" 体験が一段改善する。Ricursive Ripple は本週の HF 配布高位 wave の 1 つ (ModelCloud GPTQ + prithivMLmods NVFP4-GGUF + dealignai UNCENSORED)。TurboQuant / PolarQuant / QJL / gemma-4 言及ゼロ。
