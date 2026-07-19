---
id: "2026-W30-030"
type: hf-model
title: "microsoft/bitnet-embedding (270m / 0.6b) — BitNet 系 1.58bit 埋め込みモデル"
url: "https://huggingface.co/microsoft/bitnet-embedding-0.6b"
discovered: "2026-07-20"
published: "2026-07-15"
base_model: ""
models: []
architectures: [transformer, dense]
methods: []
tech: [low-bit-1bit, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-20 HF API で確認(0.6b: createdAt 2026-07-15, 347 DL / 15 likes, gguf + bitnet タグ / 270m: 255 DL / 10 likes)"
related: []
---

## 日本語要約
Microsoft が BitNet 系の**三値(1.58bit)埋め込みモデル**を 270m / 0.6b の2サイズで公開。GGUF 配布で bitnet タグ付き。生成 LLM で始まった BitNet 路線が埋め込み(retrieval)タスクに展開された形。DL 数はまだ小さいが、bitnet.cpp 系のエッジ retrieval を見据えた動きと読める。

## 注目度コメント
nvidia/Nemotron-3-Embed-1B-NVFP4 と同週に出た「埋め込みモデル量子化」のもう一方の極(FP4 vs 1.58bit)。トレンドの両端として記録。normal。
