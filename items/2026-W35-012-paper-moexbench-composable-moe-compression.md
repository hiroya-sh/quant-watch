---
id: "2026-W35-012"
type: paper
title: "Benchmarking Composable Compression Techniques in Mixture-of-Experts LLMs (MoEXBench)"
url: "https://arxiv.org/abs/2608.21693"
discovered: "2026-09-01"
published: "2026-08-22"
venue: "arXiv (cs.LG)"
models: []
architectures: [moe, linear-attention, hybrid]
methods: []
tech: [moe-quant, kv-cache-quant, weight-only, long-context-quant]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
MoE LLM はスパース活性化で容量を効率的にスケールするが、巨大なエキスパートパラメータ、ルーティング不均衡、長文脈での KV cache 増大により、コモディティハードウェアへの展開が難しい。実運用では複数の圧縮手法を積む必要がある — expert pruning は冗長エキスパートを削り、weight quantization はメモリフットプリントを下げ、KV cache compression は長文脈のメモリ圧を下げる。しかしこれらは通常個別に評価され、**組み合わせたときの相互作用**が未解明だった。

## 手法
**MoEXBench** — composable MoE compression をエンドツーエンドのデプロイワークフローとして評価する体系的ベンチマーク。標準注意 / ハイブリッド線形注意 / sliding window を含む **30B〜235B 総パラメータの MoE モデル10種**を対象。

## 評価
- 3種の圧縮軸(expert pruning × weight quant × KV compression)の組み合わせ
- 対象規模: 30B〜235B

## 既存手法との差分
単独評価でなく「積んだときの結合効果」を主題にした。

## 注目度コメント
focus tech の **moe-quant** に直撃。llm-compressor 0.13.0 の REAP expert pruning + 量子化という現実の組み合わせを評価する枠組みとして、そのまま社内評価の設計図に使える。**議題候補**。
