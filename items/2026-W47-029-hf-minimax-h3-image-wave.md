---
id: "2026-W47-029"
type: hf-model
title: "MiniMax-H3-Image quantization wave (FP8 / GGUF / NVFP4, 25 variants / 230K DL)"
url: "https://huggingface.co/unsloth/MiniMax-H3-Image-FP8"
discovered: "2026-11-16"
published: "2026-11-11"
base_model: "MiniMaxAI/MiniMax-H3-Image"
models: [MiniMaxAI/MiniMax-M3]
architectures: [hybrid]
methods: [GGUF, NVFP4]
tech: [weight-only, low-bit-fp8, low-bit-fp4, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**MiniMax-H3-Image**(image generation 系の MiniMax 最新)が本週リリースされ、量子化配布が爆発。25 variants、合計 **230,620 DL**(本週 HF model wave で圧倒的トップ)。unsloth/MiniMax-H3-Image-FP8(8984 DL, 33 ❤)と GGUF / NVFP4 / NVFP4-FP8 の変種が続々。llama.cpp v1.0.0(本週)で image mmproj 側の MiniMax 対応は未確認(text 版 MiniMax-M3 系列のみ)。

## 量子化仕様
- 25 モデル、合計 230,620 DL(本週最大 wave)
- 上位:
  - Abiray/MiniMax-H3-Image-GGUF(127,803 DL / 241 ❤, 11-11)
  - Hearthscale/MiniMax-H3-Image-GGUF(46,781 DL)
  - LSDJesus/MiniMax-H3-Image-fp8-nvfp4(16,246 DL / 14 ❤)
  - AtomicChat/MiniMax-H3-Image-GGUF(13,047 DL)
  - unsloth/MiniMax-H3-Image-FP8(8,984 DL, 33 ❤)
- フォーマット: GGUF 中心、FP8, NVFP4, NVFP4-FP8 混在、ComfyUI 向け派生あり
- ベースモデル MiniMaxAI/MiniMax-H3-Image(image gen, hybrid attention)

## 精度報告
- Image gen の eval はベンチ標準なし、コミュニティのビジュアル検証が主。

## ダウンロード/利用状況
- 本週 HF model wave の**圧倒的トップ**。純粋な LLM ではなく **image generation モデル**だが、量子化配布の勢いが桁違い。
- ComfyUI エコシステムでの NVFP4 配布(online2311, prithivMLmods)が目立つ。

## 注目度コメント
LLM 量子化 focus からは**周辺**だが、**NVFP4 × ComfyUI × image gen** は 2026 Q4 で急成長している配布経路。ComfyUI 側の NVFP4 ワークフロー実装が揃いつつあることを示す指標。LLM 側では直接の実験対象ではないが、量子化配布の実運用パイプラインとしてはトップ事例。
