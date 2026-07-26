---
id: "2026-W31-011"
type: paper
title: "Contraction-Gauge Preconditioning for Quantized Matrix Multiplication"
url: "https://arxiv.org/abs/2607.18745"
discovered: "2026-07-27"
published: "2026-07-21"
authors: []
venue: "arXiv (cs.LG, cs.IT, math.NA)"
models: []
architectures: []
methods: []
tech: [ptq, activation-quant]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
両オペランドを量子化した C=AB の期待二乗積誤差について、既知分散場のもとで厳密な有限次元恒等式を導出(subtractive dither / stochastic rounding で厳密、RTN は実証評価)。積保存等価 AB=(AT)(T^{-1}B) を使い、量子化前に因子表現と共有パターンを同時選択する「contraction-gauge preconditioning」を定式化。正定対角ゲージ族内では幾何計画法で大域最適な共有 fold を計算できる。

## 手法
scaling には tail index、partitioning には profile spread、rotation には coherence / weighted-Gram energy 等、変換候補をランキングする計算可能な選択統計量と上界を導出。

## 評価
- 対象モデル: 学習済み3ブロック画像分類器の12線形積(LLM 規模ではない)
- ビット幅: 8bit / 4bit
- 精度劣化: GP fold で積誤差を 18.0% (8bit) / 20.5% (4bit) 削減、SmoothQuant 風グリッドベースラインに勝利
- 補足: dither モデル予測と RTN 実誤差の順位相関 0.937 (8bit) / 0.918 (4bit)

## 既存手法との差分
SmoothQuant/rotation 系の変換選択をアドホックな探索でなく、厳密な誤差会計と証明付き選択に載せた理論研究。

## 注目度コメント
LLM 規模の実験がまだないため watching。rotation/scaling 選択の理論的裏付けとして、実装が出たら再評価。
