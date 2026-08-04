---
id: "2026-W31-013"
type: paper
title: "Recti-Q: Feature-Space Rectification for Out-of-Distribution-Robust Quantized Perception in Edge Robotics"
url: "https://arxiv.org/abs/2607.18540"
discovered: "2026-07-27"
published: "2026-07-20"
authors: []
venue: "arXiv (cs.CV, cs.LG, cs.RO)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, low-bit-4, lossless-quantization-recovery]
priority: watching
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
PTQ はクリーンな in-distribution 精度を保つ一方、分布シフト(センサノイズ・悪天候・新環境)下の信頼性を大きく損なう「Quantization-Induced Robustness Gap」を実証(ImageNet-C / PACS で 4-bit PTQ が ID 精度ほぼ無劣化のまま頑健性が顕著に劣化)。量子化バックボーンを凍結し、ソースデータのみで分類ヘッドの小さな LoRA アダプタを学習する軽量整流フレームワーク Recti-Q で頑健性を回復する。

## 手法
特徴空間整流。CNN/Transformer 双方に非依存、teacher-free、パラメータオーバーヘッド 1% 未満(最小 6 KB)。OTA での頑健性パッチ配信を想定。

## 評価
- 対象モデル: 大型 vision backbone(エッジロボティクス)
- ビット幅: 4-bit PTQ
- 精度劣化: 失われた頑健性の大部分を回復、FP32 同等〜超えの場合も
- スループット/メモリ: PTQ のメモリ削減の 99% 以上を保持

## 既存手法との差分
量子化評価の盲点である「OOD 頑健性」を測定軸にし、Recover-LoRA 系の軽量回復を頑健性に向けた点。

## 注目度コメント
LLM ではなく vision/ロボティクスだが、「量子化が壊すのはクリーン精度ではなく頑健性」という知見は量子化評価設計に示唆あり。watching。
