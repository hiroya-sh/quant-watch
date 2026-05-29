---
id: "2026-W22-008"
type: paper
title: "GEMQ: Global Expert-Level Mixed-Precision Quantization for MoE LLMs"
url: "https://arxiv.org/abs/2605.23078"
discovered: "2026-05-21"
published: "2026-05-21"
authors: [Jianing Deng, Song Wang, Dongwei Wang]
venue: "arxiv"
models: []
architectures: [moe]
methods: []
tech: [moe-quant, mixed-precision, ptq, calibration]
priority: high
sources: [arxiv]
status: new
related: ["2026-W22-026"]
---

## 日本語要約

MoE LLMのメモリ効率化のため、グローバル線形計画法（LP）でエキスパートごとにビット幅を最適割当する手法GEMQ。エキスパート単位の量子化誤差分析からモデル全体の重要度を把握し、LPで最適なbit割り当てを解く。さらに量子化後のエキスパートにルーティングを適応させるRouter Fine-tuningも導入。ICML 2026採録。

## 手法

- エキスパートごとの量子化誤差を測定し、モデル全体への影響を推定
- グローバルLP: ストレージ制約下でエキスパート重要度に基づきbit幅を最適割当
- Router Fine-tuning: 量子化済みエキスパートに合わせてルーター確率を再調整
- モデル全体の品質劣化を最小化するホリスティックなアプローチ

## 評価

- 対象モデル: Mixtral, OLMoE, Qwen-MoE（各種MoEアーキテクチャ）
- ビット幅: 混合精度（エキスパートごとに2〜8ビット）
- 精度劣化: SoTA水準（論文中詳細）
- スループット/メモリ: MoEモデルのメモリ削減に寄与

## 既存手法との差分

既存のMoE量子化はエキスパートを均一ビット幅で処理するのに対し、GEMQはLPで各エキスパートを異なるビット幅で処理する初のグローバル最適化アプローチ。Router Fine-tuningの組み合わせも新規。

## 注目度コメント

`moe-quant`（focus tech）。ICML 2026採録で理論的基盤もしっかりしており信頼性高い。MoEモデルが主流になる中での実用的手法。
