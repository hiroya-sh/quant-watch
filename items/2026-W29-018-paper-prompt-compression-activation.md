---
id: "2026-W29-018"
type: paper
title: "Prompt Compression via Activation Aggregation"
url: "https://arxiv.org/abs/2607.08399"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Thibaud Ardoin, Semira Einsele, Evis Bregu, Gerhard Wunder]
venue: "arxiv (cs.CL, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [latent-compaction]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
指示プロンプトのタスク関連情報を**単一の activation ベクトル**に圧縮し、中間層で抽出した加重和を早い層に再注入することでトークン列を置換できるかを検証。フルプロンプト処理比で精度低下 2% 未満を主張。

## 注目度コメント
latent-compaction 系。固定プロンプトの計算削減という実務的示唆はあるが量子化外。watching。
