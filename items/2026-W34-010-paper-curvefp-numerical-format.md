---
id: "2026-W34-010"
type: paper
title: "CurveFP: Co-Designing Numerical Representation and Product Arithmetic for Language Models"
url: "https://arxiv.org/abs/2608.10010"
discovered: "2026-08-17"
published: "2026-08-08"
authors: [Ye Qiao]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [low-bit-fp8, mixed-precision]
priority: normal
sources: [arxiv]
status: updated
related: []
---
## 日本語要約
低精度フォーマットはスカラ忠実度を最適化しつつ従来の積演算を継承しがち。CurveFP は magnitude を対数曲線群にまたがって配置する block-scaled ファミリで、一様な曲線インデックスにより各非ゼロ積が符号+整数インデックス更新になり、有理 radix が accumulation の有限位相スケジュールを露出する。学習向け CurveFP8 (E4C3/E5C2)、コンパクト推論向け CurveFP7 (E3C3) を提示。7B〜9B の4モデルで CurveFP7 が tensorwise FP8 の PPL を1bit 少なく上回り、native 品質の1.32%以内。

## 手法
数値表現と積演算を共設計。CurveFP8 は36ペア学習 GEMM 比較で全勝、Nangate45 タイルで FP8 比 4.6% 面積減。

## 評価
- 対象モデル: 7B〜9B ×4、3B-token 事前学習 triplet
- ビット幅: CurveFP7(7bit)/CurveFP8
- 結果: FP8 と同等以上 PPL、面積/レジスタ減

## 既存手法との差分
スカラ精度だけでなく積演算まで共設計する新フォーマット。FP8 を1bit 少なく置換し得る。

## 注目度コメント
新フォーマット CurveFP。ハード共設計寄りだが FP8 代替候補として監視価値(v2 更新)。
