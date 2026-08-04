---
id: "2026-W31-001"
type: paper
title: "MXSens: Sensitivity-Aware Mixed-Precision Quantization for Efficient LLM Inference"
url: "https://arxiv.org/abs/2607.17733"
discovered: "2026-07-27"
published: "2026-07-20"
authors: []
venue: "arXiv (cs.LG, cs.AI)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, mixed-precision, microscaling-formats, outlier-handling, full-quant, kv-cache-quant, low-bit-4]
priority: high
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
MXINT 系 microscaling フォーマットの block-wise 構造を活かした、training-free の感度誘導型 mixed-precision PTQ。外れ値の深刻度(稀な極端値〜頻繁な軽微逸脱)と量子化感度がレイヤ・カラム単位で不均一に分布するという分析に基づき、カラム/レイヤ感度で mantissa ビット幅(4/6/8)を割り当てる。rotation 系がソフトウェア管理スケーリングと頻繁な dequant で被るオーバーヘッドを、ハードウェアにスケールを埋め込む MX 形式で回避する。

## 手法
MXINT のブロック構造上でカラム・レイヤ感度に応じて 4/6/8bit の mantissa を混在割当。rotation 非互換という MX 形式の弱点を、変換ではなく細粒度ビット割当で補う設計。calibration のみで再学習不要。

## 評価
- 対象モデル: LLaMA-2-70B, LLaMA-3-8B ほか
- ビット幅: W4A4KV4(MXINT、mantissa 4/6/8 混在)
- 精度劣化: WikiText-2 PPL 3.77 (LLaMA-2-70B) / 7.63 (LLaMA-3-8B) で既存 SOTA を大幅更新と主張
- スループット/メモリ: ハードウェア埋込スケールにより dequant オーバーヘッド削減

## 既存手法との差分
rotation(QuaRot/SpinQuant 系)や整数 mixed-precision が抱える「ソフトウェア管理スケールのオーバーヘッド」を、MX 形式ネイティブのハードウェアスケーリングで置き換えつつ、MX 形式が rotation と非互換という制約を感度ベースのビット割当で回避する点。

## 注目度コメント
W4A4KV4 のフル量子化設定で既存手法超えの明確な主張 + KV4 を含むため kv-cache-quant (focus) にも該当し high。MX 形式は Blackwell 以降のハードウェアトレンドと合致しており、火曜定例の議題候補。
