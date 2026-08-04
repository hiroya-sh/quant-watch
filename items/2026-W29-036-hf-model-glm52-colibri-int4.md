---
id: "2026-W29-036"
type: hf-model
title: "jlnsrk/GLM-5.2-colibri-int4"
url: "https://huggingface.co/jlnsrk/GLM-5.2-colibri-int4"
discovered: "2026-07-13"
published: "2026-07-06"
base_model: "zai-org/GLM-5.2-FP8"
models: [zai-org/GLM-5.2]
architectures: [transformer, moe]
methods: []
tech: [low-bit-4, weight-only, _uncategorized]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config/tags 確認 (createdAt 2026-07-06, tags: int4/cpu/expert-streaming/colibri)"
related: []
---

## 日本語要約
GLM-5.2 を **CPU + expert-streaming 実行系「colibri」向けに INT4 化**したモデル(1.7k DL / 42 likes)。感度の高い層(特定の layernorm / gate バイアス / kv_a_layernorm)を除外リストで保護する構成。MoE の expert を必要時にストリーミングする CPU ランタイム向けという点がユニーク。

## 注目度コメント
likes 42 とコミュニティ関心が高い。colibri ランタイムの実体は要調査(新規 tech タグ候補: `expert-streaming`)。normal。
