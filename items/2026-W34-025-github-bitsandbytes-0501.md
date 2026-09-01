---
id: "2026-W34-025"
type: github
subtype: library
title: "bitsandbytes 0.50.1"
url: "https://github.com/bitsandbytes-foundation/bitsandbytes/releases/tag/0.50.1"
discovered: "2026-08-17"
published: "2026-08-14"
repo: "bitsandbytes-foundation/bitsandbytes"
release_tag: "0.50.1"
models: []
architectures: []
methods: [bitsandbytes]
tech: [low-bit-4]
priority: watching
sources: [github]
status: new
related: []
---
## 日本語要約
小規模リリース。Triton の dequantize_fp4_tree の切り詰め FP4 定数を修正(#2026)し、4-bit GEMM dispatch heuristic に sm121 (GB10) tier を追加。

## 量子化関連の変更点
- 新規対応手法/フォーマット: —
- 既存手法の改善: FP4 dequant 定数の修正、GB10 (sm121) 向け 4-bit GEMM dispatch
- 対応モデル拡張: —

## 影響範囲
- ユーザ視点の変化: GB10 世代での 4-bit GEMM 経路が整備、FP4 dequant のバグ修正
- API/CLI 変更の有無: なし

## 注目度コメント
バグ修正+新 GPU tier の小リリース。watching。
