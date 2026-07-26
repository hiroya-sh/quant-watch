---
id: "2026-W31-031"
type: hf-model
title: "mlx-community W31 OptiQ バッチ — Laguna-S-2.1 oQ2e〜oQ6e 系列 + Devstral-Small-2 OptiQ-4bit"
url: "https://huggingface.co/mlx-community/Laguna-S-2.1-oQ4e"
discovered: "2026-07-27"
published: "2026-07-21"
base_model: "poolside/Laguna-S-2.1"
models: [mistralai/Devstral]
architectures: [moe, dense]
methods: [OptiQ]
tech: [weight-only, mixed-precision, moe-quant]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-27 HF API で確認 (Laguna oQ2e/oQ2e-fast/oQ3e/oQ3e-fast/oQ4e/oQ4e-fast/oQ5e/oQ6e: createdAt 2026-07-21〜23、Devstral-Small-2-24B-Instruct-2512-OptiQ-4bit: 2026-07-23。tags: mlx/quantized/oq/mixed-precision)"
related: ["2026-W31-027"]
---

## 日本語要約
mlx-community の週次 OptiQ(Apple Silicon MLX 向け mixed-precision 量子化)バッチ。今週の主役は **Laguna-S-2.1 の oQ 系列8バリアント**(oQ2e〜oQ6e、-fast 版含む)で、[[items/2026-W31-027-hf-model-unsloth-laguna-s21-gguf|GGUF ウェーブ]]と同週に MLX 経路も揃った。加えて **Devstral-Small-2-24B-Instruct-2512 の OptiQ-4bit**(4bit/8bit mixed)も投入。W30 の Hy3-oQ2e バッチに続く定常運転。

## 量子化仕様
- ベースモデル: poolside/Laguna-S-2.1 (MoE) / mistralai/Devstral-Small-2-24B-Instruct-2512
- 量子化手法: OptiQ (oQ mixed-precision)
- ビット幅: 2〜6bit 系列(e = 拡張バリアント、-fast = 速度優先)
- 量子化対象: weight
- ファイルフォーマット: MLX (safetensors)

## 精度報告(あれば)
- ベンチマーク: モデルカード記載ベース
- 劣化幅: 未詳

## ダウンロード/利用状況
Laguna oQ4e 2,889 DL / oQ2e 1,734 DL ほか、系列合計で約 9k DL。

## 注目度コメント
新モデル即日対応の MLX 側定点観測。oQ2e(~2bit 級)まで揃えてくるのが OptiQ 系列の特徴で、Apple Silicon での大型 MoE ローカル実行の下限を探るデータ点。
