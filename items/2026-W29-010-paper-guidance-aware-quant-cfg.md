---
id: "2026-W29-010"
type: paper
title: "Closing the Null Space: Guidance-Aware Quantization for Classifier-Free Diffusion"
url: "https://arxiv.org/abs/2607.08241"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Abdullah Al Shafi, Sumaiya Rahim Suma]
venue: "arxiv (cs.CV, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, calibration, diffusion-llm-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
Classifier-Free Guidance (CFG) 拡散モデルの PTQ が conditional/unconditional のペア構造を無視している点を指摘。システム面では 2-pass CFG 実行の latency オーバーヘッドが BOPs 指標に現れず、コモディティ INT8 スタックで理論効率が出ないこと、アルゴリズム面では guidance gap だけに校正することの問題を扱う guidance-aware 量子化。

## 注目ポイント
- 「BOPs では見えない実効レイテンシ」という測定論は LLM 量子化評価にも通じる
- 拡散側の量子化だが評価設計の教訓として有用

## 注目度コメント
優先度 normal。W28 の TASA(perplexity 感度 ≠ 推論感度)と同系の「指標と実効のズレ」問題意識。
