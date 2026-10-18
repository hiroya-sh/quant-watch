---
id: "2026-W43-049"
type: hf-model
title: "BennyDaBall/EmbeddingGemma-2-NVFP4-GGUF (量子化ウェーブ)"
url: "https://huggingface.co/BennyDaBall/EmbeddingGemma-2-NVFP4-GGUF"
discovered: "2026-10-19"
published: "2026-10-17"
base_model: "EmbeddingGemma-2-NVFP4-GGUF"
models: [google/gemma-4]
architectures: [transformer]
methods: [NVFP4, GGUF]
tech: [low-bit-fp4, vllm-ready, llamacpp-ready]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
**EmbeddingGemma-2 の NVFP4-GGUF 配布**。llama.cpp v0.7.0 (#30054) と vLLM v0.32.0 (#60254) が同週に EmbeddingGemma-2 (text+image+audio+video omni-modal 埋め込み) を公式サポートしたタイミングに合わせ、BennyDaBall が NVFP4-GGUF 版を公開。gemma-4 系(focus:google/gemma-4 の substring match 対象)でもある。

## 量子化バリエーション(本週 window 内公開のみ)
- [`BennyDaBall/EmbeddingGemma-2-NVFP4-GGUF`](https://huggingface.co/BennyDaBall/EmbeddingGemma-2-NVFP4-GGUF) — EmbeddingGemma-2 の NVFP4-GGUF 配布 (DL=1,205, 2026-10-15)

## 補足
- ベースモデル: google/embeddinggemma-2(omni-modal 埋め込みモデル)
- llama.cpp v0.7.0 + vLLM v0.32.0 が同週に native 対応
- focus:google/gemma-4 の substring match で bump 対象
