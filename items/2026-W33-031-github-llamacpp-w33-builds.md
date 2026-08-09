---
id: "2026-W33-031"
type: github
subtype: library
title: "ggml-org/llama.cpp: 146 builds (b10141–b10333)"
url: "https://github.com/ggml-org/llama.cpp/releases"
discovered: "2026-08-10"
published: "2026-08-09"
repo: "ggml-org/llama.cpp"
release_tag: "b10141..b10333"
models: []
architectures: []
methods: [GGUF]
tech: [llamacpp-ready]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
収集窓(2026-07-27〜08-09)でllama.cppはmasterから146ビルド(b10141〜b10333)をリリース。個別の量子化新機能というより継続的なkernel/モデル対応の積み上げ。窓内の主要新モデル(DeepSeek-V4-Flash / Ling-3.0-flash / gpt-oss系)のGGUFが多数コミュニティから公開された時期と重なる。

## 量子化関連の変更点
- 継続的なGGUFフォーマット/量子化kernelのメンテと新モデルアーキ対応
- 個別releaseのquant特筆点は各ビルドのcommitに分散(集約アイテムとして扱う)

## 影響範囲
- ユーザ視点: 新モデルのGGUF実行が随時可能に(llamacpp-ready)
- 週146ビルドの高頻度リリース継続

## 注目度コメント
GGUFエコシステムの基盤。DeepSeek-V4/Ling-3.0のGGUFウェーブ(items 032/033)の実行基盤。
