---
id: "2026-W30-008"
type: paper
title: "Jack of All Scales: A Versatile FPGA Tensor Block for MXFP Precisions"
url: "https://arxiv.org/abs/2607.13898"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.AR)"
models: []
architectures: []
methods: [MXFP4, MXFP6]
tech: [microscaling-formats, low-bit-fp4, low-bit-fp6, low-bit-fp8]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
標準化された microscaling 浮動小数点(MXFP8/MXFP6/MXFP4)を FPGA でネイティブ実行するためのテンソルブロック設計。Altera Agilex-5 上で MXFP ドット積の実装戦略(soft logic / 固定小数点 DSP / 浮動小数点 DSP / テンソルモード)を網羅的に特性評価した上で、MXFP 系列を横断サポートする汎用 DSP ブロックを提案する。

## 手法
MXFP 各精度のドット積マッピング比較 → スケール共有構造を活かした reconfigurable テンソルブロックの設計。

## 評価
- 対象モデル: DNN/LLM 推論ワークロード(FPGA)
- ビット幅: MXFP8 / MXFP6 / MXFP4
- 精度劣化: フォーマット準拠(OCP MX 標準)
- スループット/メモリ: DSP 利用効率で既存マッピング比改善

## 既存手法との差分
現行 FPGA DSP が MXFP を直接サポートしない問題への、標準フォーマット横断のハードウェア解。

## 注目度コメント
MXFP エコシステム(NVFP4 の対抗軸)のハードウェア面の動きとして記録。normal。
