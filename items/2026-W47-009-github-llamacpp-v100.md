---
id: "2026-W47-009"
type: github
subtype: library
title: "ggml-org/llama.cpp: v1.0.0 + nightly b12208-b12414"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0"
discovered: "2026-11-16"
published: "2026-11-13"
repo: "ggml-org/llama.cpp"
release_tag: "v1.0.0"
models: [zai-org/GLM-5.3, Qwen/Qwen3.5, Qwen/Qwen3.6, Qwen/Qwen3.8, google/gemma-4, deepseek-ai/DeepSeek-V4, moonshotai/Kimi-K2.7]
architectures: [transformer, moe, dense]
methods: [GGUF, NVFP4, MXFP4, MXFP6]
tech: [weight-only, kv-cache-quant, low-bit-fp8, low-bit-fp4, moe-quant, llamacpp-ready, mixed-precision]
priority: high
sources: [github]
status: new
related: [2026-W46-038-github-llamacpp-v090]
---

## 日本語要約
llama.cpp の **1.0.0 メジャーリリース**(11-13)と、本週 b12208-b12414 の **127 本の nightly** を集約。35 の deprecated 関数削除/NextN API 昇格と並行して、**OCP FP8 KV cache**(`-ctk/-ctv f8_e4m3`, #28392)、**host-memory MoE expert cache**(`moe_cache_size` + CPU share, #30966)、**Granite/qwen2/qwen3.5 の NVFP4 FFN scales**(#31449, #31657, #32102)、**Hexagon NPU の IQ2_XXS + NVFP4 サポート**(#31954)、**ggml 1.0.0 で FP8 と YaRN truncation**、など量子化面の整備が同時着弾。[[items/2026-W46-038-github-llamacpp-v090|v0.9.0 (W46)]] からの区切り。

## 量子化関連の変更点
- **OCP FP8 E4M3 KV cache**(#28392, b12284): `-ctk/-ctv f8_e4m3` + 任意の static per-tensor scales。CUDA の FP8 vec FA kernel も同時追加。NVFP4 重みのモデル(nvidia/Qwen3.6-27B-NVFP4)で `fp8` KV + NVFP4 weight の実機ベンチが release note に埋め込まれており、pp8196 @d0 で **2781 t/s / tg256 37.56 t/s**(RTX PRO 4500 Blackwell SM120)。
- **NVFP4 FFN scales 対応**: Granite(#31449) と qwen2(#31657) の convert で FFN NVFP4 scale を attach、qwen3.5 の tensor merge(#32102)。Granite NVFP4 配布の GGUF 変換パスが整備。
- **Hexagon NPU の NVFP4 + IQ2_XXS**(#31954): HVX matmul / HMX dequant / per-tensor scale を Snapdragon 向けに実装。Hexagon が **量子化 edge の第 3 極**として実用レンジに入った。
- **IQ1_S / IQ1_M / IQ2_XXS / IQ2_XS / IQ2_S / Q8_0 の CUDA encoder 追加**(関連 PR): 2-bit 以下の weight-only が CUDA 側で動く。
- **MXFP4 dense repack (SpacemiT IME2, #31776)**: RISC-V 系 CPU 向け。
- **CUDA fused MoE MMQ** / **Metal MXFP4 mat-vec 高速化** / **Vulkan split-K** / **OpenCL 量子化 GEMM 拡大**: ggml 1.0.0 の performance work。
- **MMQ で NVFP4 weight scale を epilogue に fuse**(CUDA, #26048): NVFP4 の write-back コスト削減。
- **Vulkan dequantized KV optimization with CM2**(#31526, b12240): coopmat2 ガードで KV dequant 最適化。
- **Vulkan NVFP4 UE4M3 scale lookup OOB fix**: W46 からの継続修正。
- **New architectures**: Kimi-K3.1-Pro (K3 + DSA, #31779), Ripple-65B (ricursive, #31692), xing4_0 (mHC+MLA+MoE+MTP, #31589), Inkling 2 (text + vision, #32217, b12406): いずれも**同週に HF 側で量子化配布**が立ち上がる。
- **fix on-device state copy sizes for quantized KV caches** (#30541)、`ggml_prec_set_acc` 参照精度の統一(#31851)、**few-row quantized matmul**(CUDA) と MoE fusion(Metal)。

## 影響範囲
- API: 35 deprecated 関数削除、`defrag_thold` 削除、NextN API を `llama.h` に昇格、`moe_cache_size`/`moe_cache_cpu_share` 追加、`/v1/audio/speech` エンドポイント新設。
- セキュリティ: SSRF/CORS/DNS rebinding/MCP cancel の強化と `--allow-unauthenticated-tools` opt-in。
- Web UI: 大幅リデザイン(chat groups / markdown editor / 右クリックメニュー)。
- 後方互換: deprecated 関数に依存する python / go binding が要更新。

## 注目度コメント
`llamacpp-ready` 大幅拡大。本週は **OCP FP8 KV cache が llama.cpp に正式着地**した週として記録される。[[items/2026-W47-011-hf-kimi-k31-pro-nvfp4-wave|Kimi-K3.1-Pro 公式 NVFP4 配布]]、[[items/2026-W47-016-hf-ripple-65b-wave|Ripple-65B]]、[[items/2026-W47-017-hf-inkling-2-wave|Inkling-2]] など本週 HF の新モデル量子化ウェーブが**同日に llama.cpp 側でサポート済み**であるため、「公式モデル→量子化配布→ローカル実行」のリードタイムが 1 日以内に短縮された。gemma-4 focus でも Gemma 4 streaming audio と graph 最適化が継続。火曜定例の**最強推し**候補。
