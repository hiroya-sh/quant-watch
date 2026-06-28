---
id: "2026-W27-006"
type: paper
title: "SpectraQuant: Frequency-Domain Activation Rotation for Outlier-Free Low-Bit Inference"
url: "https://arxiv.org/abs/2606.24517"
discovered: "2026-06-29"
published: "2026-06-25"
authors: [Yuhang Wang, Xiang Liu, Bowen Wang, Hao Chen, Lu Hou, Quoc Le]
venue: "arxiv"
affiliation: "Tsinghua / Google Research"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.5]
architectures: [transformer]
methods: [QuaRot, SpinQuant, SmoothQuant]
tech: [activation-quant, weight-only, rotation, low-bit-4, ptq, calibration]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Hadamard 系の時間領域回転に代わり、FFT/DCT で activation を「周波数領域」に写してから量子化する PTQ 手法。LLM activation のアウトライアが低周波数成分に集中することを実証し、周波数ビン別に異なるビット幅を割り当てることで W4A4 でも WikiText2 PPL +0.32（QuaRot 比 -0.18）を達成。FFT は固定演算で訓練不要、Walsh-Hadamard 系と相補的に組み合わせ可能。

## 手法
- **DCT-II 適用**: hidden state を per-channel に DCT-II 変換（リアル変換でメモリ効率良好）
- **周波数別ビット割当**: 低周波 8-bit、中周波 4-bit、高周波 3-bit。emission ベース感度解析で自動選択
- **Inverse-FFT fused kernel**: dequant 後の attention 計算と inverse DCT を融合
- **Hadamard と直交**: 既存 Hadamard 回転と組み合わせ可能（実験で「DCT→Hadamard」順の追加 PPL -0.05）

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.5-32B
- ビット幅: W4A4（4-bit weights, 4-bit activations 平均）
- 精度劣化: WikiText2 PPL +0.32（QuaRot +0.50、SpinQuant +0.61）
- スループット: vLLM 統合で H100 decode +14%

## 既存手法との差分
- **W26 UFP4** が幾何的バイアスを Hadamard で解決したのに対し、SpectraQuant は周波数領域での非一様量子化で別解
- **QuaRot/SpinQuant** とは「時間領域 vs 周波数領域」の対比。組合せ可能性を実証
- **W25 TWLA**（Kronecker直交）と比較すると DCT は固定演算でランタイムコスト低

## 注目度コメント
rotation が focus に間接ヒット（taxonomy.yml の rotation 系）。「FFT/DCT」は LLM 量子化で未開拓領域だったため新規性は高い。ただし実装の vLLM/TRT-LLM 統合は未公開、運用は今後の課題。Walsh-Hadamard 既存実装との重複は議題候補としては W27 全体の議論を分散させる。
