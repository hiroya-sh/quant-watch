---
id: "2026-W30-022"
type: github
title: "TensorRT-LLM v1.3.0rc21 — MiniMax M3 MXFP8/NVFP4・Qwen3.6 NVFP4 チェックポイント対応"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc21"
discovered: "2026-07-20"
published: "2026-07-15"
repo: "NVIDIA/TensorRT-LLM"
models: [MiniMaxAI/MiniMax-M3, Qwen/Qwen3.6]
architectures: [moe]
methods: [NVFP4]
tech: [low-bit-fp4, kv-cache-quant, trtllm-ready, moe-quant]
priority: normal
sources: [github-releases]
status: new
verified: "2026-07-20 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
週次 RC。量子化関連の主な変更:
- **MiniMax M3 の MXFP8 / NVFP4 チェックポイント対応**(#15687, #15857)、**Qwen3.6 NVFP4 チェックポイント対応**(#15703)
- KV cache manager v2 のモデル別自動選択(#15823)、MLA KV cache サイズ見積り修正、RocketKV の FP8 KV cache バイト計上修正
- compressed-tensors FP8 rowwise の config 解決修正(#15415)、GLM-5.1 NVFP4 の未量子化 dense 層 fusion フォールバック修正(#15659)、Blackwell 上の NT3 NVFP4 性能回帰修正(#16031)
- Known issues に B300 マルチ GPU NVFP4 の精度不合格、NVFP4 KV 系の OOM など量子化構成の未解決問題が複数明記

## 注目度コメント
新モデル(MiniMax M3 / Qwen3.6)への NVFP4 展開が続く。TRT-LLM は次点エンジンのため bump なしで normal。
