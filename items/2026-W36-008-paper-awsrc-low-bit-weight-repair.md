---
id: "2026-W36-008"
type: paper
title: "Activation-Weighted Seeded Residual Coding for Low-Bit LLM Weight Repair (AWSRC)"
url: "https://arxiv.org/abs/2608.23144"
discovered: "2026-09-01"
published: "2026-08-24"
venue: "arXiv (cs.LG, cs.CL)"
models: [Qwen/Qwen2.5]
architectures: [transformer]
methods: [AWSRC]
tech: [weight-only, low-bit-4, lossless-quantization-recovery, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
低ビット重み量子化はストレージを節約するが、言語モデル品質を劣化させる誤差を残す。**AWSRC** は既存の量子化バックボーンに対するコンパクトな「修復コーデック」。再構成された重み $W_0$ に対し、残差 $W - W_0$ を**決定論的なシード生成基底**で符号化する。サイドカーは明示的なコードブックではなく、シードセレクタ・低ビット係数・スケールを保存する。活性統計により、層出力に効く誤差が優先される。

## 評価
- Qwen2.5-3B-Instruct、INT4 RTN バックボーンに **0.162 scope-bits/weight を追加**
- BF16 とのギャップを **PPL 88.2% / KL 78.9% / accuracy 71.3% 埋める**
- サイドカー 49.25 MB(BF16 モデル重みペイロードの約 0.8%)

## 既存手法との差分
コードブックを持たずシードで基底を生成するため、サイドカーが極小で済む。

## 注目度コメント
低bit化ウォッチとして実用的。「INT4 + 0.16bit のサイドカーで BF16 ギャップの 7-9 割を埋める」は費用対効果が良い。llm-compressor の任意ビット幅プリセットと組み合わせて実効 bpw を細かく刻む発想と相性が良い。
