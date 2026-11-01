---
id: "2026-W45-023"
type: github
subtype: library
title: "ModelCloud/GPTQModel: v7.7.0"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.7.0"
discovered: "2026-11-02"
published: "2026-10-23"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.7.0"
models: []
architectures: ["transformer", "gla", "moe", "dense"]
methods: ["GPTQ", "AWQ", "bitsandbytes", "NVFP4", "GGUF", "EXL3"]
tech: ["weight-only", "ptq", "calibration", "rotation", "moe-quant"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

**CPU 推論の大改修**: 共有 AVX512-BF16 `int4_qzero_group_scaled_cpu` カーネル(group 16/32/64/128/256/512)で GPTQ/AWQ を ATen 比 **最大 2.02x 高速**、**BitsAndBytes INT8 は M=64 で 1.28x**。QQQ/VPTQ/EXL3/FP8/NVFP4/BnB の CPU パックデコードパス追加、oneDNN BF16x3 蓄積。**GGUF**: fused CPU Q4_0/Q8_0/Q4_K/Q5_K/Q6_K forward(dense 比 **最大 1.92x**)。**量子化ストレージ**: GPTQ/AWQ/QQQ/EXL3/VPTQ/FP8/FP4/GGUF/BnB/INT8 の persistent dense/dequant/int4-to-int8 キャッシュを撤去(packed+scale+zp+metadata のみ保持)。**ROCm/gfx950**: fused GPTQ GEMV を 2/4/8bit に拡張 #3263-#3265/#3268、AWQ Triton GEMM 使用 #3262。LLaVA 量子化、fused VPTQ CUDA 推論。PyTorch 2.14.1 / Transformers 5.20.2 以上。

## 量子化関連の変更点

- **CPU 推論強化**: AVX512-BF16 `int4_qzero_group_scaled_cpu` カーネル(ATen 比 **~2.02x**)、BnB INT8(M=64 で 1.28x)、oneDNN BF16x3 蓄積、packed CPU decode(QQQ/VPTQ/EXL3/FP8/NVFP4/BnB) 
- **GGUF**: fused CPU Q4_0/Q8_0/Q4_K/Q5_K/Q6_K forward(dense 比 **~1.92x** at M=7)、per-shape autotune、retained dense 無し
- **量子化ストレージの大改修**: persistent dense/dequant/int4-to-int8 cache を全フォーマットで削除 — packed+scale+zp+metadata のみ保持
- **ROCm/gfx950**: fused GPTQ GEMV 2/4/8bit (#3265)、GEMM for small batch(M=2..16) #3268、AWQ Triton GEMM #3262
- VPTQ Hessian damping、QQQ の vLLM 互換性 / CUDA saturation 修正、LLaVA 量子化、fused VPTQ CUDA 推論
- PyTorch 2.14.1 / Transformers 5.20.2 以上、`AWQ_TORCH_INT8` / `TORCH_INT8_AWQ` **削除**(破壊的)

## 影響範囲

- **BREAKING**: `AWQ_TORCH_INT8` / `TORCH_INT8_AWQ` 削除、dense/dequantized inference-cache オプトインが警告のみに(実質無効化)。
- CPU 推論ユーザ(Intel/AMD/Mac Studio の bf16 CPU 推論)にとっては **大幅な性能向上**(GPTQ/AWQ で ATen 比 2x、GGUF K-quant で 1.9x)。
- ROCm/gfx950 ユーザは fused GPTQ GEMV が 2/4/8bit に広がったため、MI350X 系で GPTQ 2bit の実用性が向上。

## リリースノート抜粋

```
## GPTQModel 7.7.0 🚀

- **CPU inference:** Added the shared AVX512-BF16 `int4_qzero_group_scaled_cpu` kernel for GPTQ/AWQ group sizes 16/32/64/128/256/512 and prioritized it ahead of ATen when supported. Added packed/low-precision CPU decode paths for QQQ, VPTQ, EXL3, FP8, NVFP4, and BitsAndBytes, plus oneDNN BF16x3 accumulation and shape-aware BitsAndBytes INT8 dispatch. GPTQ/AWQ measured up to 2.02x faster than ATen; BitsAndBytes INT8 reached 1.28x at M=64.
- **GGUF:** Added fused CPU Q4_0/Q8_0/Q4_K/Q5_K/Q6_K forward with FP32 accumulation under oneDNN BF16x3, fused bias, per-shape autotuning, and no retained dense weights. K-quant fused paths measured up to 1.92x faster than dense at M=7.
- **Quantized storage:** Removed persistent dense, dequantized, expanded, and INT4-to-INT8 inference caches across GPTQ/AWQ, QQQ, EXL3, VPTQ, FP8, FP4, GGUF, BitsAndBytes, and INT8. Only packed weights, scales, zero points, and metadata persist; temporary dequantization uses bounded tiles.
- **Quantization quality:** Added token-normalized GPTQ loss reporting, on-device embedding diagonal flooring and VPTQ Hessian damping, and QQQ vLLM compatibility/CUDA saturation fixes.
- **Models and runtimes:** Added LLaVA quantization support, fused VPTQ CUDA inference, and hardened remote LoRA adapter loading.
- **Docs and tooling:** Added the GPTQ FSDP/PEFT LoRA example, multi-GPU MoE quantization guide, and independent Torch-oracle accuracy and CPU speed benchmarks.
- **Dependencies:** Refreshed runtime and optional dependency floors to current stable releases, including PyTorch 2.14.1, Transformers 5.20.2, Datasets 5.1.0, and Optimum 2.3.0. vLLM/SGLang extras retain their upstream framework pins and should be installed in dedicated environments.

## Upgrade notes

- Python 3.10 remains supported; dependency markers select compatible NumPy, filelock, Pillow, PyArrow, vLLM, SGLang, and MLX-LM releases.
- Runtime floors are now PyTorch 2.14.1 and Transformers 5.20.2.
- `BACKEND.GPTQ_TORCH_INT8` / `TORCH_INT8` accept native 8-bit GPTQ sources only. `AWQ_TORCH_INT8` / `TORCH_INT8_AWQ` are retired.
- Dense/dequantized inference-cache opt-ins now warn and remain disabled. Only packed weights, scales, zero points, and metadata persist.
- vLLM/SGLang extras remain dedicated-environment integrations because their latest releases pin older Torch/Transformers versions.

## Validation

- Wheel and sdist built for `7.7.0`; `twine check` passed.
- Core requirements resolved on Python 3.10, 3...
```

## 注目度コメント

**HIGH** — focus method NVFP4, focus tech moe-quant にマッチ。火曜定例の議題候補。
