---
id: "2026-W31-023"
type: github
subtype: library
title: "bitsandbytes 0.50.0 — fused 4-bit GEMM で推論最大4倍高速化 / ROCm 安定版昇格 / Apple Silicon 全構成対応"
url: "https://github.com/bitsandbytes-foundation/bitsandbytes/releases/tag/0.50.0"
discovered: "2026-07-27"
published: "2026-07-25"
repo: "bitsandbytes-foundation/bitsandbytes"
release_tag: "0.50.0"
models: []
architectures: []
methods: [bitsandbytes, NF4, LLM.int8]
tech: [weight-only, low-bit-4]
priority: high
sources: [github-releases]
status: new
verified: "2026-07-27 gh api で release body 取得・published_at 確認"
related: []
---

## 日本語要約
bitsandbytes の大型リリース。**新しい fused 4-bit dequantize + GEMM カーネル**が従来の GEMV / `dequantize + F.linear` 経路を置き換え、バッチサイズ 2〜64 で 4-bit 推論が最大4倍高速(Turing〜Blackwell、バッチ1でも改善多数、nested quantization / bias も融合、#1949)。SIMT 版を ROCm にも移植 (#1979)。**AMD ROCm はプレビューを卒業し stable 扱い**に(Windows 用 ROCm wheel 公開、RDNA2/CDNA1 まで対応拡大)。**Apple Silicon (MPS) は全 4-bit / LLM.int8() 構成が動作**するようになり、macOS 26+ では Hub の最適化 Metal カーネルを利用可。CPU の blockwise quant/dequant も 1.1x〜20x 超の高速化。Windows on ARM の NEON wheel、CPU/XPU オプティマイザ対応追加。

## 量子化関連の変更点
- 新規対応手法/フォーマット: fused 4-bit GEMM(カーネルは shape/アーキ/SM 数で自動選択)
- 既存手法の改善: CPU blockwise quant 最大20x、LLM.int8() CPU matmul 改善、ホスト側ディスパッチのオーバーヘッド削減
- 対応プラットフォーム拡張: ROCm stable / MPS 全構成 / Windows ARM

## 影響範囲
- ユーザ視点の変化: QLoRA/NF4 系のローカル推論が小〜中バッチで大幅に速くなる。AMD・Apple ユーザにとっては事実上の解禁リリース
- API/CLI 変更の有無: カーネル選択は自動(API 変更なしで恩恵)

## 注目度コメント
「最大4倍」の明確な性能改善主張 + プラットフォーム網羅性の大幅拡大で high。bnb は HF エコシステムのデフォルト量子化バックエンドであり影響範囲が広い。火曜定例の議題候補。
