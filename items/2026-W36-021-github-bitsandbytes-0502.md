---
id: "2026-W36-021"
type: github
subtype: library
title: "bitsandbytes 0.50.2"
url: "https://github.com/bitsandbytes-foundation/bitsandbytes/releases/tag/0.50.2"
discovered: "2026-09-01"
published: "2026-08-27"
repo: "bitsandbytes-foundation/bitsandbytes"
release_tag: "0.50.2"
models: []
architectures: []
methods: [bitsandbytes, NF4]
tech: [weight-only, low-bit-4]
priority: watching
sources: [github]
status: new
related: []
---
## 日本語要約
ROCm 対応の強化が中心のパッチリリース。量子化アルゴリズム自体の変更はない。

## focus 突合(release body 全文スキャン)
- focus method / model いずれも出現なし

## 量子化関連の変更点
- **ROCm 10.0 ビルドを Linux / Windows 両方に同梱**
- prebuilt wheel の AMD GPU ターゲット追加
- **NVIDIA GB10 の一部 4bit GEMM 形状で性能改善** — `Add sm121 (GB10) to the wide_n_simt 4-bit GEMM dispatch rule` (#2039)
- `Mask the absmax store in the Triton 4-bit quantize kernels` (#2043)
- ROCm: gfx9 全ターゲットで Wave64 warp size を復旧 (#2059)、CI 拡充 (#2046, #2061)

## 影響範囲
- GB10 (DGX Spark) で bitsandbytes 4bit を使う場合の性能改善。

## 注目度コメント
watching。ただし同週に [[items/2026-W35-006-paper-compress-and-forget-bnb-interference|Compress and Forget]] が bitsandbytes INT4 の干渉下劣化を報告しており、**論文の評価は 0.50.2 より前のバージョンである点に留意**。
