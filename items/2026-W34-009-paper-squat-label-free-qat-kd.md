---
id: "2026-W34-009"
type: paper
title: "SQuaT: Self-Supervised Knowledge Distillation via Student-Aware Quantized Teacher Features"
url: "https://arxiv.org/abs/2608.10709"
discovered: "2026-08-17"
published: "2026-08-11"
authors: [HyeonJun Lee, Hyeonsik Jo, Jinwoo Chung, Jangho Kim]
venue: "arXiv"
models: []
architectures: []
methods: []
tech: [qat, low-bit-2, low-bit-1bit]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
ラベルが使えない状況(プライバシ/著作権/コスト)での QAT を扱う。従来の QAT+KD は teacher と量子化 student のレンジ不一致が「到達不能な残差」を生み、蒸留損失に下限を作る問題があった。SQuaT は **teacher 特徴量を student の量子化パラメータで量子化**することでこの下限を理論的に消去する label-free QAT+KD。極低ビット(1・2bit)で特に大きな改善を報告。

## 手法
student-aware に teacher 特徴を量子化し、レンジ不一致由来の irreducible loss を除去。

## 評価
- 対象: 各種設定(label-free)
- ビット幅: 1bit / 2bit で顕著な改善
- 比較: 強力な QAT+KD ベースラインを上回る

## 既存手法との差分
teacher 特徴を student の量子化系で揃える着想で、KD の下限問題を解消。極低ビットで効く。

## 注目度コメント
極低ビット QAT の実用性向上。手法名 SQuaT は taxonomy 未登録。
