---
id: "2026-W30-026"
type: hf-model
title: "AngelSlim/Hy3-GGUF + Hy3-GPTQ-Int4 — Tencent 公式量子化ラインの Hy3 対応"
url: "https://huggingface.co/AngelSlim/Hy3-GGUF"
discovered: "2026-07-20"
published: "2026-07-13"
base_model: "tencent/Hy3"
models: []
architectures: [moe, transformer]
methods: [GGUF, GPTQ]
tech: [low-bit-4, moe-quant, weight-only, llamacpp-ready, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-20 HF API で両 repo 確認(GGUF: createdAt 2026-07-13, 110k DL / GPTQ-Int4: createdAt 2026-07-14, quant_method=gptq bits=4, base_model=tencent/Hy3, arch=HYV3ForCausalLM, moe タグ)"
related: []
---

## 日本語要約
Tencent の量子化ツールキット org **AngelSlim** による Hy3(Hunyuan 3、MoE)の公式量子化配布。GGUF 版は公開1週間で **110k DL / 137 likes** と今週の HF 量子化モデルで断トツ。翌日には GPTQ-Int4 版(quant_method=gptq, 4bit)も追加され、llama.cpp 経路と vLLM 経路(GPTQ は vLLM 直接ロード可)の両方が「モデルベンダー公式」で揃った。

## 注目度コメント
W29 で観察した「Hy3 の即日エコシステム化」がベンダー公式量子化まで到達。GPTQ-Int4 は vLLM でロード可能なため vllm-ready bump 適用で high。taxonomy 新規タグ候補 `tencent/Hy3` の追加判断を推す(2週連続で頻出)。
