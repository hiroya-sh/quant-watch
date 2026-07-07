---
id: "2026-W27-018"
type: hf-model
title: "nvidia/GLM-5.2-NVFP4"
url: "https://huggingface.co/nvidia/GLM-5.2-NVFP4"
discovered: "2026-07-07"
published: "2026-06-27"
base_model: "zai-org/GLM-5.2"
models: []
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, weight-only, activation-quant, moe-quant, vllm-ready]
priority: normal
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 nvidia/GLM-5.2-NVFP4 の実在確認。精度表・DL数は捏造のため削除。"
related: [2026-W26-012]
---

## 日本語要約
NVIDIA 公式による zai-org/GLM-5.2 の NVFP4 量子化モデル。**リポジトリ実在確認済み**。旧版の精度表・ダウンロード数・DSA テンソル詳細は裏取りできず削除。

## 確認できた事実
- `nvidia/GLM-5.2-NVFP4` 実在、NVFP4 量子化、vllm-ready
- 間接的に NVFP4(focus)ヒット

## 注目度コメント
NVFP4 系の継続。GLM-5.2 は taxonomy 未登録（zai-org/GLM-5.1 のみ登録）、登録判断は新規タグ候補で。
