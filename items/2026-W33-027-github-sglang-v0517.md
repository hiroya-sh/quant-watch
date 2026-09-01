---
id: "2026-W33-027"
type: github
subtype: library
title: "sgl-project/sglang: v0.5.17"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.17"
discovered: "2026-08-10"
published: "2026-08-08"
repo: "sgl-project/sglang"
release_tag: "v0.5.17"
models: [moonshotai/Kimi-K2.7, MiniMaxAI/MiniMax-M3]
architectures: [moe, hybrid, linear-attention]
methods: [MXFP4, NVFP4]
tech: [low-bit-fp4, moe-quant, kv-cache-quant, vllm-ready, llamacpp-ready, speculative-decoding]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約
SGLang v0.5.17(194貢献者・582 PR)。**Kimi K3(2.8T LatentMoE, 896 experts top-16, 1M context, KDA線形attention×69 + MLA×24)をnative MXFP4チェックポイントでday-0対応**。DCP/DSpark speculative decoding/KDA-aware prefix caching/量子化重み上のLoRAをGB300とAMD MI35xで検証。nvidia/MiniMax-M3-NVFP4も追加。

## 量子化関連の変更点
- 新規対応: Kimi K3のnative MXFP4サービング(day-0)、nvidia/MiniMax-M3-NVFP4
- Laguna-S-2.1 / Inkling-Small / LFM2.5 / EmbeddingGemma のcookbook追加
- MiniMax-H3(動画+音声生成)をSGLang-Diffusionでnative対応

## 影響範囲
- ユーザ視点: 2.8TのMXFP4 MoEをチェックポイント変換なしでday-0に立てられる。KDA線形attention + MLAのhybridを量子化込みで扱える
- W31から継続のLaguna/Inkling系がcookbook化

## 注目度コメント
native MXFP4のday-0サービングは監視方針(vLLM/エンジンで完結する評価)と親和。Kimi K3という2.8T級MoEをMXFP4で扱える点が目玉。議題候補。
