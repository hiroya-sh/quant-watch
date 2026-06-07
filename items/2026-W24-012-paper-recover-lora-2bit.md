---
id: "2026-W24-012"
type: paper
title: "Recover-LoRA for Aggressive Quantization: Reclaiming Accuracy in 2-Bit Language Models"
url: "https://arxiv.org/abs/2606.04238"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Devleena Das, Rajeev Patwari, Elliott Delaye, Ashish Sirasao]
venue: "arxiv"
models: [Qwen/Qwen3]
architectures: [transformer]
methods: [GPTQ]
tech: [low-bit-2, mixed-precision, calibration-free, weight-only, ptq, qat]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
2ビット重み量子化後の精度回復手法Recover-LoRA。MLP gate/up projectionのみW2量子化し、他層は高精度（W4/W2-GateUp混合）にする戦略がW4均一量子化より7.5-23.3%スループット改善を示すことをroofline分析で実証。次に合成データ10kサンプルでloRAアダプターをlogit蒸留で学習し、Qwen3-4Bで9/12ベンチマークで80-95%の精度回復を達成。

## 手法
- 選択的混合精度: MLP gate/up projectionのみW2、他層はW4以上を維持
- Recover-LoRA: W2量子化済みモデルに低ランクアダプターを追加
- 合成データ蒸留: ラベルなし10kサンプルでFP16教師からlogit蒸留
- W2の利点: roofline解析でW4比7.5-23.3%スループット向上を証明

## 評価
- 対象モデル: Qwen3-4Bを主軸に4B-20Bレンジ
- 精度回復: 9/12ベンチマークで80-95%回復
- スループット: W4比7.5-23.3%向上
- 合成データ数: 10kサンプルのみ

## 既存手法との差分
2bit+LoRAの組み合わせは既存（QuIP#等）にも存在するが、合成データのみでのLoRA学習とMLP限定W2の組み合わせは実践的アプローチとして有用。

## 注目度コメント
2ビット量子化の実用化（スループット向上の実証）と精度回復の両立を示す。エッジ推論向けの実用的フレームワーク。
