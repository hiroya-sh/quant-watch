---
id: "2026-W22-025"
type: github
subtype: library
title: "llama.cpp: 2026-W22 量子化関連改善まとめ (b9244-b9313)"
url: "https://github.com/ggml-org/llama.cpp/releases"
discovered: "2026-05-22"
published: "2026-05-18"
repo: "ggml-org/llama.cpp"
release_tag: "b9244-b9313 (多数)"
models: []
architectures: [moe, transformer]
methods: [GGUF]
tech: [low-bit-4, moe-quant, low-bit-fp8, weight-only]
priority: normal
sources: [github]
status: new
related: ["2026-W22-009"]
---

## 日本語要約

2026-W22（5/18〜5/25）にllama.cppはb9203〜b9320の約60ビルドをリリース。量子化・推論性能に関連する主要変更は: (1) OpenCL/Adrenoバックエンドへのq4_k/q5_k/q6_k MoEサポート追加 (b9244); (2) ZenDNN Q8_0量子化サポート (b9286); (3) SYCL MoEプリフィルスループット改善 (b9291); (4) Quant LUTのOpenMP並列化 (b9313); (5) NVFP4 MTPスケールテンソル対応 (b9297→2026-W22-009に詳細)。

## 量子化関連の変更点

- 新規対応手法/フォーマット:
  - OpenCL/Adreno: q4_k, q5_k, q6_k のMoEサポート追加 (b9244)
  - ZenDNN: Q8_0量子化サポート追加 (b9286)
  - NVFP4: MTPスケールテンソル対応 (b9297、別途 2026-W22-009)
- 既存手法の改善:
  - SYCL: MoEプリフィルスループット向上 (b9291)
  - Quant LUTのOpenMP並列化でiq2xs/iq3xs初期化高速化 (b9313)
  - ggml-zendnn Q8_0量子化パス追加 (b9286)
- 対応モデル拡張: Qwen3.5（NVFP4 MTP経由）

## 影響範囲

- ユーザ視点の変化: AdrenoモバイルGPUでのMoE量子化モデル推論が高速化；ZenDNN環境でQ8_0利用可能に
- API/CLI 変更の有無: なし（内部実装変更）

## 注目度コメント

NVFP4対応（b9297）はHIGH（2026-W22-009）として別途詳細。このまとめアイテムはMoE量子化推論の幅広いハードウェア展開の進捗を示す。
