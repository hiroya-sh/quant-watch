---
id: "2026-W36-002"
type: paper
title: "SemKV: Semantic Mixed-Precision KV Cache Quantization Guided by the Quality Cliff for Long-Context LLM Inference"
url: "https://arxiv.org/abs/2608.28911"
discovered: "2026-09-01"
published: "2026-08-28"
venue: "arXiv (cs.LG, cs.CL, cs.IT)"
models: [meta-llama/Llama-3.1, mistralai/Mistral]
architectures: [transformer]
methods: [SemKV]
tech: [kv-cache-quant, mixed-precision, low-bit-2, long-context-quant]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
KV cache は長文脈推論の支配的メモリボトルネックで、文脈長に線形に増える。本論文は **分数ビットのグリッド上での一様 KV 量子化が「緩やかに劣化しない」**ことを示す。事前登録した multi-seed の統計プロトコルの下で、Llama-3.1-8B-Instruct + アフィン量子化器は **2.322 code bits/value まで FP16 KV と統計的に区別できず、2.0 bits で崩壊する** — すなわち **(2.0, 2.322] に quality cliff がある**。この cliff は生成時量子化・マルチターン対話でも再現し、Mistral-7B にも転移する。

## 手法
cliff は importance-aware mixed precision の意味を組み替える — **cliff より上では、8つのモデル内部 importance 指標は統計的に交換可能**であり、混合の利点は「一様量子化では実現できない平均精度に到達するためのグリッド補間」にある。SemKV はこの知見に基づき混合精度を割り当てる。

## 評価
- Llama-3.1-8B-Instruct(主)、Mistral-7B(転移確認)
- 分数ビット刻み、multi-seed 統計プロトコル
- cliff: 2.322 bits(区別不能) → 2.0 bits(崩壊)

## 既存手法との差分
「どの重要度指標が良いか」という従来の議論を、「cliff の上か下か」という体制の問題に置き換えた。

## 注目度コメント
focus tech **kv-cache-quant に直撃**。「2bit KV は無理、2.3bit なら無害」という具体的な境界値は、KV 量子化予算を決めるときの実務的な指針になる。**強推し議題候補**。
