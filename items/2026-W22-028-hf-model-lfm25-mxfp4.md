---
id: "2026-W22-028"
type: hf-model
title: "sahilchachra/lfm2-5-8b-a1b-mxfp4-mlx"
url: "https://huggingface.co/sahilchachra/lfm2-5-8b-a1b-mxfp4-mlx"
discovered: "2026-05-25"
published: "2026-05-25"
base_model: "LiquidAI/LFM2.5-8B-A1B"
models: []
architectures: [hybrid]
methods: [MXFP4]
tech: [low-bit-fp4, microscaling-formats, weight-only]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約

LiquidAI LFM2.5-8B-A1B（MoEハイブリッドアーキテクチャ）へのMXFP4量子化をApple Silicon MLX向けに実装。MXFP4（Microscaling FP4）はBlackwell向けのNVFP4と並ぶ新精度フォーマットで、MLXがApple Silicon上でこのフォーマットをサポートし始めていることを示す。ハイブリッドアーキテクチャ（Mamba系＋Transformer混合）へのMXFP4適用としても新規性あり。

## 量子化仕様

- ベースモデル: LiquidAI/LFM2.5-8B-A1B（SSM/Transformer ハイブリッド MoE、8B total/1B active）
- 量子化手法: MXFP4 (Microscaling FP4)
- ビット幅: FP4（MXFP4 microscaling）
- 量子化対象 (weight / activation / kv): weight-only
- ファイルフォーマット: MLX（Apple Silicon向け）

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

公開直後（2026-05-25）のため0ダウンロード。Apple Silicon + MXFP4という新しいエコシステムの動向として注目価値あり。
