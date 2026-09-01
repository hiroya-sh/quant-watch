---
id: "2026-W36-016"
type: paper
title: "DASC: Decay-Aware State Compression for Hybrid Linear-Attention Serving"
url: "https://arxiv.org/abs/2608.30386"
discovered: "2026-09-01"
published: "2026-08-31"
venue: "arXiv (cs.LG, cs.AI)"
models: [moonshotai/Kimi-K2.7]
architectures: [linear-attention, gla, hybrid]
methods: []
tech: [kv-cache-compression-non-quant, latent-compaction, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
ハイブリッド線形注意アーキテクチャは大規模オープンウェイトモデルにスケールし、full attention に匹敵する品質で KV cache 増大を大幅に抑える。しかし **in-place の再帰状態更新はキャッシュ管理を複雑にする** — prefix 再利用には full-attention の KV と並んで状態チェックポイントが必要で、状態チェックポイントを丸ごと保存するとメモリ圧が上がり、eviction 増加と prefill 再実行を招く。

## 手法
Gated DeltaNet (GDN) と Kimi Delta Attention (KDA) の **decay 構造**を解析すると、ヘッドやチャネルによって prefix 情報を保持する時間尺度が大きく異なる(**retention horizon**)ことが分かる。この差異は永続的な状態チェックポイントに大きな圧縮余地があることを示唆。これに基づき **Decay-Aware State Compression (DASC)** を提案。

## 評価
- 対象: GDN / KDA を持つハイブリッドモデルのサービング

## 既存手法との差分
状態を一律に扱わず、decay 由来の retention horizon で圧縮率を変える。

## 注目度コメント
同週の [[items/2026-W36-005-paper-damp-recurrent-state-quant|DAMP]] と**同じ観察(decay 構造の不均一性)から量子化と非量子化圧縮の両方に分岐**している。進行中プロジェクト周辺として両方追う価値あり。
