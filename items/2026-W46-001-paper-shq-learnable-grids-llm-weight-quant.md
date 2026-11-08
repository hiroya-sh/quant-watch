---
id: "2026-W46-001"
type: paper
title: "SHq: Learnable Grids for LLM Weight Quantization"
url: "https://arxiv.org/abs/2611.02966"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Michael Helcig", "Earl Killian", "Dan Alistarh"]
venue: "arXiv:2611.02966"
models: []
architectures: ["moe"]
methods: ["GPTQ", "NVFP4", "NF4"]
tech: ["mixed-precision", "moe-quant", "low-bit-fp4", "low-bit-fp8", "low-bit-2", "low-bit-4", "ptq"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

2〜6ビット重み量子化の LUT 形式では「万能な固定グリッド」は存在せず、ビット幅ごとに最適形（2bit=bof、4/5bit=nf、6bit=int）が異なる。SHq は compand 強度 α と非対称オフセット c の2自由度で任意の LUT グリッドを closed-form に生成し、FP8 ブロックスケール符号ビットを使ってブロック内の有効値数を最大 2 倍化する。3B〜35B の 5 モデル × RTN/GPTQ × 2-6bit で最低 KL、4.5 bit/weight で NVFP4 比 KL -41〜67%。

## 手法

LUT グリッド `g(k) = sinh((αk+c)/N)` を使い、ブロック重みの対数空間での分布形状をオフライン較正で合わせる。実装は LUT のテーブル値のみ差し替える drop-in。FP8 ブロックスケールの符号ビットを使って自動的にミラー側テーブルを選択する機構を持つ。

## 評価

- モデル: Llama-3B〜Llama-35B (dense + MoE 混在)
- ビット幅: 2, 3, 4, 4.5, 5, 6
- 精度劣化: NVFP4 (4.5bpw) で KL -41〜67%, best fixed grid 比 -34% まで改善
- スループット: LUT 差し替えのみ、ランタイム影響なし

## 注目度コメント

NVFP4 focus — NVFP4 の弱点（固定 grid）を直接攻めた最初の実用的 drop-in replacement。Dan Alistarh が著者。llm-compressor / modelopt の NVFP4 パスへの接続が自然。
