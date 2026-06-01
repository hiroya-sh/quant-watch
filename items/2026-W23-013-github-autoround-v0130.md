---
id: "2026-W23-013"
type: github
subtype: library
title: "intel/auto-round: v0.13.0"
url: "https://github.com/intel/auto-round/releases/tag/v0.13.0"
discovered: "2026-06-01"
published: "2026-05-31"
repo: "intel/auto-round"
release_tag: "v0.13.0"
models: [google/gemma-4, Qwen/Qwen3.6]
architectures: [transformer, moe]
methods: [AutoRound]
tech: [weight-only, low-bit-4, moe-quant, calibration]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
Intel AutoRoundのマイナーバージョンアップ。MTPQuantization（Multi-Token Prediction対応量子化）、CPU/XPUバックエンド統合、モデルフリーWOQ（重みのみ量子化）が主要新機能。対応モデルがGemma4・Qwen3.6-35B-A3B・WAN2.2・BAGEL-7B-MoT等に拡大。compressed-tensors形式のW4A16/W8A16エクスポートも追加。

## 量子化関連の変更点
- 新規対応手法/フォーマット: MTP量子化サポート、model_free WOQ、compressed-tensors W4A16/W8A16エクスポート
- 既存手法の改善: CPU/XPUバックエンドの統一 (Intel XPU環境での利用改善)
- 対応モデル拡張: Gemma4, Qwen3.6-35B-A3B, MiMo-V2-Flash, BAGEL-7B-MoT, WAN2.2, Qwen-TTS

## 影響範囲
- ユーザ視点の変化: Intel GPU/CPUユーザがAutoRoundを本番利用しやすくなる。MTPモデルへの量子化が可能に。
- API/CLI 変更の有無: 新アーキテクチャへの移行（後方互換性要確認）

## 注目度コメント
MTP量子化はQwen3.6等の新アーキテクチャへの対応として重要。IntelのAI推進ツールとして industry adoption を観察中。
