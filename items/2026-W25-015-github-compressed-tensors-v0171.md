---
id: "2026-W25-015"
type: github
subtype: library
title: "neuralmagic/compressed-tensors: 0.17.1"
url: "https://github.com/neuralmagic/compressed-tensors/releases/tag/0.17.1"
discovered: "2026-06-15"
published: "2026-06-11"
repo: "neuralmagic/compressed-tensors"
release_tag: "0.17.1"
models: []
architectures: [transformer, moe]
methods: [NVFP4, AWQ, GPTQ]
tech: [weight-only, low-bit-fp4, moe-quant]
priority: watching
sources: [github]
status: new
related: ["2026-W24-019"]
---

## 日本語要約
compressed-tensors 0.17.1（0.17.0の小パッチ）。safetensorsのmeta device上でのロード対応（Converters）、`load_offloaded_model`への明示的クラスパッチ適用（Offload）、非線形MoE gateレイヤーを無視する挙動追加。CI強化（Buildkite H100/L4）。量子化アルゴリズム自体の変更なし。

## 変更詳細
- safetensors meta device load: 大規模モデルのメモリ効率的ロードに対応
- MoE gate layer無視: 非線形gate（例: SwiGLU）を量子化対象から適切に除外
- CI: H100/L4でのBuildkite追加

## 注目度コメント
0.17.0（W24）のマイナーパッチ。vLLM v0.23.0のcompressed-tensors大幅変更（WNA8O8Int等）と合わせてライブラリの安定化が進む。今週は内容薄め。
