---
id: "2026-W30-012"
type: paper
title: "Decomposing Runtime, Kernel, and Quantization Speedups via a Matched FP16 Intermediate: A Hardware-Conditioned Case Study on Four NVIDIA RTX A5000 GPUs"
url: "https://arxiv.org/abs/2607.11368"
discovered: "2026-07-20"
published: "2026-07-13"
authors: []
venue: "arXiv (cs.DC, cs.LG, cs.PF)"
models: []
architectures: []
methods: []
tech: [_uncategorized]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
量子化カーネルの「配信スピードアップ」報告が、重みフォーマット・カーネル・推論ランタイムを一つの数字に束ねている問題への帰属分析。A5000×4 の環境で「速いランタイム+非量子化カーネル」という一致中間スタックを挟むことで、全体 2.58× のスピードアップのうち約2/3(対数スケール)がランタイム由来で、カーネル+量子化の寄与は3モデルファミリ間で高々 1.5% しか動かないことを示した。

## 手法
matched FP16 intermediate による speedup の因子分解(runtime / kernel+quant)。

## 評価
- 対象モデル: 3モデルファミリ(本文参照)
- ビット幅: 量子化カーネル vs FP16
- 精度劣化: N/A(速度帰属分析)
- スループット/メモリ: E2E 2.58× の内訳を分解

## 既存手法との差分
「量子化で速くなった」という主張の大半がランタイム差である可能性を単一ケースで定量化。

## 注目度コメント
量子化モデルの速度評価をする際の交絡要因への警告として有用だが、単一ハードウェア構成のケーススタディなので watching。vLLM 評価ポリシーには「ランタイム条件を揃える」教訓として反映価値あり。
