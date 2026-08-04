---
id: "2026-W31-009"
type: paper
title: "Error Certificates for KV-Cache Eviction via Randomized Design"
url: "https://arxiv.org/abs/2607.21475"
discovered: "2026-07-27"
published: "2026-07-23"
authors: []
venue: "arXiv (cs.LG, cs.AI, cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-eviction]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
決定論的 top-k KV eviction は「何を壊したか原理的に知り得ない」(捨てた値をどう変えても保持側は不変のまま真の attention 出力誤差を任意に大きくできる=誤差推定量が一致性を持たない)ことを証明。Poisson サンプリングの確率的 eviction に切り替えると識別可能性が回復し、softmax 内の logit オフセット1つ(Hájek 補正)+ 調査サンプリング分散推定量で per-step の誤差証明書が得られる(経験カバレッジ 0.97、精度コストなし)。

## 手法
既知包含確率のランダム化 eviction + 保持集合上の分散推定。事前登録した7主張のうち3つは棄却されるという誠実な報告(証明書は失敗「予測」には勝てず、cache 起因と本質的失敗の「帰属」に効く: AUC 0.73-0.75 vs 出力確信度 0.47-0.54)。

## 評価
- 対象モデル: 実ワークロード
- ビット幅: (量子化ではない)
- 精度劣化: ランダム化 eviction 自体は精度コストなし
- 補足: 再計算スケジューリングで random / confidence gating より優位

## 既存手法との差分
eviction 研究が「何を捨てるか」を競う中、「捨てた誤差を監査可能にする」というサービング運用の観点を理論付きで導入した点。

## 注目度コメント
不可能性定理 + 実測の反証込みで質が高い。KV eviction を本番サービングに入れる際の監視設計に直接効く話。
