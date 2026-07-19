---
id: "2026-W30-001"
type: paper
title: "ExTernD: Expanded-Rank Ternary Decomposition Ternary LLM PTQ with Accuracy Approaching Any Quantization Level"
url: "https://arxiv.org/abs/2607.13511"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: []
methods: []
tech: [weight-only, ptq, low-bit-1bit]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
LLM の各重み行列 A を三値因子 B∈{-1,0,+1}^{m×k}・C∈{-1,0,+1}^{k×n} と実数スケール D に分解する PTQ 手法。内部ランク k を full rank より意図的に拡大(μ>1)し、超過分の成分が先行成分の量子化誤差を補正する構造。残差が k に対して単調減少し任意の ε 以下にできることを証明しており、「固定プレーン数の三値化では不可能な bf16 精度への漸近」を主張する。

## 手法
Expanded-rank Ternary Decomposition。A ≈ B·diag(D)·C の三値×三値+スケールへの後付け分解で、ランク拡大率 μ をノブとして精度-メモリのトレードオフを連続的に選べる。

## 評価
- 対象モデル: LLM 全般(重み行列単位)
- ビット幅: 三値(実効 ~1.58bit 系)× 拡大ランク
- 精度劣化: 理論上任意精度に漸近(単調収束の証明つき)
- スループット/メモリ: ランク拡大とのトレードオフ

## 既存手法との差分
固定プレーン数の三値化(BitNet 系等)が持つ精度上限を、ランク拡大による誤差補正で原理的に突破する点。精度レベルを μ で選択可能な「三値化の連続ダイヤル」という位置づけ。

## 注目度コメント
「既存三値化の精度上限を超える」という明確な理論主張があり default high。三値 GEMM で実行できるなら推論エンジン実装のポテンシャルも大きい。火曜定例の議題候補。
