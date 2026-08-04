---
id: "2026-W30-028"
type: hf-model
title: "Inkling (Thinking Machines) 量子化ウェーブ — unsloth GGUF + RedHatAI FP8"
url: "https://huggingface.co/unsloth/inkling-GGUF"
discovered: "2026-07-20"
published: "2026-07-14"
base_model: "thinkingmachines/Inkling"
models: []
architectures: [transformer]
methods: [GGUF]
tech: [low-bit-fp8, llamacpp-ready, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-20 HF API で確認(unsloth/inkling-GGUF: createdAt 2026-07-14, 6.8k DL / 104 likes, base=thinkingmachines/Inkling, image-text-to-text / RedHatAI/Inkling-FP8-dynamic: createdAt 2026-07-15, compressed-tensors float-quantized 8bit, vllm タグ / RedHatAI/Inkling-FP8-block も 2026-07-16 に追加)"
related: []
---

## 日本語要約
Thinking Machines 初の公開モデル **Inkling**(VLM, image-text-to-text)への量子化対応が公開週内に完了。unsloth の GGUF(104 likes)、RedHatAI の FP8-dynamic / FP8-block(compressed-tensors、vLLM 直接ロード可)が出揃った。新興ラボのモデルが即週で「GGUF + vLLM-ready FP8」の標準量子化セットを獲得するパターンが定着しつつある。

## 注目度コメント
新モデルの量子化エコシステム即日形成の最新例。RedHatAI FP8 は vllm-ready bump 適用で high。taxonomy 新規タグ候補: `thinkingmachines/Inkling`。VLM の FP8 挙動は要ウォッチ。
