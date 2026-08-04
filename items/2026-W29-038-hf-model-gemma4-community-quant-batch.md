---
id: "2026-W29-038"
type: hf-model
title: "gemma-4 コミュニティ量子化バッチ(QAT→NVFP4 / MLX oQ4 / MXFP4)"
url: "https://huggingface.co/melcheikh/gemma-4-31B-it-qat-NVFP4-mse-Blackwell"
discovered: "2026-07-13"
published: "2026-07-06 〜 2026-07-12"
base_model: "google/gemma-4-31B-it-qat-q4_0-unquantized ほか"
models: [google/gemma-4]
architectures: [transformer, dense, moe]
methods: [NVFP4, MXFP4, GGUF]
tech: [low-bit-fp4, qat, weight-only]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で melcheikh/gemma-4-31B-it-qat-NVFP4-mse-Blackwell と mlx-community/unsloth-gemma-4-E4B-it-qat-oQ4 の quant_config 確認。他は HF 検索一覧で存在確認"
related: []
---

## 日本語要約
focus モデル **google/gemma-4** への今週のコミュニティ量子化群。代表例:
- **melcheikh/gemma-4-31B-it-qat-NVFP4-mse-Blackwell**: Google の QAT チェックポイント(qat-q4_0-unquantized)を起点に ModelOpt MSE 校正で NVFP4 化。「QAT→NVFP4 再量子化」というパイプラインが登場
- **mlx-community/unsloth-gemma-4-E4B-it-qat-oQ4**: QAT 版の MLX oQ4(OptiQ系) 4bit
- ほか BCCard/MoAI-gemma-4-31B/12B-mxfp4、undeadindustries の 26B-A4B nvfp4-hybrid + dflash drafter、jajmangold の fni8 シリーズ等

## 注目ポイント
- Google 公式 QAT 重みを他フォーマット(NVFP4/oQ4)へ**再量子化**する流れが確立しつつある。QAT の量子化グリッドと NVFP4 のグリッドの相互作用は未検証の論点

## 注目度コメント
個々は watching 相当だが google/gemma-4 focus のため normal に bump。QAT→NVFP4 の精度検証は手元評価(vLLM)の良い題材。
