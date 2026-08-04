---
id: "2026-W29-023"
type: hf-paper
title: "DSpark: Confidence-Scheduled Speculative Decoding with Semi-Autoregressive Generation"
url: "https://arxiv.org/abs/2607.05147"
discovered: "2026-07-13"
published: "2026-07-06"
authors: [Xin Cheng, Xingkai Yu, Chenze Shao, Jiashi Li, Yunfan Xiong, et al.]
venue: "arxiv / HF Papers 2026-07-08 (30 upvotes)"
models: []
architectures: [transformer]
methods: []
tech: [speculative-decoding]
priority: watching
sources: [hf-papers, arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認、HF daily_papers 掲載確認"
related: []
---

## 日本語要約
並列ドラフタの「トークン間依存の欠如による受理率急落」と「拒否リスクの高いブロックの無差別検証によるバッチ容量浪費」に対し、confidence スケジューリングと半自己回帰生成を組み合わせた speculative decoding フレームワーク DSpark。高並行 serving でのスループット改善を狙う。

## 注目度コメント
量子化外の推論高速化(focus 外)。コミュニティ注目度が高い(30 up)ため関連技術として watching。W29 では gemma-4 の DSpark 対応量子化モデル(Danny-Dasilva の W4A16-GPTQ-DSpark)も観測されており、実装が広がる兆し。
