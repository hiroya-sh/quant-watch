---
id: "2026-W27-003"
type: paper
title: "SharQ: Bridging Activation Sparsity and FP4 Quantization for LLM Inference"
url: "https://arxiv.org/abs/2606.26587"
discovered: "2026-07-07"
published: "2026-06-25"
authors: [Haoqian Meng, Yilun Luo, Yafei Zhao, Wenyuan Liu, Huaqing Zheng, Xindian Ma, Peng Zhang]
venue: "arxiv"
affiliation: "（要確認）code: github.com/actypedef/SharQ"
models: [meta-llama/Llama-3.1, Qwen/Qwen2.5, Qwen/Qwen3]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4]
tech: [low-bit-fp4, activation-quant, calibration-free, ptq]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了"
related: []
---

## 日本語要約
学習・校正不要の推論時手法で、activation sparsity と FP4 量子化を online の sparse-dense 分解で橋渡し。入力適応の N:M マスクで outlier 主導の sparse backbone を抽出して FP4 量子化し、量子化 backbone に対する dense 残差を定義。sparse FP4 GEMM と dense FP4 GEMM が 1 つの FP4 weight ペイロードを path 別 scale view で共有し、fused prep カーネルを併用。**focus の NVFP4 に直撃**、MXFP4/HiF4 にも汎化と主張。

## 手法（abstract より）
- input-adaptive な N:M マスクで sparse backbone を抽出 → FP4 化
- dense 残差 + sparse/dense 2経路の FP4 GEMM が weight を共有
- training-free / calibration-free

## 評価（論文主張値）
- 対象: Llama-3.1-8B, Qwen2.5-7B, Qwen3-30B-A3B, Qwen3-VL-8B, Wan2.2-T2V-A14B
- NVFP4→FP16 の精度ギャップを 43–63% 回復、NVFP4/HiF4/MXFP4 に汎化
- RTX 5090 で FP16 比 2.2–2.4x 低レイテンシ、FP8 比 1.2–1.4x スループット、動画生成で最大 1.58x

## 注目度コメント
NVFP4 が focus 直撃、公開コードあり。activation sparsity × FP4 という新結合。数値は abstract 主張。
