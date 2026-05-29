---
id: "2026-W22-009"
type: github
subtype: library
title: "llama.cpp: NVFP4 MTP scale tensors for Qwen3.5 (b9297)"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/b9297"
discovered: "2026-05-23"
published: "2026-05-23"
repo: "ggml-org/llama.cpp"
release_tag: "b9297"
models: [Qwen/Qwen3.5]
architectures: [transformer]
methods: [NVFP4, GGUF]
tech: [low-bit-fp4, microscaling-formats]
priority: high
sources: [github]
status: new
related: ["2026-W22-002", "2026-W22-004", "2026-W22-007", "2026-W22-025"]
---

## 日本語要約

llama.cpp b9297でNVFP4 MTPスケールテンソルのサポートを追加。Qwen3.5のMTPテンソルもリンク済み。NVFP4フォーマット（NVIDIA Blackwell GPUのネイティブFP4）のGGUF対応を強化するビルド。NVIDIAが推進するFP4量子化フォーマットがllama.cppのエコシステムに本格統合される節目。

## 量子化関連の変更点

- 新規対応手法/フォーマット: NVFP4 MTPスケールテンソルのサポート追加
- 既存手法の改善: Qwen3.5 MTPテンソルとのリンク
- 対応モデル拡張: Qwen/Qwen3.5（NVFP4形式）

## 影響範囲

- ユーザ視点の変化: Qwen3.5のNVFP4 GGUFモデルが正しくロード・実行可能に
- API/CLI 変更の有無: なし（ライブラリ内部の対応）

## 注目度コメント

`NVFP4`（focus method）。BlackwellのFP4がllama.cppのメインストリームに入るマイルストーン。同週のThriftAttention (2026-W22-007)・Mix-Quant (2026-W22-004) とあわせてFP4エコシステム拡大の文脈で紹介価値高い。
