---
id: "2026-W29-026"
type: github
title: "TensorRT Model Optimizer 0.45.0 — w4a16_nvfp4(校正不要 NVFP4 weight-only)/ MXFP4→NVFP4 bit-exact 変換"
url: "https://github.com/NVIDIA/TensorRT-Model-Optimizer/releases/tag/0.45.0"
discovered: "2026-07-13"
published: "2026-07-06"
repo: "NVIDIA/TensorRT-Model-Optimizer"
models: [deepseek-ai/DeepSeek-V4, nvidia/Nemotron]
architectures: [transformer, moe, hybrid, mamba]
methods: [NVFP4, MXFP4]
tech: [weight-only, low-bit-fp4, kv-cache-quant, calibration-free, mixed-precision, moe-quant, vllm-ready]
priority: high
sources: [github-releases]
status: new
verified: "2026-07-13 gh api で release note 本文確認(published_at 2026-07-06)"
related: []
---

## 日本語要約
ModelOpt 0.45.0。新フォーマット **w4a16_nvfp4**(FP4 weight group_size=16 + BF16 activation、**校正フォワード不要**、vLLM デプロイ対応)。**MXFP4→NVFP4 の closed-form でビット厳密な変換フラグ**(GPT-OSS 系 / DeepSeek-V4 routed expert 向け)。FP8/NVFP4 の KV cache cast プリセット第一級化、MoE 有効パラメータを考慮した auto_quantize コスト計算、Nemotron-3-Super-120B-A12B の NVFP4 レシピ(W4A4 expert + FP8 shared)追加。

## 注目ポイント
- 校正不要 NVFP4 weight-only は「Claude だけで評価実験を完結」方針に最も適合するツール強化
- MXFP4→NVFP4 変換は既存 MXFP4 資産(GPT-OSS 等)の Blackwell 移行パスを開く

## 注目度コメント
NVFP4 focus 直撃、vLLM デプロイ明記で vllm-ready。high。
