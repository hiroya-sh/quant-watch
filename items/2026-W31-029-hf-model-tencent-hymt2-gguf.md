---
id: "2026-W31-029"
type: hf-model
title: "tencent/Hy-MT2-30B-A3B-GGUF — Tencent 公式の翻訳特化 MoE GGUF"
url: "https://huggingface.co/tencent/Hy-MT2-30B-A3B-GGUF"
discovered: "2026-07-27"
published: "2026-07-23"
base_model: "tencent/Hy-MT2-30B-A3B"
models: []
architectures: [moe]
methods: [GGUF]
tech: [llamacpp-ready, weight-only, moe-quant]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-27 HF API で確認 (createdAt 2026-07-23, downloads 14,984, tags: gguf/translation, 多言語 zh/en/fr/pt/es/ja/tr/ru/ar)"
related: []
---

## 日本語要約
Tencent **公式**による翻訳特化 MoE モデル Hy-MT2-30B-A3B の GGUF 量子化。多言語(日本語含む9言語+)対応の translation モデルで、公開数日で約 15k DL。W30 の AngelSlim Hy3 GGUF/GPTQ に続き、Tencent がベンダー公式量子化ラインを翻訳系にも展開してきた形。AngelSlim 側からも同モデルの GGUF(imatrix 付き)が出ている。

## 量子化仕様
- ベースモデル: tencent/Hy-MT2-30B-A3B (MoE 30B, active 3B)
- 量子化手法: GGUF
- ビット幅: 複数バリアント
- 量子化対象: weight
- ファイルフォーマット: GGUF

## 精度報告(あれば)
- ベンチマーク: モデルカード記載ベース
- 劣化幅: 未詳

## ダウンロード/利用状況
14,984 DL(公開後約4日)。llama.cpp 経路で即実行可能。

## 注目度コメント
ベンダー公式 GGUF が「リリース標準装備」化する流れの継続例。翻訳特化 + 3B active の MoE は端末内翻訳ユースケースに直結。tencent/Hy-MT2 は taxonomy models のタグ候補(W30 からの Hy 系継続)。
