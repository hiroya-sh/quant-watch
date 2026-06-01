---
id: "2026-W23-020"
type: github
subtype: library
title: "neuralmagic/compressed-tensors: 0.16.0"
url: "https://github.com/neuralmagic/compressed-tensors/releases/tag/0.16.0"
discovered: "2026-06-01"
published: "2026-05-28"
repo: "neuralmagic/compressed-tensors"
release_tag: "0.16.0"
models: [deepseek-ai/DeepSeek-V4]
architectures: [transformer, moe]
methods: [MXFP4, AWQ]
tech: [low-bit-fp4, microscaling-formats, activation-quant, weight-only]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
Neural Magic の compressed-tensors ライブラリが v0.16.0 でMXFP4 decompression サポートを追加。DeepSeek-V3.2 の逆量子化対応、AutoAWQ チェックポイントコンバータ追加、Apple Siliconへのオフロード対応（MPS device）、分散weight compression アルゴリズム導入が主要変更点。FP16/FP64への量子化丸め拡張も実施。

## 量子化関連の変更点
- 新規対応手法/フォーマット: MXFP4 decompression、AutoAWQ チェックポイント変換
- 既存手法の改善: FP16/FP64 丸め追加、DeepSeek-V3.2 dequantization対応
- 対応モデル拡張: DeepSeek-V3.2、Apple Silicon (MPS) オフロード対応

## 影響範囲
- ユーザ視点の変化: vLLM/llm-compressor でMXFP4フォーマットを compressed-tensors 経由で扱えるようになる。既存AutoAWQモデルの活用が容易に。
- API/CLI 変更の有無: observer パラメータ追加、torch.accelerator 移行

## 注目度コメント
vLLM v0.22.0 での MXFP4 compressed-tensors 統合とセットで注目。推論エンジンとcompression ライブラリの協調がBlackwell移行期に加速中。
