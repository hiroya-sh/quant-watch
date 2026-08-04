---
id: "2026-W30-011"
type: paper
title: "PReM: Learning What to Preserve and When to Refresh for Context Compression"
url: "https://arxiv.org/abs/2607.14327"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.CL, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, long-context-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
長文脈を層ごとの内部 KV メモリとして保持し、「何を保存し、いつリフレッシュするか」を学習する文脈圧縮フレームワーク PReM(Preserve and Refresh Memory)。既存の KV cache 圧縮・文脈圧縮は保持対象を早期に決めるか外部コンプレッサに依存し、後段の推論ステップが必要とする証拠に適応できない、という問題設定。

## 手法
保持ポリシーとリフレッシュタイミングを学習可能にした layer-wise KV メモリ管理。生成の進行に応じて圧縮文脈を動的に組み替える。

## 評価
- 対象モデル: 長文脈 LLM
- ビット幅: N/A(非量子化圧縮)
- 精度劣化: 後段推論の証拠アクセス性を維持
- スループット/メモリ: 長文脈メモリコスト削減

## 既存手法との差分
静的 eviction・外部圧縮と違い「後で必要になる証拠」への適応をポリシー学習で扱う点。

## 注目度コメント
reasoning ワークロードでの KV 圧縮という focus 周辺(kv-cache-quant の非量子化隣接)。normal。
