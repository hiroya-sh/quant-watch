---
id: "2026-W46-025"
type: paper
title: "TileQuant: Tile as the Precision-Allocation Unit for LLM Mixed-Precision Post-Training Quantization"
url: "https://arxiv.org/abs/2611.07217"
discovered: "2026-11-09"
published: "2026-11-04"
authors: ["Hanzhi Zhang", "Qiao Zhang", "Qinglei Cao", "Heng Fan"]
venue: "arXiv:2611.07217"
models: []
architectures: ["transformer"]
methods: []
tech: ["mixed-precision", "ptq", "calibration", "outlier-handling"]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約

TileQuant は hardware-aligned 2D weight tile を precision 単位にする training-free PTQ。入力活性情報による forward 統計スコア (較正低コスト) と勾配情報による loss 感度スコア (品質重視) を提供。各 projection の retention budget 内で top tile を 16bit、他を 8bit に。再構築された compact weight buffer は integer と 16bit 両方のネイティブ計算を再利用、local accumulation でメモリ帯域削減。元モデル比 2.66x 生成スループット、言語モデル・推論・長文検索・QA で quantized/original の上を複数タスクで実現。

## 手法

2D tile を precision 単位化、2 種スコア (activation-aware / gradient-informed) で top tile を 16bit 保持、他は 8bit に。コンパクトな buffer 内でネイティブ 16bit/int 計算を実行。

## 評価

- モデル: (未明示)
- スループット: 2.66x original
- 精度: 既存 quantized/original を多タスクで上回る
- 実装: GitHub 公開

## 注目度コメント

mixed-precision PTQ の新単位。TriAttention と同じ著者グループで、tile という単位への統一方向性が見える。
