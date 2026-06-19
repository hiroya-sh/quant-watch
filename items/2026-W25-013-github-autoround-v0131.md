---
id: "2026-W25-013"
type: github
subtype: library
title: "intel/auto-round: v0.13.1"
url: "https://github.com/intel/auto-round/releases/tag/v0.13.1"
discovered: "2026-06-15"
published: "2026-06-12"
repo: "intel/auto-round"
release_tag: "v0.13.1"
models: [Qwen/Qwen3, Qwen/Qwen3.5]
architectures: [transformer, moe]
methods: [AutoRound, GGUF]
tech: [weight-only, low-bit-4, moe-quant, rotation, calibration, ptq]
priority: normal
sources: [github]
status: new
related: ["2026-W24-007"]
---

## 日本語要約
auto-round v0.13.1（v0.13.0の1週間後パッチリリース）。主要変更: GGUFフォーマットへのMTP（Multi-Token Prediction）量子化サポート追加、bf16+NHDレイアウト対応、sage_dynamic_quantのリファクタリング。バグ修正: ランダム回転とGGUF opt-rtnの回帰修正、GGUFブロックスケールのゼロ除算（NaNブロックスケール）修正。

## 変更詳細
- GGUF MTPサポート: Qwen3.5等のMTPヘッドをGGUF形式で量子化可能に
- bf16 + NHD layout: より広いフォーマット互換性
- sage_dynamic_quantリファクタリング: コード品質改善
- 回転バグ修正: ランダム直交変換の回帰を修正（v0.13.0で導入されたバグ）
- GGUF NaNブロックスケール修正: ゼロ除算でNaNが生じていた問題を解消

## 注目度コメント
v0.13.0（W24）の重要な後続パッチ。GGUF MTPサポートはllama.cpのMTP対応（W24で追加）と連携。NaNブロックスケールのバグは精度に直結する重要修正。AutoRoundはmoe-quantが対象でfocus techに該当。
