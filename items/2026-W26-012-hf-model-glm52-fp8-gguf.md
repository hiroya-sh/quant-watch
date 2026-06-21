---
id: "2026-W26-012"
type: hf-model
title: "unsloth/GLM-5.2-FP8 + GLM-5.2-GGUF / mlx-community/GLM-5.2-4bit"
url: "https://huggingface.co/unsloth/GLM-5.2-FP8"
discovered: "2026-06-22"
published: "2026-06-17"
models: [zai-org/GLM-5.1]
architectures: [transformer, moe]
methods: [GGUF]
tech: [low-bit-fp8, weight-only, low-bit-4, moe-quant]
priority: normal
sources: [hf-models]
status: new
model_ids:
  - "unsloth/GLM-5.2-FP8"
  - "unsloth/GLM-5.2-GGUF"
  - "mlx-community/GLM-5.2-4bit"
related: []
---

## 日本語要約
Zhipu AI（ZAI）の新モデルGLM-5.2の量子化版が今週登場。unslothからFP8量子化（transformers形式）とGGUFの2形式が2026-06-17にリリース、mlx-communityから4-bit MLX版が2026-06-20にリリース。GLM-5.2はGLM-5.1の後継でglm_moe_dsa（モデルタイプ）を採用したMoEアーキテクチャ。ベースモデルはzai-org/GLM-5.2。arxivタグから2602.15763・2603.12201の論文と関連。

## モデル情報
- **ベースモデル**: zai-org/GLM-5.2（Zhipu AI）
- **アーキテクチャ**: glm_moe_dsa（MoE + DSAインデクサーテンソル）
- **言語**: 英語・中国語（多言語対応）

## 量子化バリアント
- **unsloth/GLM-5.2-FP8**: FP8量子化（transformers形式、MIT License）- 2026-06-17
- **unsloth/GLM-5.2-GGUF**: GGUF形式 - 2026-06-17
- **mlx-community/GLM-5.2-4bit**: MLX 4-bit量子化（Apple Silicon向け）- 2026-06-20

## 注目度コメント
taxonomy.ymlにはzai-org/GLM-5.1が登録済みだが、GLM-5.2は新バリアント（後継モデル）。同週内にunsloth+mlx-communityの両方からリリースされた。glm_moe_dsa + DSAインデクサーという独自アーキテクチャのFP8対応が注目点。taxonomyへのGLM-5.2追加を検討（新規タグ候補参照）。
