---
id: "2026-W23-016"
type: github
subtype: library
title: "ggml-org/llama.cpp: W23 builds (b9319-b9444)"
url: "https://github.com/ggml-org/llama.cpp/releases"
discovered: "2026-06-01"
published: "2026-05-31"
repo: "ggml-org/llama.cpp"
release_tag: "b9319-b9444"
models: []
architectures: [transformer, moe]
methods: [GGUF]
tech: [low-bit-4, weight-only]
priority: watching
sources: [github]
status: new
related: []
---

## 日本語要約
2026-W23期間（May 25-31）にllama.cppから20件超のビルドがリリース。量子化関連では b9387（AMD MFMA向けバッチ>=4量子化matmulルーティング改善）、b9370（Hexagon DSP向けQ4_1 MUL_MAT追加）、b9313（量子化LUTの初期化OpenMPで並列化）が注目。JinaEmbeddings tokenizer対応（b9442）など非量子化改善も含む。

## 量子化関連の変更点
- 新規対応手法/フォーマット: Hexagon向けQ4_1 MUL_MAT/MUL_MAT_ID
- 既存手法の改善: AMD MFMA hardware向けバッチ量子化matmulのルーティング最適化、量子化LUT並列初期化
- 対応モデル拡張: MiniCPM5 tokenizer対応（b9354）

## 影響範囲
- ユーザ視点の変化: AMD GPU (ROCm) での量子化matmul性能改善、エッジデバイス（Hexagon DSP）のQ4_1対応
- API/CLI 変更の有無: なし（バグ修正・最適化のみ）

## 注目度コメント
個別ビルドに大型機能追加なくwatching。AMD MFMA最適化は ROCm環境ユーザに実用的。
