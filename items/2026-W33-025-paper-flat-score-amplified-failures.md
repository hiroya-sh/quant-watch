---
id: "2026-W33-025"
type: paper
title: "Flat Score, Amplified Failures: How the Error Budget Masks Damage in Quantized LLM Agents"
url: "https://arxiv.org/abs/2607.27275"
discovered: "2026-08-10"
published: "2026-07-29"
authors: [Jiwon Jang, Kisu Yang, Heuiseok Lim]
venue: "arXiv"
models: []
architectures: [transformer, moe]
methods: []
tech: [weight-only, low-bit-4, low-bit-8, moe-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
4bit重み量子化はほぼロスレスと報告されがちだが、マルチターンtool-callingエージェントで検証。τ²-bench上でdense/MoE2系統×2ドメイン(8セル×456エピソード)を16/8/4bitで評価すると、標準スコアでは量子化は無料に見える。

## 手法
標準指標では有意差なし(多重比較補正後)だが、プロセスを見ると量子化はフル精度で既に出ていた失敗(過剰行動等)を増幅する。スコアが誤差予算で損傷を覆い隠すことを示す。

## 評価
- 対象モデル: dense/MoE 2系統 (τ²-bench)
- ビット幅: W16/W8/W4
- 精度劣化: スコアは不変だがプロセス失敗が増幅
- スループット/メモリ: エージェント量子化の隠れコスト

## 既存手法との差分
最終スコア中心の量子化評価に対し、tool-callingプロセスの失敗増幅を暴く。moe-quantも対象。

## 注目度コメント
「4bitはロスレス」神話をエージェント文脈で反証。moe-quant(focus)も評価対象で実務示唆大。
