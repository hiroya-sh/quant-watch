---
id: "2026-W24-018"
type: github
subtype: library
title: "ggml-org/llama.cpp: W24 builds (b9541-b9553)"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/b9553"
discovered: "2026-06-08"
published: "2026-06-07"
repo: "ggml-org/llama.cpp"
release_tag: "b9541-b9553"
models: [google/gemma-4, moonshotai/Kimi-K2.5]
architectures: [transformer, moe]
methods: [GGUF]
tech: [kv-cache-quant, weight-only, low-bit-4, mixed-precision]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
2026-06-06〜06-07にかけてのllama.cppデイリービルド群（b9541〜b9553）。Gemma4 MTP（Multi-Token Prediction）サポートの追加、KVセルコピー回避によるKVキャッシュ最適化、LFM2/LFM2.5の推論修正、Qwen-VLベースモデルのマルチフレームマージサポートが主要変更。Gemma 4 12B（当週リリース）への即日MTP対応が注目点。

## 量子化関連の変更点
- KVキャッシュ最適化: 不要なKVセルコピーを回避（`kv-cache : avoid kv cells copies` / `follow source cache size when sharing cells`）
- Gemma4 MTPサポート: 新モデルへのGGUFサポート拡張
- LFM2/LFM2.5推論修正: 推論ラウンドトリップとリーク修正

## 影響範囲
- Gemma 4 12B（6月3日リリース）が同週内にllama.cppでMTP対応
- KVキャッシュ効率改善でメモリ使用量の最適化
- LFM2/LFM2.5のGGUF推論が安定化

## 注目度コメント
Gemma 4 12Bの即日llama.cpp対応（MTP含む）とKVキャッシュ最適化が主要ハイライト。GGUFエコシステムでのGemma4量子化利用が加速。
