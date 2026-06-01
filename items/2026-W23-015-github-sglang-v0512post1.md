---
id: "2026-W23-015"
type: github
subtype: library
title: "sgl-project/sglang: v0.5.12.post1"
url: "https://github.com/sgl-project/sglang/releases/tag/v0.5.12.post1"
discovered: "2026-06-01"
published: "2026-05-26"
repo: "sgl-project/sglang"
release_tag: "v0.5.12.post1"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: []
tech: []
priority: watching
sources: [github]
status: new
related: []
---

## 日本語要約
SGLang v0.5.12のパッチリリース。12件のバグ修正が中心で主にDeepSeek-V4関連の安定性問題を解消。DSV4-Proの出力文字化け問題等を修正。量子化に関する新機能はなし。

## 量子化関連の変更点
- 新規対応手法/フォーマット: なし
- 既存手法の改善: なし
- 対応モデル拡張: DeepSeek-V4の安定性向上（間接的に量子化推論の信頼性向上）

## 影響範囲
- ユーザ視点の変化: DSV4の推論安定性向上
- API/CLI 変更の有無: なし（パッチのみ）

## 注目度コメント
量子化新機能なしのためwatching。DSV4ユーザへの安定性パッチとして実用的。
