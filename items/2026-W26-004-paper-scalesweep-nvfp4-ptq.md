---
id: "2026-W26-004"
type: paper
title: "ScaleSweep: Accurate NVFP4 Post-Training Quantization of LLMs via Block Scale Initialization"
url: "https://arxiv.org/abs/2606.07618"
discovered: "2026-06-22"
published: "2026-06-07"
authors: [Li Lin, Xiaojun Wan]
venue: "arxiv"
models: [meta-llama/Llama-3.1, Qwen/Qwen3]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, ptq, kv-cache-quant, activation-quant, weight-only, calibration]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
NVFP4 PTQにおけるブロックスケール初期化を改善する手法。AbsMax初期化の限界を指摘し、MSEおよびWMSEを目標関数として実行可能なブロックスケール候補を掃引（sweep）して最小化する選択方式を提案。理論的な探索範囲上下限を導出して計算コストを抑制。重み・活性化・KVキャッシュ・クエリ状態の全成分を積極的に量子化する端対端（E2E）設定でも全精度性能の93%以上を保持。LlamaおよびQwenファミリーで一貫した改善を確認。

## 手法
- **Block Scale Sweep**: AbsMaxの代わりに候補ブロックスケール集合をMSE/WMSE最小化基準で探索
- **理論的探索範囲**: 下限・上限の理論的境界で候補数を削減し計算オーバーヘッドをほぼゼロに
- **E2E量子化対応**: 重み・活性化・KVキャッシュ・クエリ状態のNVFP4化を統合評価

## 評価
- LlamaとQwenモデルで検証
- 全成分NVFP4量子化（E2E）で全精度比93%以上を保持
- AbsMax初期化に対して一貫した改善

## 既存手法との差分
NVFP4のブロックスケール最適化に特化した初の理論的アプローチ。W25で登場したNVIDIA公式NVFP4モデル群（ModelOpt v0.44.0使用）に対して、より精度の高い初期化が可能になる可能性。

## 注目度コメント
NVFP4がfocus。NVIDIA Blackwellエコシステムでの実用的改善に直結。特にKVキャッシュ・クエリ状態のNVFP4量子化（kv-cache-quantも包含）はfocusの複合的なヒット。W25のUFP4（E2M1バイアス理論）と同週に登場しNVFP4研究の多角化を示す。
