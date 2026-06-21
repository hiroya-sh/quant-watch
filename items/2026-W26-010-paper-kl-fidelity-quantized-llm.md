---
id: "2026-W26-010"
type: paper
title: "Displacement Is Not Direction: Evaluating Fidelity Metrics for Quantized LLM Deployment"
url: "https://arxiv.org/abs/2606.19558"
discovered: "2026-06-22"
published: "2026-06-17"
authors: [Miloš Nikolić, Ali Hadi Zadeh, Enrique Torres Sanchez, Andreas Moshovos]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [ptq, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
量子化LLMの評価指標としてのKL divergenceの信頼性を検証した実証研究。KL divergenceはコホート全体では「ベンチマークスコアと強い相関」を示すが、ベースライン近傍のシナリオ（量子化による劣化が小さい場合）では「有意差のない相関に崩壊」することを発見。「変位（displacement、量子化前後の差）は方向（ベンチマーク性能の良し悪し）ではない」というタイトルが示す問題意識。量子化モデルの品質評価指標の改善の必要性を主張。

## 手法
- KL divergenceによる出力分布比較を量子化評価指標として検証
- コホート全体 vs ベースライン近傍シナリオでの相関分析
- 量子化誤差が小さい高品質モデルでの評価指標の有効性検証

## 評価
- コホート全体: KL divergenceとベンチマークスコアが強い相関
- ベースライン近傍: 相関が統計的に有意でなくなる
- 実用的な量子化評価での注意点を具体的に示す

## 既存手法との差分
KL divergenceを量子化評価の主要指標として使用する研究への反論。高品質な量子化（劣化が小さい）ほどKL divergenceが機能不全に陥るという逆説を実証。

## 注目度コメント
量子化研究の方法論に関する重要な批判的論文。我々が評価するScaleSweep・UFP4などの論文がどのような指標で性能を主張しているかを相対化する視点を提供。週次ウォッチとしては方法論的参照点として有用。
