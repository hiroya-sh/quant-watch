---
id: "2026-W34-001"
type: paper
title: "Language-Conditional Dequantization: Recovering What Quantization Steals from Non-English Languages"
url: "https://arxiv.org/abs/2608.11786"
discovered: "2026-08-17"
published: "2026-08-12"
authors: [Nirmal Thomas]
venue: "arXiv"
models: [meta-llama/Llama-3.2, Qwen/Qwen2.5]
architectures: [transformer]
methods: [GPTQ]
tech: [weight-only, low-bit-3, lossless-quantization-recovery]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
低ビット量子化(sub-4B の INT3 GPTQ)は多言語能力を不均衡に劣化させ、非英語で英語比2〜4倍の perplexity 悪化を測定。LCD は量子化済みモデルの各線形層に**言語ごとの rank-2 LoRA 補正**を後付けする手法で、言語あたり +0.12% のパラメータ・単一GPU 20分未満の学習で、非ラテン文字言語の PPL ギャップを70〜83%、GlobalMMLU 精度ギャップを17〜28%回復。等容量の言語非依存補正を3〜9pt、data-free ベースライン(LQER)を桁違いに上回る。

## 手法
量子化済み重みを固定したまま、言語条件付きの低ランク補正(rank-2 LoRA)を各 linear に付加。量子化損傷が層の浅さ/深さのどこに集中するか(Llama=早期層、Qwen=後期層)を切り分け、層限定版で機構を検証。

## 評価
- 対象モデル: Qwen2.5-3B / Llama-3.2-3B
- ビット幅: INT3 (GPTQ)
- 精度劣化: 非英語 PPL ギャップの70〜83%回復、GlobalMMLU 17〜28%回復
- スループット/メモリ: 追加パラメータ言語あたり+0.12%、学習<20分/1GPU

## 既存手法との差分
言語非依存の低ランク補正や data-free の LQER と異なり、言語条件付きで損傷の局在に対処。量子化を「捨てる」のではなく後段で回復する lossless-quantization-recovery 系。

## 注目度コメント
主要モデル(Qwen2.5/Llama-3.2)への実用的な量子化後回復。vLLM でロード済み量子化モデルに軽量補正を足すだけで多言語を救える点が監視方針に合致。
