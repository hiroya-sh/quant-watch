---
id: "2026-W29-019"
type: paper
title: "A Quantized Native Runtime for On-Device Semantic Audio Generation"
url: "https://arxiv.org/abs/2607.08526"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Matteo Spanio, Antonio Rodà]
venue: "arxiv (HF Papers 2026-07-10 掲載)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, _uncategorized]
priority: watching
sources: [arxiv, hf-papers]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
Stable Audio 3 の text-to-music パイプライン全体を Python/DL フレームワークなしで動かす依存フリーのネイティブランタイム aria。主貢献は量子化スタディで、通常 GPU・CPU-only・Raspberry Pi 5 でのメモリ制約下実行を検証。

## 注目度コメント
音声生成×エッジ量子化。LLM 量子化とは離れるが、ネイティブランタイム+量子化の設計例として watching。
