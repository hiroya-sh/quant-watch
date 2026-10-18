---
id: "2026-W43-039"
type: github
subtype: library
title: "intel/auto-round: v0.16.1"
url: "https://github.com/intel/auto-round/releases/tag/v0.16.1"
discovered: "2026-10-19"
published: "2026-10-18"
repo: "intel/auto-round"
release_tag: "v0.16.1"
models: []
architectures: [transformer]
methods: [AutoRound, GGUF]
tech: [weight-only, ptq, calibration, mixed-precision]
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約
auto-round v0.16.1。目玉は **NeUQI (`--enable_neuqi`): RTN 向けのグリッドサーチ**で、asym スケール/ゼロ点の joint 探索、sym の 2 段階探索、frozen-init anchor を追加。残りは GGUF の K-quant 周り(Q3_K / Q5_K 系)の精度バグ修正、70B クラスの `attn_v` を llama.cpp と同様 Q5_K に揃える、拡散モデルのパイプライン kwargs 修正、Windows Triton コンパイル要件の文書化など安定性修正中心。

## 量子化関連の変更点
- **NeUQI grid search for optimized RTN** (`--enable_neuqi`): joint asym scale/zp search + 2-stage sym + frozen-init anchor #2341
- GGUF asymmetric K-quant groups で 0 を range に残す修正 #2438
- Q5_K GGUF packing 修正 #2437
- `make_q3_quants` 合算値を accepted levels と同期 #2439
- 70B 系の attn_v を llama.cpp 準拠で Q5_K に #2443
- mxuint フォーマット追加 #2425

## 注目度コメント
本リリースは実装側の変更が主。
