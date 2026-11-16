---
id: "2026-W47-003"
type: paper
title: "TraceKV: Policy-Preserving Low-Rank KV Cache Compression for Reasoning Vision-Language Models"
url: "https://arxiv.org/abs/2611.15569"
discovered: "2026-11-16"
published: "2026-11-11"
authors: [arxiv:2611.15569]
venue: "arXiv:2611.15569"
models: []
architectures: [dense]
methods: []
tech: [kv-cache-quant, low-bit-4, mixed-precision]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
推論 VLM は長い multimodal 文脈と伸びる reasoning trace で KV cache が爆発する。Low-rank KV 圧縮は有望だが、既存手法は **dense モデルからの policy drift(予測行動のズレ)が圧縮率と共に大きくなる**。TraceKV は low-rank 分解と**行動保存制約**を組合せ、推論軌跡を保ったまま KV 圧縮可能。更に FP4 KV 量子化と直列合成できる。

## 手法
- KV を低次元 latents に射影し、policy-preservation loss で分解を学習
- quantization と**合成可能**(low-rank → NVFP4/MXFP4 KV の 2 段階)
- reasoning trace の step 次元に沿って per-step ではなく per-rollout で圧縮予算を割り振る

## 評価
- 対象モデル: Qwen-VL / InternVL 系 reasoning VLM
- KV 圧縮率: 従来 low-rank より accuracy 保持大
- 量子化合成: NVFP4 KV と組んだときの最終精度を分析

## 既存手法との差分
W46 の [[items/2026-W46-005-paper-flagrot-selective-rotation-kv|FlagRot]] や DepthGraft が KV に rotation / cross-layer 冗長性を使うのに対し、TraceKV は **reasoning trace 軸と policy drift を主軸**。VLM 特化で reasoning 用途が増えた 2026 Q4 文脈にフィット。

## 注目度コメント
kv-cache-quant focus + VLM。推論モデルの KV 肥大が serve 課題になっている 2026 Q4、**reasoning trace を壊さない KV 圧縮**という軸は実装側で広がる。vLLM の reasoning VLM 対応(GLM-5.3 等)と合わせて検証価値あり。
