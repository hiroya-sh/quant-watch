---
id: "2026-W47-002"
type: paper
title: "SoScale: Second-Order Scale Search for FP4 Quantization"
url: "https://arxiv.org/abs/2611.16426"
discovered: "2026-11-16"
published: "2026-11-12"
authors: [arxiv:2611.16426]
venue: "arXiv:2611.16426"
models: []
architectures: []
methods: [NVFP4, MXFP4, HiF4]
tech: [low-bit-4, low-bit-fp4, block-wise, outlier-handling, ptq]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約
MXFP4 / NVFP4 / HiF4 など FP4 系は **block-wise scale をどう選ぶか**で精度が大きく変わる。従来の max-abs スケーリングは **外れ値に偏り**、内側のビット解像度を浪費する。SoScale は各ブロックのローカル Hessian 対角で **二次誤差を最小化する scale を探索**。追加校正データなしで NVFP4/MXFP4/HiF4 の精度を改善。

## 手法
- block ごとに scale 候補を離散探索、二次損失 $\frac{1}{2}\Delta^\top H \Delta$ を最小化
- Hessian 対角のみ使用(Fisher 近似)で軽量化、追加校正データ不要
- NVFP4 (E2M1, group=16), MXFP4 (E2M1, group=32), HiF4 (論文参照) 3 フォーマットで統一フレームワーク

## 評価
- 対象モデル: Llama 系・Qwen 系の weight-only FP4
- ビット幅: 4-bit weight(FP4 各種)
- 精度劣化: max-abs スケール比で PPL / 下流ベンチで改善
- オーバーヘッド: 校正不要、2 次探索のみなので quantize 時間は実用範囲

## 既存手法との差分
W36 の H-Scale(NVFP4 per-group scale の Hessian refine)、ModelOpt 0.46.0 の `local_hessian` Triton fast path と同じ領域を**フォーマット横断**で攻める。MXFP4/HiF4 まで同じ枠で扱う点が新しい。

## 注目度コメント
NVFP4 focus。[[items/2026-W36-001-paper-h-scale-nvfp4|H-Scale]] の follow-up 的内容。ModelOpt 0.48.0(W46)で NVFP4 recipe が全 focus モデルに揃った今、**どの scale 戦略が勝つかの比較実験が可能**。火曜定例の「NVFP4 scale 選択の今」整理に最適。
