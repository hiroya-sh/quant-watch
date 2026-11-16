---
id: "2026-W47-010"
type: github
subtype: library
title: "vllm-project/llm-compressor: 0.10.0.5 + 0.9.0.6 (dependency relax hotfixes)"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.10.0.5"
discovered: "2026-11-16"
published: "2026-11-10"
repo: "vllm-project/llm-compressor"
release_tag: "0.10.0.5 / 0.9.0.6"
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [github]
status: new
related: [2026-W45-github-llm-compressor-0150]
---

## 日本語要約
0.10.0 (W45 の #3410 推定) と 0.9.0 の 2 系列に**依存上限緩和の hotfix**。新機能はなし。0.10.0.5 (#3422)、0.9.0.6 (#3424) いずれも dependency upper bounds の relax のみ。

## 量子化関連の変更点
- 新規対応手法/フォーマット: なし
- 既存手法の改善: なし
- 対応モデル拡張: なし

## 影響範囲
- 旧バージョンでの依存解決エラー解消のみ。QAD / HIGGS / MoNe / REAP(W45 で追加)のパイプラインは本週変更なし。

## 注目度コメント
**今週の llm-compressor 側は実機能更新なし**。Red Hat AI / vLLM 側は本週 vLLM の release は無く(W46 で v0.33.0rc3、本週 rc4 相当は未着地)、`compressed-tensors` も tagless release なし。serve 層の量子化は**今週は静かな週**。
