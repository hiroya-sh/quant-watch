---
id: "2026-W29-011"
type: paper
title: "What to Keep, What to Forget: A Rate--Distortion View of Memory Compaction in LLMs and Agents"
url: "https://arxiv.org/abs/2607.08032"
discovered: "2026-07-13"
published: "2026-07-09"
authors: [Ashwin Gerard Colaco, Nada Lahjouji]
venue: "arxiv (cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, kv-cache-eviction, latent-compaction, reasoning-aware-compression]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
KV cache の量子化/eviction、プロンプト圧縮、アーキテクチャ状態の制限、エージェントメモリ統合——別々に発展してきた4つの「記憶の圧縮」を、**単一の rate-distortion 問題**(資源予算下で何をどの忠実度で保持するか)として統一的に見る position/framework 論文。

## 注目ポイント
- kv-cache-quant を含む圧縮系研究の見取り図として有用
- 具体的な新手法ではなく統一フレーミング

## 注目度コメント
火曜定例で「KV 圧縮の分類学」を話すときの参照材料。優先度 normal。
