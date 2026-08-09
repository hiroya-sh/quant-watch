---
id: "2026-W33-003"
type: paper
title: "Stable FP4 Training via Transposition-Invariant Block Quantization"
url: "https://arxiv.org/abs/2607.24953"
discovered: "2026-08-10"
published: "2026-07-27"
authors: [Mehdi Rahimifar, Amin Darabi, Mehran Taghian Jazi]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [MXFP4]
tech: [low-bit-fp4, microscaling-formats, qat, block-wise]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
FP8を超えFP4でLLM学習する際の不安定性の根本原因を、テンソル転置に起因するスケール不整合と特定。従来の1Dブロック量子化では順・逆伝播で同じ値に異なるスケールが割り当てられ、勾配更新が偏りと不安定を生む。

## 手法
2DブロックFP4量子化で転置不変(transposition-invariant)なスケールを強制する低精度学習フレームワーク。順・逆で一貫したスケールにより勾配のバイアスを除去。

## 評価
- 対象モデル: LLM学習
- ビット幅: FP4 (2D block)
- 精度劣化: 転置不変化で学習安定性を回復
- スループット/メモリ: FP4学習の効率向上

## 既存手法との差分
1Dブロック量子化の転置非対称という見落とされていた不安定要因を明示し2Dブロックで解消。

## 注目度コメント
FP4学習の安定化はNVFP4/MXFP4学習の実用化に効く基盤的知見。
