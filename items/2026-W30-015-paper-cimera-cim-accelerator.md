---
id: "2026-W30-015"
type: paper
title: "CIMERA: Compute-in-Interconnect and Memory with Reconfigurable Precision for LLM Inference"
url: "https://arxiv.org/abs/2607.13649"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.AR)"
models: []
architectures: []
methods: []
tech: [mixed-precision]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
compute-in-interconnect と compute-in-memory を統合した reconfigurable-precision LLM 推論アクセラレータ。LLM ワークロードの精度耐性の不均一性を利用した適応精度実行で、H100 比 最大25×(エネルギー効率)/10× の改善を主張。メモリウォール緩和が主眼。

## 手法
インターコネクト内演算+メモリ内演算+精度再構成可能なデータパスの協調設計。

## 評価
- 対象モデル: データセンター〜エッジの LLM
- ビット幅: 適応(reconfigurable precision)
- 精度劣化: 精度耐性に応じた割当で抑制
- スループット/メモリ: H100 比 エネルギー効率 25×/10× を主張

## 既存手法との差分
量子化を前提とした専用ハードの一例。シミュレーションベースの ASIC 提案であり実運用からは遠い。

## 注目度コメント
watching(ハードウェア提案、推論エンジンへの波及なし)。
