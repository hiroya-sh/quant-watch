---
id: "2026-W29-034"
type: hf-model
title: "Tencent Hy3 (Hunyuan 3) コミュニティ量子化ウェーブ — kodelow/Hy3-NVFP4-W4A16 ほか"
url: "https://huggingface.co/kodelow/Hy3-NVFP4-W4A16"
discovered: "2026-07-13"
published: "2026-07-06 〜 2026-07-11"
base_model: "tencent/Hy3"
models: []
architectures: [transformer, moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, moe-quant, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で kodelow/Hy3-NVFP4-W4A16 の quant_config 確認 (compressed-tensors nvfp4-pack, experts 4bit, base tencent/Hy3)。他ウェーブ各項は HF 検索一覧で存在確認"
related: []
---

## 日本語要約
Tencent の新 MoE モデル **Hy3 (Hunyuan 3)** に対するコミュニティ量子化が今週一斉に発生。代表格の kodelow/Hy3-NVFP4-W4A16(6.4k DL / 11 likes)は compressed-tensors nvfp4-pack で expert のみ 4bit 化。ほかに olka-fi/Hy3-MXFP4 (2.8k DL)、LibertAIDAI/Hy3-NVFP4、r0b0tlab/Hy3-295B-NVFP4、vroomfondel/Hy3-NVFP4-W4A4、mlx-community/Hy3-oQ2 / Hy3-preview-MTP-4bit など 10 件超。

## 注目ポイント
- vLLM v0.25.0 (#47192) と SGLang v0.5.15 が同週に Hy3 を正式サポート——モデル公開→エンジン対応→コミュニティ量子化が1週間で完結する最速パターン
- expert-only NVFP4(W4A16)構成が事実上のコミュニティ標準になりつつある

## 注目度コメント
新しい主要 MoE モデルへの新規適用 + compressed-tensors で vllm-ready。high。taxonomy への `tencent/Hy3` 追加を提案(新規タグ候補)。
