---
id: "2026-W27-011"
type: github
subtype: library
title: "vllm-project/vllm: v0.23.1"
url: "https://github.com/vllm-project/vllm/releases/tag/v0.23.1"
discovered: "2026-07-07"
published: "2026-06-24"
repo: "vllm-project/vllm"
release_tag: "v0.23.1"
models: []
architectures: [transformer, moe]
methods: []
tech: [vllm-ready]
priority: normal
sources: [github]
status: verified-minimal
verified: "2026-07-07 v0.23.x パッチ系列の実在は確認。個別変更(PR番号/ベンチ/特定手法統合)は未検証のため本文から除去。"
related: [2026-W25-010]
---

## 日本語要約
vLLM の v0.23.x パッチリリース。**タグの実在は確認済み**。旧版本文にあった具体的 PR 番号・ベンチ数値・特定手法(PolarQuant-KV 等)の統合記述は一次情報で裏取りできなかったため削除。正確な変更点は公式 release notes を参照。

## 確認できた事実
- v0.23.x 系列は実在（W25-010 の v0.23.0 の後継パッチ）
- vLLM の native KV 量子化は FP8 のみ（`kv_cache_dtype=fp8`）

## 注目度コメント
vllm-ready の基盤。詳細変更は要 release notes 確認。
