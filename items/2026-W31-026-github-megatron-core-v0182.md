---
id: "2026-W31-026"
type: github
subtype: library
title: "Megatron-LM core_v0.18.2 — メンテナンスリリース(fast-hadamard-transform をビルド依存に追加)"
url: "https://github.com/NVIDIA/Megatron-LM/releases/tag/core_v0.18.2"
discovered: "2026-07-27"
published: "2026-07-21"
repo: "NVIDIA/Megatron-LM"
release_tag: "core_v0.18.2"
models: []
architectures: [transformer]
methods: []
tech: [rotation]
priority: watching
sources: [github-releases]
status: new
verified: "2026-07-27 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
Megatron Core のパッチリリース。内容はほぼメンテナンス(TE cross entropy loss fusion の無効化ガード、transformer-engine v2.16.post へのバンプ、flash_mla のソースビルド化)。量子化文脈で目を引くのは **`fast-hadamard-transform` がビルド依存に追加**された点 (#5447) で、学習側での Hadamard 変換(rotation 系 QAT / FP8 学習の外れ値処理)利用の布石の可能性がある。

## 量子化関連の変更点
- 新規対応手法/フォーマット: なし
- 既存手法の改善: なし(ビルド依存の追加のみ)
- 対応モデル拡張: なし

## 影響範囲
- ユーザ視点の変化: 実質なし
- API/CLI 変更の有無: なし

## 注目度コメント
fast-hadamard-transform 依存追加の意図(量子化対応学習?)は今後のリリースで判明する見込み。watching で追跡。
