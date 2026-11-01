---
id: "2026-W45-046"
type: github
subtype: library
title: "vllm-project/llm-compressor: 0.14.0.1 + 0.12.0.3 + 0.7.1.5 (hotfix bundle)"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.15.0"
discovered: "2026-11-02"
published: "2026-10-29"
repo: "vllm-project/llm-compressor"
release_tag: "0.14.0.1+0.12.0.3+0.7.1.5"
models: []
architectures: []
methods: []
tech: []
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約

llm-compressor の **3 系列(0.14.x / 0.12.x / 0.7.1.x)に対する依存バージョン上限緩和の hotfix** が同週に集中して出た(いずれも @dhuangnm による1行変更)。本体の機能変更はなく、torch / transformers / numpy 等の上限を緩め、新しいランタイム上でもインストールできるようにする修正。

## 量子化関連の変更点

- なし(dependency 上限緩和のみ)。
- 同週に **0.15.0** が本リリースされており([[items/2026-W45-021-github-compressor-0150|0.15.0]])、新機能はそちらを参照。

## 影響範囲

- 既存の 0.14.x / 0.12.x / 0.7.1.x を pin している CI(reproducibility 目的)は、hotfix 版に移行することでランタイム依存の問題が解消。
- 量子化挙動は不変。

## 注目度コメント

**NORMAL** — hotfix bundle。本流は [[items/2026-W45-021-github-compressor-0150|0.15.0]] 側で記録。
