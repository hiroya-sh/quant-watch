---
id: "2026-W28-005"
type: paper
title: "DiffLLM-Q: NVFP4 Quantization for Non-Autoregressive Diffusion Language Models"
url: "https://arxiv.org/abs/2607.02005"
discovered: "2026-07-06"
published: "2026-07-03"
authors: [Aviv Bick, Beidi Chen, Chenlin Meng, Yilun Du, Percy Liang, Jason Weston]
venue: "arxiv"
affiliation: "CMU / Stanford / Meta FAIR"
models: [google/gemma-4]
architectures: [transformer]
methods: [NVFP4, MXFP4]
tech: [diffusion-llm-quant, low-bit-fp4, activation-quant, weight-only, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
拡散型（非自己回帰）LLM に対する NVFP4 量子化研究。Meta の DiffusionGemma 26B-A4B と Stanford の SEDD-L を対象に、拡散 sampling ステップ間で activation スケールが大きく変動する問題を「step-conditioned scale table」で解決。W2A4 相当のビット予算で拡散サンプリング品質を PPL +0.4 以内に保持。NVFP4 のブロックスケール構造との相性を検証し、MXFP4 との比較で NVFP4 の優位性を報告。

## 手法
- **Step-conditioned quantization**: 拡散のノイズレベル t ごとに activation スケール表を持ち、推論時に t に応じて選択
- **Weight+Activation joint recipe**: 重みは per-channel NVFP4、activation は step-conditioned per-token NVFP4
- **Corruption-aware calibration**: ノイズ入り入力に対して SNR-weighted 校正、低 SNR ステップでは高ビット、高 SNR では低ビットに配分
- **Reverse-process fusion kernel**: 拡散逆過程 (denoising) を fused kernel 化し、NVFP4 memory bandwidth を最大化

## 評価
- 対象モデル: DiffusionGemma-26B-A4B、SEDD-L 6B
- ビット幅: W4A4 NVFP4（step conditioned）
- 精度劣化: OpenWebText PPL FP16 比 +0.4、LAMBADA -0.7pt
- スループット/メモリ: サンプリング throughput 3.4x、メモリ 4.5x 削減（Blackwell B200）

## 既存手法との差分
- **AR LLM 向け NVFP4 (W22 以降)**: step の概念がなく単一スケール。DiffLLM-Q は step-conditioned という新軸
- **MXFP4 との比較**: MXFP4 の 32-element block だと拡散スケール変動を吸収しきれず、NVFP4 の 16-element block が優位

## 注目度コメント
diffusion-llm-quant は taxonomy に登録された比較的新しい tech tag。focus tech ではないが、Meta FAIR / Stanford / CMU の共著という布陣で今後の主流化の可能性あり。DiffusionGemma に対する量子化が Gemma-4 系列を追う形で登場した点は focus モデルに関連。
