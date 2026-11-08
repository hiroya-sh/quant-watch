---
id: "2026-W46-036"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.4.0rc3"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.4.0rc3"
discovered: "2026-11-09"
published: "2026-11-06"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.4.0rc3"
models: ["zai-org/GLM-5.2", "moonshotai/Kimi-K2.7", "MiniMaxAI/MiniMax-M3", "Qwen/Qwen3.5", "deepseek-ai/DeepSeek-V4", "Qwen/Qwen3"]
architectures: ["moe", "transformer", "hybrid"]
methods: ["NVFP4", "MXFP4", "MXFP6"]
tech: ["low-bit-fp8", "low-bit-fp4", "microscaling-formats", "moe-quant", "kv-cache-quant", "weight-only", "trtllm-ready"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

TRT-LLM v1.4.0rc3 は NVFP4 を "新 SM/新モデル" へ押し広げる rc。**GLM-5.2 の NVFP4 modeling_v2 target が GB300 (sm_103) 用に追加 (#20524, #20662)**、**MiniMax-M3 NVFP4 low-latency decode megakernel for Blackwell (#20306)**、**MiniMax-M3.1-Flash DSpark serving (#20922)**、**Kimi K3 native modeling + NVFP4 KV caching (FP4 MLA) with hybrid KV cache manager (#20888, #20893)**、**Qwen3.8-Flash-Next NVFP4 modeling_v2 の GB300 Pareto 最適化 (#20937)**。Muse Spark Open NVFP4 性能カバレッジ追加 (#21426)。既知問題: DSA モデル (GLM-5.2) で NVFP4 KV cache の出力誤り (vLLM 側と同根)。

## 量子化関連の変更点

- **Kimi K3 NVFP4 KV cache (FP4 MLA, #20888)** — DeepSeek-V4 MLA に続く MLA 系 NVFP4 KV 対応。
- **GLM-5.2 NVFP4 sm_103 TEP4 target (#20662)** + **GLM-5.2 NVFP4 low-latency decode target for GB300 (#20524)**。
- **MiniMax-M3 NVFP4 weight loading 修正 (#20694)**、index-K cache layer 修正 (#20693)、video timestamp 修正 (#20695)。
- **compressed-tensors NVFP4 weights を MiniMax-M3 でロード (#20694)**。
- **MXFP8 refit logit-overlap threshold を 0.85 に緩和 (#21357)** — refitting の精度余裕を取る調整。
- **Qwen3 NVFP4 CUTLASS RTX test timeout 拡張 (#21421)** — 性能検証コスト増。
- **CuteDSL NVFP4 MoE backend tests を大 intermediate_size で再有効化 (#21101)**。
- **FP8 block-scale low-M GEMM for decode projections (SM100/103, SM107 tactic tables, #20942)**。
- **sparse MLA attention** (DeepSeek-V4 generation, DSA Vanilla, #20209, #16309)。
- **FP8 MoE LoRA weights native サポート (#18555)** + DynamicEPLB runtime 統合 (#19646)。
- **merged quantization の exclude_modules の checkpoint 順序保持 (#20763)**。
- Known: DSA models (GLM-5.2) で NVFP4 KV cache が incorrect — W45 で既出の DSA × NVFP4 KV の実装未完了状態が継続。

## 影響範囲

- BREAKING: LlmRequest 未使用フィールド削除 (#21036)、TensorRT backend 互換面削除 (#21041)、serving frontend default (#19379)。
- API: OpenEngine gRPC に image/video/audio inputs (#20446, #20654, #20655)、Prometheus metrics (#21034)、Responses keepalive (#21061)。
- Fix: Wan I2V example の NVFP4 checkpoint 要求 (available でない、#20845)、PyPI wheel 公開のための直接 Git 依存削除 (#21502)。

## 注目度コメント

**NVFP4 focus** — W45 v1.4.0rc1/rc2 の delta。**Kimi K3 の NVFP4 MLA KV cache** は focus method を focus-adjacent モデルに適用した強いシグナル。GLM-5.2 の NVFP4 target が GB300 に出たことで NVIDIA の推奨配布が SM103/SM100 の NVFP4 ground truth に収束していく。TurboQuant / PolarQuant / QJL / gemma-4 言及ゼロ (release body 本文 grep 確認済み)。
