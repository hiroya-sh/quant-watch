---
id: "2026-W29-017"
type: paper
title: "Sangam: Efficiently Serving Diffusion LLMs with the AR Stack"
url: "https://arxiv.org/abs/2607.04206"
discovered: "2026-07-13"
published: "2026-07-05"
authors: [Nitin Kedia, Saurabh Agarwal, Myungjin Lee, Aditya Akella]
venue: "arxiv (cs.DC, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [diffusion-llm-quant, paged-attention, kv-cache-compression-non-quant]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
拡散 LLM (dLLM) を自己回帰系 serving スタックで効率的に提供する Sangam。dLLM の双方向 attention は厳密な AR 型 KV cache を許さないが、近似キャッシュ(Fast-dLLM / dKV-Cache)の繰返し prefill/decode 構造に AR serving 機構を適応させる。

## 注目度コメント
量子化ではなく dLLM serving(KV cache 運用)の話。diffusion-llm 系の推論インフラ動向として watching。
