---
id: "2026-W22-016"
type: paper
title: "Block-Sphere Vector Quantization"
url: "https://arxiv.org/abs/2605.19972"
discovered: "2026-05-19"
published: "2026-05-19"
authors: [Heesang Ann, Joongkyu Lee, Min-hwan Oh]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [rotation, kv-cache-quant, low-bit-4]
priority: normal
sources: [arxiv]
status: new
related: ["2026-W22-005"]
---

## 日本語要約

回転ベース量子化器（EDEN, RabitQ, TurboQuant）の統一理論比較を実施し、新規ブロック量子化アルゴリズムBlockQuantを提案。ブロック単位で球面上に射影し回転後のベクトル幾何を保持。MSE再構成誤差と内積歪み両方で既存手法を改善。長コンテキストLLM推論タスクでの改善を実証。TurboQuantの競合・後継候補。

## 手法

- 統一理論: EDEN/RabitQ/TurboQuantの回転ベース量子化を同一フレームワークで比較
- BlockQuant: ブロック単位で回転し、球面上への射影で幾何構造を保持
- MSE損失と内積歪み損失の両方を最小化

## 評価

- 対象モデル: 各種LLM（長コンテキスト推論）
- ビット幅: 各種（比較実験）
- 精度劣化: TurboQuant比で改善
- スループット/メモリ: 未記載

## 既存手法との差分

TurboQuant（focusメソッド）を理論・実験の両面で解析・上回る。OCTOPUS (2026-W22-005) と同様にTurboQuant/PolarQuantを超えようとする競合研究。
