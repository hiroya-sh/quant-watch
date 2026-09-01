---
id: "2026-W35-025"
type: hf-model
title: "rockerBOO/minimax-h3-nvfp4-fp8"
url: "https://huggingface.co/rockerBOO/minimax-h3-nvfp4-fp8"
discovered: "2026-09-01"
published: "2026-08-21"
base_model: "MiniMax-H3"
models: [MiniMaxAI/MiniMax-M3]
architectures: [hybrid, linear-attention]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-fp8, mixed-precision]
priority: normal
sources: [hf-models]
status: new
related: []
---
## 日本語要約
MiniMax-H3(ハイブリッド線形注意系)の NVFP4 + FP8 混在量子化。W35 の NVFP4 タグで DL 31,564 と上位。

## 量子化仕様
- ベースモデル: MiniMax-H3
- 量子化手法: NVFP4(重み) + FP8 の混在
- ビット幅: FP4 / FP8 mixed
- ファイルフォーマット: safetensors

## 精度報告
- カード上の体系的なベンチ報告は未確認。

## ダウンロード/利用状況
- DL 31,564 / likes 0(2026-09-01 時点)

## 注目度コメント
ハイブリッド線形注意モデルへの mixed NVFP4/FP8 適用の実例。W36 の [[items/2026-W36-005-paper-damp-recurrent-state-quant|DAMP]](再帰状態は INT4/NVFP4 でほぼ壊れる)と読み合わせると、**「重みは FP4、再帰状態は高精度」という分担**が実装側でも自然に選ばれていることが分かる。
