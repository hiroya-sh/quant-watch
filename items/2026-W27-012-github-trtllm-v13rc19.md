---
id: "2026-W27-012"
type: github
subtype: library
title: "NVIDIA/TensorRT-LLM: v1.3.0rc19"
url: "https://github.com/NVIDIA/TensorRT-LLM/releases/tag/v1.3.0rc19"
discovered: "2026-07-07"
published: "2026-06-23"
repo: "NVIDIA/TensorRT-LLM"
release_tag: "v1.3.0rc19"
models: []
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, trtllm-ready]
priority: normal
sources: [github]
status: verified-minimal
verified: "2026-07-07 v1.3.0rc19 タグ実在確認(RCのみ, stable v1.3.0は未存在)。個別PR/ベンチは未検証のため除去。"
related: [2026-W25-011]
---

## 日本語要約
TensorRT-LLM v1.3.0 系の RC タグ（rc19、2026-06 リリース）。**タグの実在は確認済み**。旧版本文の具体的 PR 番号・ベンチ数値・「PolarQuant-KV 追随」記述は裏取りできず削除。NVFP4 系の機能追加が中心と見られるが、詳細は公式 release notes を参照。

## 注意
- v1.3.0 は **RC のみ存在（stable は未リリース）**。「v1.3.0 stable」を謳う記述は誤り。
- trtllm-ready の基盤だが、監視方針の高評価対象は vLLM 側。

## 注目度コメント
NVFP4 focus 関連。詳細は要 release notes 確認。
