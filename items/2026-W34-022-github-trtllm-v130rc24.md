---
id: "2026-W34-022"
type: github
subtype: library
title: "TRT-LLM v1.3.0rc24"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc24"
discovered: "2026-08-17"
published: "2026-08-12"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc24"
models: [nvidia/Nemotron, Qwen/Qwen3, deepseek-ai/DeepSeek-V4, MiniMaxAI/MiniMax-M3, mistralai/Mistral]
architectures: [moe, mamba, hybrid]
methods: [NVFP4]
tech: [trtllm-ready, low-bit-fp8, moe-quant, kv-cache-compression-non-quant]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
TRT-LLM の rc。**W4A8 実行**(Qwen3.5-397B 含む)、**Marlin NVFP4 を Ada Lovelace に、W4A16 NVFP4 を SM120 に有効化**、Nemotron-H 量子化ロード改善、DeepSeek-V4 FP8 MoE scaling 修正、MiniMax M3 の QK-norm/RoPE/量子化融合最適化、**TriAttention KV-cache 圧縮 config** と batched physical compaction、KVCacheManagerV2 導入。既知問題として Mistral Large 3 675B の NVFP4 で GSM8K 精度低下、Qwen3 MoE の FP8 block-scale が Blackwell で起動失敗など。

## 量子化関連の変更点
- 新規対応手法/フォーマット: Marlin NVFP4 (Ada), W4A16 NVFP4 (SM120), W4A8 実行 (#16642)
- 既存手法の改善: DeepSeek-V4 FP8 MoE scaling 修正, FP8 block-scale MoE fallback 復旧, Nemotron-H 量子化ロード
- 対応モデル拡張: Qwen3.5-397B FP8, MiniMax M3, TriAttention KV 圧縮

## 影響範囲
- ユーザ視点の変化: Ada/SM120 世代でも NVFP4 が動く。W4A8 対応拡大。ただし一部 NVFP4/FP8 block-scale に既知精度・起動問題
- API/CLI 変更の有無: block_reuse_policy → block_reuse_config.policy (BREAKING)

## 注目度コメント
focus の NVFP4 が Ada/SM120 に降りてきた点は評価環境の裾野拡大。trtllm-ready。ただし rc かつ既知精度問題ありで追随判断は慎重に。
