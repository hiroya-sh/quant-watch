---
id: "2026-W30-023"
type: github
title: "SGLang v0.5.15.post1 — GLM 5.2 修正群 + FP4 MoE カーネルの NaN 修正"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.15.post1"
discovered: "2026-07-20"
published: "2026-07-14"
repo: "sgl-project/sglang"
models: [zai-org/GLM-5.2]
architectures: [moe]
methods: []
tech: [low-bit-fp4, moe-quant]
priority: normal
sources: [github-releases]
status: new
verified: "2026-07-20 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
GLM 5.2 中心のパッチリリース。量子化関連では **#31001: flashinfer の trtllm FP4 MoE カーネルが長い入力で NaN を出す問題の修正**が重要。ほか GLM 5.2 IndexShare の PD disaggregation / Context Parallel 設定での修正、非 CUDA/HIP デバイスでの DSA モデル起動修正など。

## 注目度コメント
W29 で「GLM-5.2 NVFP4 運用のリファレンス」と位置づけた SGLang 本番パスの安定化。FP4 MoE の長文入力 NaN は NVFP4 評価で踏み得た地雷。normal。
