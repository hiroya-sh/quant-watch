---
id: "2026-W25-014"
type: github
subtype: library
title: "ggml-org/llama.cpp: W25 builds (b9585–b9637)"
url: "https://github.com/ggml-org/llama.cpp/releases"
discovered: "2026-06-15"
published: "2026-06-09"
repo: "ggml-org/llama.cpp"
release_tag: "b9585-b9637"
models: [google/gemma-4, Qwen/Qwen3.5, moonshotai/Kimi-K2.5]
architectures: [transformer, moe, hybrid]
methods: [GGUF]
tech: [weight-only, low-bit-4, speculative-decoding, moe-quant]
priority: normal
sources: [github]
status: new
related: ["2026-W24-018"]
---

## 日本語要約
llama.cpp W25ビルド群（b9585〜b9637、約30ビルド）。量子化面での主要変更はb9603（OpenCL: Adreno GPU向けq5_0/q5_1 GEMM/GEMVカーネル追加）。b9606でEAGLE3投機的デコーディングサポートを追加。他のビルドはCI整備、Vocab refactoring、SSM/GDN改善、サーバー修正が中心。Kimi-K2.7-Code、MiniMax M3の新規モデル対応も含む。

## 量子化関連の変更
- b9603: OpenCL q5_0/q5_1 GEMM/GEMVカーネル（Adreno GPU向け）: モバイル向けGGUF量子化の精度向上
- EAGLE3投機的デコーディング（b9606）: 量子化モデルとの組み合わせで推論高速化

## その他変更
- CUDA: scalarタイプのconcat最適化（b9605）
- Kimi-K2.7-Code、MiniMax M3のモデル対応
- GDN（Gated DeltaNet）カーネル改善（Qwen3.5向け）

## 注目度コメント
W25のllama.cppは量子化面での大きな変化は少なく、Adreno GPU q5_0/q5_1が主要追加点。モバイルAndroid向けGGUF量子化の裾野拡大として中長期的に重要。
