---
id: "2026-W24-001"
type: paper
title: "Beyond Output Matching: Preserving Internal Geometry in NVFP4 LLM Distillation"
url: "https://arxiv.org/abs/2606.05682"
discovered: "2026-06-08"
published: "2026-06-04"
authors: [Fangbo Tu, Junhua Zhao, Chi Liu, Xin Chen, Haifeng Wu, Jian Wan, Srinivasan Manoharan]
venue: "arxiv"
models: [nvidia/Nemotron, Qwen/Qwen3]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, activation-quant, weight-only, qat]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
NVFP4量子化後の精度回復に関する研究。KL-divergenceによる出力マッチング（QAD）では内部表現の劣化を隠蔽できることを実験的に示し、CKA（Centered Kernel Alignment）で層ごとのGram行列アライメントを正則化するCKA-QADを提案。Nemotron 3 NanoとQwen3-4Bで検証し、軽量な正則化項の追加で量子化後モデルの内部表現を保全する。

## 手法
- 既存QAD: 教師モデルのlogitsにKL-divergence損失でマッチング → 出力は揃うが中間層表現が乖離
- CKA-QAD: 各层のGram行列をCKA指標で比較し正則化項として追加。計算コスト最小で適用可能
- 対象: NVFP4量子化済みStudent + BF16 Teacher の蒸留フレームワーク

## 評価
- 対象モデル: Nemotron 3 Nano、Qwen3-4B-Thinking-2507
- ビット幅: NVFP4 (FP4)
- 結果: CKA-QADがQADベースラインを上回る内部幾何保全、精度改善

## 既存手法との差分
出力マッチングのみの従来QADを超え、表現空間の幾何構造を保全する。NVFP4 QATのsupervision品質向上アプローチとして新規。

## 注目度コメント
NVFPがfocusメソッドかつNemotron（NVIDIA）が著者機関。NVFP4 QATの内部品質評価視点として火曜定例の議題に価値あり。CKA-QAD手法はfocus外のQATにも転用可能。
