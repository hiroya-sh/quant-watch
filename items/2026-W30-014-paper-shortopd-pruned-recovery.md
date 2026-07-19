---
id: "2026-W30-014"
type: paper
title: "ShortOPD: Recovering Pruned LLMs with Short-to-Long On-Policy Distillation"
url: "https://arxiv.org/abs/2607.13124"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.LG, cs.AI, cs.CL)"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv, hf-papers]
status: new
verified: "2026-07-20 arXiv API 直取得 + HF daily_papers 2026-07-16 掲載確認(▲17)"
related: []
---

## 日本語要約
構造化プルーニング後の LLM が多肢選択では健在なのに自由生成で崩壊する問題(greedy pass@1 がほぼ消失、pass@k は回復 → 有用な生成は「消えた」のではなく「降格」されている)への回復手法。失敗の主因が suffix repetition であることを特定し、圧縮モデル自身の on-policy 状態で dense なトークン単位教師信号を与える short-to-long On-Policy Distillation で回復する。

## 手法
短系列→長系列へカリキュラム化した OPD。圧縮チェックポイントの実分布上で教師を蒸留。

## 評価
- 対象モデル: 構造化プルーニング済み LLM
- ビット幅: N/A(プルーニング回復)
- 精度劣化: 自由生成 pass@1 の回復を実証
- スループット/メモリ: プルーニングの圧縮率を維持

## 既存手法との差分
「多肢選択で検証されたプルーニングが生成で壊れる」ギャップの診断と、on-policy 蒸留での対処。

## 注目度コメント
量子化そのものではないが、圧縮後回復(lossless-quantization-recovery の隣接)として記録。watching。
