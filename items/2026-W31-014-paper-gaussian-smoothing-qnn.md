---
id: "2026-W31-014"
type: paper
title: "Local Stability and Gaussian Smoothing of Quantized Neural Networks"
url: "https://arxiv.org/abs/2607.20153"
discovered: "2026-07-27"
published: "2026-07-22"
authors: []
venue: "arXiv (cs.LG, eess.SY, math.OC)"
models: []
architectures: []
methods: []
tech: [qat]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
量子化モデルの滑らかな代理としての Gaussian 平均化を研究する理論論文。有界局所振動のもとで |f-g| の局所的・次元依存の上界を導出し、Gaussian smoothing を不連続ネットワークの安定性解析に接続。ReLU と sign 活性の Gaussian 平均の閉形式を計算し、高次元バイナリパーセプトロンで機構を例示する。

## 手法
量子化ノイズ代理のもとでの層前活性の集約が Gaussian エンベロープを生み、推論側の smoothing と学習側の滑らかな代理勾配(STE 代替)の両方に使える。

## 評価
- 対象モデル: バイナリパーセプトロン(玩具規模)
- ビット幅: 二値/量子化一般
- 精度劣化: —(理論)
- スループット/メモリ: —

## 既存手法との差分
STE のアドホックさに対し、Gaussian 平均化の近似誤差を明示的に定量化する枠組み。

## 注目度コメント
QAT の勾配代理の理論的基盤として関連はあるが、LLM 規模への含意はまだ薄い。watching。
