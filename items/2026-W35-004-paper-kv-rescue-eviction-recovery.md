---
id: "2026-W35-004"
type: paper
title: "KV-Rescue: Recovering Reasoning Language Model KV Eviction Loss via Stepwise Interleaving"
url: "https://arxiv.org/abs/2608.15797"
discovered: "2026-09-01"
published: "2026-08-16"
venue: "arXiv (cs.AI, cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, reasoning-aware-compression, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
KV cache eviction は長い推論トレースのメモリ上限を抑えるが、モデルが履歴の部分ビューからデコードするため本質的に lossy。強い予算下では精度低下だけでなく、長さ上限まで支離滅裂/反復トークンを吐き続ける runaway degeneration を引き起こす。著者はこの損失の多くを「モデル容量不足 (capability gap)」ではなく「文脈欠落による information gap」と特徴づける。

## 手法
evict された 7B モデルと full-context 1.5B モデルは相補的な誤りを犯し、両者の答えを oracle 選択すると full-KV 7B との精度差の **79%** を回復できる、という観察が出発点。KV-Rescue は軽量な full-context ヘルパーを使い、2モデルの推論ステップを交互に挟み込む学習不要の推論フレームワーク。

## 評価
- oracle 上限: 精度ギャップの 79% 回復
- 学習不要 (training-free)

## 既存手法との差分
eviction 損失を「別モデルで埋める」発想。圧縮側ではなく補償側のアプローチ。

## 注目度コメント
KV 量子化ではないが kv-cache-quant の focus に隣接。W36 の [[items/2026-W36-006-paper-faithfulness-not-free-kv-rag|Faithfulness Is Not Free]] と同様「圧縮の副作用を測る」系の流れ。
