---
id: "2026-W25-004"
type: paper
title: "DynamicPTQ: Mitigating Activation Quantization Collapse via Residual-Stream Dynamics"
url: "https://arxiv.org/abs/2606.12487"
discovered: "2026-06-15"
published: "2026-06-10"
authors: [Zimo Zhao, Maolin Wang, Bowen Yu, Bowen Liu, Xiao Han, Xiangyu Zhao]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5]
architectures: [transformer]
methods: [SmoothQuant]
tech: [activation-quant, low-bit-4, kv-cache-quant, mixed-precision, outlier-handling, per-channel, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
activation量子化のcollapseがlayer深度に応じてphase-wiseに発生することを発見し、残差ストリームのダイナミクス（Jump Ratio / Historical Feature SNR指標）から感度の高い層を特定するPTQ手法。感度層のみ8-bit activationを維持しそれ以外はW4A4KV4を適用。LLaMAで一貫したperplexity改善を達成。

## 手法
- Jump Ratio: 残差ストリームの急激な変化を検出するメトリクス
- Historical Feature SNR: 量子化感度を信号対雑音比で定量化
- Phase-wise特定: 大きなactivationが出現・消滅する層境界を特定
- Mixed precision割当: 感度層 → 8-bit activation、それ以外 → 4-bit

## 評価
- LLaMA-3.1-7B/13B、Qwen2.5-7Bで検証
- ビット幅: W4A4KV4（感度層のみW4A8）
- Perplexityで既存W4A4と比較し一貫改善

## 既存手法との差分
SmoothQuant等が事前変換でoutlierを平滑化するのに対し、DynamicPTQは動的にcollapseが起きる層を検出して適応的bit幅を割当。追加学習不要。

## 注目度コメント
W4A4KV4の実用化に向けた感度解析フレームワーク。activation outlierの研究に新しい観点（phase-wise collapse）を追加。実装が公開されれば既存PTQパイプラインへの統合が容易。
