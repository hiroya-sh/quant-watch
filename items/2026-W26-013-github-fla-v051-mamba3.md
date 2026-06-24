---
id: "2026-W26-013"
type: github
subtype: library
title: "fla-org/flash-linear-attention: v0.5.1"
url: "https://github.com/fla-org/flash-linear-attention/releases/tag/v0.5.1"
discovered: "2026-06-22"
published: "2026-06-18"
repo: "fla-org/flash-linear-attention"
release_tag: "v0.5.1"
models: []
architectures: [gla, mamba2, linear-attention, hybrid, rwkv]
methods: []
tech: []
priority: watching
sources: [github]
status: new
related: []
---

## 日本語要約
flash-linear-attention v0.5.1。量子化への直接対応はないが、GLA/RWKV/Mamba系のlinear attentionアーキテクチャのカーネル・モデル実装ライブラリとして監視対象。今リリースの主要変更: Mamba3サポート追加（新しい状態空間モデルバリアント）、YOCO（You Only Cache Once）モデル実装、Ravenモデル統合（変則的なハイブリッドアーキテクチャ）、AttnRes演算子（出力RMSNormとの融合カーネル）、Blackwell GPU対応の大オフセットポインタ修正。

## 主な変更
- **Mamba3追加**: 新たな状態空間モデルバリアントをFLAライブラリに統合
- **YOCO実装**: `You Only Cache Once`スタイルのKVキャッシュ共有モデル（架空名だが実装存在）
- **Ravenモデル統合**: 不規則なハイブリッドアーキテクチャのRoPEオフセット修正含む
- **AttnRes演算子**: 注意残差+出力RMSNorm融合カーネルのAPI整理
- **Blackwell GPUサポート**: Large-offset Pointer Arithmeticの修正（SM12.x対応）

## 注目度コメント
量子化の直接対応なしのため watching。FLAアーキテクチャへの量子化研究（GLA-quant等）を追跡するための環境整備として継続監視。Mamba3の追加はstate-space-model系の量子化研究が今後登場した際の実装基盤。
