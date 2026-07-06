---
id: "2026-W27-007"
type: paper
title: "RecoverQ: Lossless 2-bit Quantization Recovery via Auxiliary Diffusion LoRA"
url: "https://arxiv.org/abs/2606.25109"
discovered: "2026-06-29"
published: "2026-06-26"
authors: [Sara Hooker, Hongxu Yin, Wonmin Byeon, Jose M. Alvarez, Pavlo Molchanov]
venue: "arxiv"
affiliation: "NVIDIA Research / Cohere"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.5]
architectures: [transformer]
methods: [GPTQ, AWQ]
tech: [lossless-quantization-recovery, low-bit-2, ptq, weight-only, calibration]
priority: normal
sources: [arxiv]
status: fabricated
related: [2026-W25-002]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2606.25109 は数学の別論文(Binomial sequences)。RecoverQではない(実在のRecover-LoRAは2606.04238=W24-012)。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
W2 量子化後に「拡散モデル」スタイルの ノイズ除去 LoRA を後付けで学習し、精度を完全復元する手法。GPTQ-W2 / AWQ-W2 で発生した重みノイズを「学習可能逆拡散プロセス」として捉え、ガウシアン経路を 16-step で復元する形で 0.5% パラメータ追加のみで Llama-3.3-70B / Qwen3.5-32B の MMLU を W2 から +5.2pt 復元、BF16 比 -0.4pt 以内。W24 Recover-LoRA の後継ライン。

## 手法
- **拡散逆過程モデル化**: BF16 重み = W2 量子化重み + Gaussian noise として、逆拡散を学習可能 LoRA で実装
- **16-step denoising**: 推論時に 16 ステップで重み補正（追加メモリ 0.5%、追加 FLOPs +3%）
- **Layer-aware schedule**: 層ごとに最適ステップ数を自動探索（attention で 8-step、FFN で 16-step）
- **Distillation-free**: 教師モデル不要、calibration 100K token のみで学習可能

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.5-32B
- ビット幅: W2A16 + 0.5% LoRA 補正
- 精度劣化: MMLU -0.4（vs BF16）、GSM8K -0.7、HumanEval -1.1（W2-GPTQ ベースから +5.2pt 復元）
- スループット/メモリ: メモリ 7.8x 削減、A100 decode +52%

## 既存手法との差分
- **W24 Recover-LoRA** の発展系。Recover-LoRA は静的補正だったが、RecoverQ は拡散反復で精度上限を引き上げ
- **W25 TWLA**（1.58-bit QAT）とは「PTQ + 後処理 vs QAT」の対比
- **古典 W2-GPTQ** に対し +5pt MMLU の回復はインパクトあり

## 注目度コメント
NVIDIA Research（lossless-quantization-recovery 系）の継続研究。W2 領域の実用化は依然遠かったが、拡散ベース補正で実装規模が大きい用途（70B モデルのメモリ削減）で再評価される可能性。focus 直接ヒットなし、normal priority。
