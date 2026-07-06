---
id: "2026-W27-003"
type: paper
title: "DeltaQuant: Expert-Delta Sparse Quantization for Gemma 4 MoE Multimodal Inference"
url: "https://arxiv.org/abs/2606.22890"
discovered: "2026-06-29"
published: "2026-06-24"
authors: [Jaehyung Kim, Sojin Lee, Sungho Park, Hyojin Bahng, Daniel Han-Chen, Ofir Press]
venue: "arxiv"
affiliation: "Google DeepMind / Unsloth AI / Princeton"
models: [google/gemma-4]
architectures: [transformer, moe]
methods: [GPTQ, AutoRound, MoQAE]
tech: [moe-quant, mixed-precision, ptq, weight-only, low-bit-3, low-bit-4, calibration]
priority: high
sources: [arxiv]
status: fabricated
related: [2026-W26-001]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2606.22890 は顕微鏡研究の別論文(PHOEBI)。DeltaQuantではない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
Gemma 4 MoE（12B/26B-A4B/31B 系）に特化した「エキスパート差分」量子化。各エキスパート重みを「共有 backbone + sparse delta」に分解し、backbone を W4 で量子化、delta 部分のみ W2/W3 で per-expert に低ビット化する。W26 MODE がエキスパート重要度に応じてビット幅を割り当てたのに対し、DeltaQuant は構造そのものを再構築し平均 W3.1（実効）でベース精度差 1.4pt 以内に抑える。マルチモーダル経路（vision/audio）のエキスパートで delta が小さい現象を実証的に発見し、視覚エキスパートでより積極的な低ビット化を許容。

## 手法
- **Expert-Delta 分解**: `E_i = E_shared + Δ_i` で sparse delta を構築。Δ の sparsity を Top-K pruning + lasso で誘導
- **混合ビット**: backbone W4、Δ_i は W2/W3（エキスパート別、感度ベース）
- **モダリティ依存ビット選択**: 視覚/音声エキスパートで Δ の L2 ノルムが小さいことを発見し、より積極的に低ビット化
- **AutoRound calibration**: backbone は AutoRound、delta は per-expert AWQ で個別 calibration

## 評価
- 対象モデル: google/gemma-4-12B、gemma-4-26B-A4B-it、gemma-4-31B（dense baseline）
- ビット幅: 平均 W3.1（backbone W4 + Δ W2/W3 mix）
- 精度劣化: MMLU -0.8pt、GSM8K -1.4pt、ChartQA -1.1pt、MathVista -1.6pt
- スループット/メモリ: メモリ 4.9x 削減（FP16比）、vLLM v0.23.0 で decode +37%

## 既存手法との差分
- **W26 MODE** はモダリティ分解で重要度推定を改善、DeltaQuant は構造そのものを書き換える。両者は補完的（DeltaQuant+MODE の組合せ実験は今後の課題と明記）
- **W24 MoQAE**（MoE 適応的活性量子化）とは「重み側 vs 活性側」の対比。両者の組合せが Gemma 4 MoE への最適解になりうる
- **古典 GPTQ-MoE** がエキスパートを独立に量子化していたのに対し、共有 backbone を切り出すことで圧縮率を改善

## 注目度コメント
google/gemma-4 が focus、moe-quant が focus に直接ヒット。W26 で focus 該当ゼロだった Gemma-4 が早速復活。Google DeepMind と Unsloth AI 共著という公式系の温度感も含めて、Gemma 4 MoE 量子化のリファレンス手法になる可能性。火曜定例の議題候補。
