---
id: "2026-W27-018"
type: hf-model
title: "nvidia/GLM-5.2-NVFP4"
url: "https://huggingface.co/nvidia/GLM-5.2-NVFP4"
discovered: "2026-06-29"
published: "2026-06-27"
base_model: "zai-org/GLM-5.2"
models: [zai-org/GLM-5.1]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, moe-quant]
priority: normal
sources: [hf-models]
status: new
model_ids:
  - "nvidia/GLM-5.2-NVFP4"
related: [2026-W26-012]
---

## 日本語要約
W26 で unsloth / mlx-community からサードパーティ FP8 / 4-bit が登場した GLM-5.2 の NVIDIA 公式 NVFP4 版が早くも W27 でリリース。W22→W25 の DeepSeek-V4-Pro / Nemotron-Ultra 路線と同様、サードパーティ先行 → NVIDIA 公式 NVFP4 の 1-2 週遅延パターンが GLM-5.2 でも踏襲された形。glm_moe_dsa（DSA インデクサーテンソル）の NVFP4 対応は公式実装としては初。

## モデル情報
- **ベースモデル**: zai-org/GLM-5.2（Zhipu AI）
- **アーキテクチャ**: glm_moe_dsa（MoE + DSA インデクサー）
- **多言語**: 英語・中国語

## 量子化バリアント
- **重み**: NVFP4
- **活性化**: NVFP4 dynamic per-token
- **KV cache**: FP8（NVFP4 KV は次回更新予定と README に明記）
- **対応エンジン**: TRT-LLM v1.3.0rc19、vLLM v0.23.1

## 精度報告
- MMLU -1.4pt、CMMLU（中国語）-1.6pt、GSM8K -2.1pt
- ChartQA -1.9pt（GLM-5.2 multimodal 経路）

## ダウンロード/利用状況
- 48 時間で 4.2K downloads
- 中国語タスクのリファレンス NVFP4 として注目

## 注目度コメント
focus 直接ヒットなし、ただし NVFP4 が focus（手法側で間接ヒット）。サードパーティ → NVIDIA 公式 NVFP4 の標準パターンが GLM-5.2 でも再現された節目。zai-org/GLM-5.2 は taxonomy 未登録（W26 新規タグ候補のまま）、W27 で登録判断が必要。
