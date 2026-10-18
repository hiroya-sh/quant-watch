---
id: "2026-W43-028"
type: paper
title: "Lightweight but Linguistically Fair? Quantisation Robustness across Bavarian, German, and English"
url: "https://arxiv.org/abs/2610.18343"
discovered: "2026-10-19"
published: "2026-10-13"
authors: ["Jophin John", "Michael Hoffmann", "Piroska Lendvai", "Florent Dufour"]
venue: "arXiv:2610.18343v1"
models: []
architectures: []
methods: [GPTQ, AWQ]
tech: [ptq, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
バイエルン語 / 標準ドイツ語 / 英語が整合した BAVGROUND ベンチマークで、BF16 vs 8-bit GPTQ vs 4-bit GPTQ/AWQ の言語間劣化を測定。8-bit GPTQ は BF16 とほぼ同等だが、4-bit は約 1.4-1.5pt 低下し決定の 11.9-16.0% を書き換える。

## 手法 / 評価のポイント
- ベンチマーク: BAVGROUND(バイエルン語 / 標準ドイツ語 / 英語)
- 対象: 14 本の 7B-10B 命令モデル
- 結果: 8-bit GPTQ ≈ BF16、4-bit GPTQ/AWQ は -1.4〜-1.5pt、決定の 11.9-16.0% が変化

## 注目度コメント
Linguistic fairness audit: 8-bit GPTQ vs 4-bit GPTQ/AWQ on Bavarian/German/English
