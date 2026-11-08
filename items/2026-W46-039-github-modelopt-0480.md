---
id: "2026-W46-039"
type: github
subtype: library
title: "NVIDIA/Model-Optimizer: 0.48.0 (+ 0.47.1rc0, 0.47.1 bugfix)"
url: "https://github.com/NVIDIA/Model-Optimizer/releases/tag/0.48.0"
discovered: "2026-11-09"
published: "2026-11-02"
repo: "NVIDIA/TensorRT-Model-Optimizer"
release_tag: "0.48.0"
models: ["google/gemma-4", "moonshotai/Kimi-K2.7", "zai-org/GLM-5.1", "zai-org/GLM-5.2", "MiniMaxAI/MiniMax-M2.7", "MiniMaxAI/MiniMax-M3", "deepseek-ai/DeepSeek-V3", "Qwen/Qwen3", "Qwen/Qwen3.5", "Qwen/Qwen3.6", "nvidia/Nemotron"]
architectures: ["moe", "transformer", "mamba2", "hybrid"]
methods: ["NVFP4", "AutoRound", "GPTQ", "MXFP4"]
tech: ["low-bit-fp4", "low-bit-fp8", "low-bit-2", "low-bit-1bit", "microscaling-formats", "moe-quant", "kv-cache-quant", "weight-only", "mixed-precision", "qat", "ptq"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

ModelOpt 0.48.0 は **google/gemma-4-26B-A4B-it の NVFP4 checkpoint alias を初めて backfill (#modelopt_recipes/models/)**、同時に `moonshotai/Kimi-K2.7-Code`, `google/diffusiongemma-26B-A4B-it`, `zai-org/GLM-5.1/GLM-5.2`, `MiniMaxAI/MiniMax-M2.5/M3`, `deepseek-ai/DeepSeek-V3.1/V3.2`, `Qwen/Qwen3-235B-A22B-Instruct-2507/Thinking-2507`, `Qwen/Qwen3.6-27B` を alias 対象に。**Nemotron 3.5 Super VL PTQ recipe (NVFP4 experts + FP8 attention/Mamba + FP8 KV cache)** と **W4A4 NVFP4 PTQ+QAD tutorial for Qwen3.6-35B-A3B (Megatron-Bridge)** を公開。**Q8_0 / IQ1_S / IQ1_M / IQ2_XXS / IQ2_XS / IQ2_S weight-only quantization** を CUDA encoder付きで追加し、GPTQ が GGML フォーマット (iq1_s〜q8_0) をサポート。**vLLM fake-quant serving が pre-quantized FP8 / MLA + FP8 KV / NVFP4 で `--enforce-eager` 不要**に。0.47.1 は Triton 3.9 で NVFP4 fake quantization の Block Pointer 削除による失敗 (`NotImplementedError`) を修正する緊急 bugfix、0.47.1rc0 は空リリース。

## 量子化関連の変更点

- **Backfill の NVFP4 alias に `google/gemma-4-26B-A4B-it` が含まれる**: NVIDIA 公式 NVFP4 配布が gemma-4 focus に初めて正式接続。GLM-5.1/5.2, DeepSeek-V3.1/V3.2, Kimi-K2.7-Code, MiniMax-M2.5/M3, Qwen3-235B, Qwen3.6-27B も同時に backfill。
- **`layerwise.export_dir`**: layer ごとに quantized checkpoint shard を書き出しながら calibration、中断再開可能 (`layerwise.checkpoint_dir`)。FP8 / NVFP4、single-process、offloaded、multimodal、MTP 対応。
- **Nemotron 3.5 Super VL PTQ recipe**: routed + shared MoE expert を weight-MSE calibrated NVFP4、attention projections と Mamba `in_proj`/`out_proj`, `lm_head` を FP8、FP8 KV cache。latent MoE / router / embeddings と vision/audio encoder は BF16 維持。
- **IQ1_S / IQ1_M / IQ2_XXS / IQ2_XS / IQ2_S weight-only quantization** を CUDA encoder付きで追加 (1.75-2.5625 bpw)。**Q8_0 weight-only quantization** 追加。各 PTQ recipe は MLP/MoE のみ対象、calibration data が必要。
- **GPTQ が GGML フォーマット (iq1_s, iq1_m, iq2_xxs, iq2_xs, iq2_s, q8_0) をサポート**: 各 block を whole として量子化、後続 column で誤差補償、書き出しは GPTQ が選んだ code。**Importance-weighted search** (llama.cpp imatrix 相当)。
- **sparse attention indexer K/Q quantizer** を DeepSeek-V4 (vLLM + Megatron-Core) と GLM-5.3-Flash (vLLM) に、NVFP4 で追加。`indexer_k_nvfp4` / `indexer_q_nvfp4` unit。
- **MLA KV cache の NVFP4 fake quantization recipe `kv_nvfp4_mla`** (DeepSeek-V3, GLM-5.3-Flash など)、latent は NVFP4、RoPE key は FP8。
- **MoE expert-parallel communication の fake quantization**: `dispatch_quantizer` / `combine_quantizer` を vLLM routed expert + DeepGEMM MegaMoE に追加。
- **GatedDeltaNet chunk-boundary states + WY activations の dynamic FP8 fake quantization** (学習向け)。`fla-core==0.5.1` + chunk size 64 + SM89+。
- **mergeable LoRA QAD** for fake-quantized dense Megatron/Transformer Engine linear layers。
- **local-Hessian NVFP4 PTQ recipe** (`nvidia/Qwen3.8-27B-NVFP4` 配布で使用) + **composed AutoQuantize recipes** で PTQ/weight-AutoQ → KV-cache AutoQ の 2 段。
- vLLM fake-quant serving が `KV_QUANT_CFG` presets で MLA KV cache を正しく量子化 (vLLM 0.16+ で silently 無効だった問題を修正)、enforce-eager 不要化、`VLLM_DISABLE_COMPILE_CACHE=1` 既定。
- 0.47.1 は Triton 3.9 (PyTorch 26.11 コンテナ) 上で NVFP4 fake quantization が `Block pointers have been removed` で落ちる問題を修正 (SM89+)。

## 影響範囲

- BREAKING: `modelopt.torch.utils.distributed.broadcast`/`allgather` が未登録 custom class を拒否 (`torch.serialization.add_safe_globals` 必須)。
- `examples/deepseek/deepseek_v4/ptq.py` が DeepSeek-V4.1-Flash 対応 (`nvidia/DeepSeek-V4.1-Flash-NVFP4` の生成環境と同設定)。
- MLflow 統合: Megatron-Bridge の 5 スクリプトが `--mlflow` 対応、`.experiment.json` を checkpoint に書き込む。
- **Sparsity**: skip-softmax calibration で serving sparsity を validation prompts に対して検証、decode の KV-tile 粒度 128 token を保持。

## 注目度コメント

**gemma-4 focus 初の公式 NVFP4 alias** — W36/W45 で「gemma-4 公式 NVFP4 配布ゼロ」と報告してきた項目が本週解消。alias は portable recipe の参照なので実体は一般 expert-only NVFP4 recipe を使う。Nemotron-3.5-Super-VL の明示 PTQ recipe (NVFP4 experts + FP8 attn/Mamba/KV) は W45 llm-compressor 0.15.0 でも documented checkpoint として既出だったが、ModelOpt 側の PTQ 段が揃ったことで "量子化前段→QAD→配布" の完全ラインが見える。**IQ1 / IQ2 サポート**は低 bit 側で llama.cpp と ModelOpt が同じ space で戦う意味を持つ。TurboQuant / PolarQuant / QJL は本文言及ゼロ。
