---
id: "2026-W30-007"
type: paper
title: "Saturation Makes Quantization Error Additive: A Coverage Model with a Certificate"
url: "https://arxiv.org/abs/2607.12266"
discovered: "2026-07-20"
published: "2026-07-14"
authors: []
venue: "arXiv (cs.LG)"
models: []
architectures: []
methods: []
tech: [mixed-precision, activation-quant, ptq]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
mixed-precision 量子化の前提である「層集合 S の量子化損失は層単位/ペア単位の感度から再構成できる」(HAWQ, CoopQ 等)を W4A4 の実配備精度で検証した理論+実証研究。量子化損失 f(S) をブール立方体上の集合関数として基底変換で分析し、配備分布上の構成では f の分散の 85-93% が低次項で説明されることを示す。飽和(saturation)が誤差の加法性をもたらすという被覆モデルと証明書(certificate)を与える。

## 手法
f(S) の Fourier/Möbius 基底分析 + 飽和ベースの被覆モデル。感度ベース手法の妥当性条件を明確化。

## 評価
- 対象モデル: W4A4 配備構成の LLM
- ビット幅: 4bit weight+activation 中心
- 精度劣化: 感度加法性の成立範囲を定量化
- スループット/メモリ: N/A(理論)

## 既存手法との差分
HAWQ 系の per-layer 感度前提に理論的根拠(と成立しない場合の証明書)を与える点。ビット割当アルゴリズムの信頼性評価に直結。

## 注目度コメント
mixed-precision 割当(TASA 等 W28 系統)の理論的裏付けとして価値あり。normal。
