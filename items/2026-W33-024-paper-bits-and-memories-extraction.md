---
id: "2026-W33-024"
type: paper
title: "Bits and Memories: Measuring Verbatim Extraction Across LLM Quantization"
url: "https://arxiv.org/abs/2607.25451"
discovered: "2026-08-10"
published: "2026-07-28"
authors: [Akshay Sasi]
venue: "arXiv"
models: [meta-llama/Llama-3.1]
architectures: [transformer]
methods: []
tech: [weight-only, low-bit-4, low-bit-8]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
量子化がプライバシーリスクを下げるかを、従来のmembership inferenceではなく学習データの逐語(verbatim)再生で直接測定。Pythiaモデルと各モデルが暗記済みの公開系列を使い、FP〜4bitの5精度・3サイズで逐語抽出とperplexityを追跡。

## 手法
各精度レベルで暗記系列の逐語抽出率と一般能力(perplexity)を同時計測し、量子化と暗記漏洩の関係を精度軸で可視化。

## 評価
- 対象モデル: Pythia (3サイズ)
- ビット幅: FP16〜4-bit (5精度)
- 精度劣化: (暗記抽出とperplexityの精度依存を測定)
- スループット/メモリ: -

## 既存手法との差分
membership inference中心の既存プライバシー評価を、逐語抽出という実リスクに置換。

## 注目度コメント
量子化とプライバシーの関係を実測。W31のQuantiBias等「量子化の副作用測定」系の継続。
