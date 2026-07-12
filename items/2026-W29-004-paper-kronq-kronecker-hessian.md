---
id: "2026-W29-004"
type: paper
title: "KronQ: LLM Quantization via Kronecker-Factored Hessian"
url: "https://arxiv.org/abs/2607.07964"
discovered: "2026-07-13"
published: "2026-07-08"
authors: [Donghyun Lee, Yuhang Li, Ruokai Yin, Priyadarshini Panda]
venue: "arxiv (cs.LG)"
models: []
architectures: [transformer]
methods: [GPTQ]
tech: [weight-only, ptq, calibration]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
GPTQ 系の二次 PTQ が「入力 activation 統計のみ = 全出力チャネル等価」と仮定している点を突き、**勾配共分散を量子化パイプラインに導入**する KronQ。Kronecker 分解 Hessian 近似の下では量子化損失が activation と gradient の両共分散に依存することを利用し、2つの補完的レベルで活用する。

## 注目ポイント
- GPTQ の目的関数そのものの改良(手法系譜として GPTQ 直系)
- Yale Panda グループ(OrbitQuant と同著者 Donghyun Lee)

## 注目度コメント
古典 PTQ の目的関数改良は着実な系統。GPTQ 後継候補として追跡。優先度 normal。
