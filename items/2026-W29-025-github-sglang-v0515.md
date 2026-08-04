---
id: "2026-W29-025"
type: github
title: "SGLang v0.5.15 — GLM-5.2 NVFP4 の本番チューニング(500+ tok/s/user on 8x B300)"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.15"
discovered: "2026-07-13"
published: "2026-07-10"
repo: "sgl-project/sglang"
models: [zai-org/GLM-5.2, Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, low-bit-fp8, moe-quant]
priority: high
sources: [github-releases]
status: new
verified: "2026-07-13 gh api で release note 本文確認(published_at 2026-07-10)"
related: []
---

## 日本語要約
SGLang v0.5.15。**GLM-5.2 NVFP4 を Blackwell 向けに本番チューニング**し、bs=1 で 500+ tok/s/user (8x B300)、450 (4x GB300) を公表。Qwen3.6 の ModelOpt mixed NVFP4 対応 (#27906, #29905)、NVFP4 Expert 量子化への SiLU+Mul 融合 (CUTLASS MoE)、AMD 向け GLM-5.1 MXFP4 (MI355X)、Qwen-Image ModelOpt NVFP4、新モデル Hy3 (Tencent Hunyuan 3) 対応。

## 注目ポイント
- NVFP4 の「本番プロファイル公開」(cookbook + ベンチ)は運用レシピとしてそのまま使える
- vLLM / SGLang の両方が同週に GLM-5.2 / Hy3 / NVFP4 を強化——エンジン間競争が NVFP4 に収斂

## 注目度コメント
NVFP4 focus 直撃。エンジンは vLLM 優先方針だが、SGLang の GLM-5.2 NVFP4 数値は比較基準として有用。high。
