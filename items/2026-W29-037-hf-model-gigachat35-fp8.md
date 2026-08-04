---
id: "2026-W29-037"
type: hf-model
title: "ai-sage/GigaChat3.5-432B-A28B(FP8 ネイティブ公開)"
url: "https://huggingface.co/ai-sage/GigaChat3.5-432B-A28B"
discovered: "2026-07-13"
published: "2026-07-05"
base_model: "ai-sage/GigaChat3.5-432B-A28B-base"
models: []
architectures: [transformer, moe, hybrid, linear-attention]
methods: []
tech: [low-bit-fp8, weight-only]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-07-05, quant_method fp8, SSM系パラメータを除外)"
related: []
---

## 日本語要約
Sber (ai-sage) の **GigaChat3.5-432B-A28B** が FP8 量子化済みチェックポイントとして公開(61 likes)。hybrid-attention / linear-attention / MoE / MTP のタグを持ち、quant_config の除外リストに A_log・conv1d・dt_bias など **SSM/linear-attention 系パラメータ**が並ぶ点が特徴——ハイブリッド構造の FP8 化で何を守るかの実例。

## 注目度コメント
ハイブリッド(linear attention)大規模 MoE の公式 FP8 リリースとして記録。normal。models タグ候補: `ai-sage/GigaChat3.5`(taxonomy 未登録)。
