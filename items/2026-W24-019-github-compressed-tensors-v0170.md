---
id: "2026-W24-019"
type: github
subtype: library
title: "neuralmagic/compressed-tensors: v0.17.0"
url: "https://github.com/neuralmagic/compressed-tensors/releases/tag/0.17.0"
discovered: "2026-06-08"
published: "2026-06-03"
repo: "neuralmagic/compressed-tensors"
release_tag: "0.17.0"
models: []
architectures: []
methods: []
tech: [weight-only, low-bit-1bit, low-bit-8, per-channel]
priority: watching
sources: [github]
status: new
related: []
---

## 日本語要約
vLLMエコシステムの圧縮テンソルライブラリv0.17.0。主な追加機能は1-8ビット整数重みの任意ビット幅pack-quantized対応（INT1〜INT8を統一的にパッキング処理）と、Embedding層のcompress/decompress機能追加。llm-compressor v0.11.0（W24-007）と連動したリリース。

## 変更点
- 任意1-8ビットINT重みのpack-quantized対応（INT1を含む全ビット幅を統一フォーマットで処理）
- Embedding層のcompress/decompress API追加

## 影響範囲
- llm-compressorのDDP AWQ/SmoothQuant対応を下支えするコア変更
- vocab embeddings の量子化が容易に

## 注目度コメント
llm-compressor v0.11.0のパートナーリリース。INT1対応の追加は超低ビット量子化への布石として注目。
