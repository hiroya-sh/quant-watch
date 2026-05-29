---
id: "2026-W22-013"
type: hf-model
title: "mconcat/Qwopus3.6-27B-v2-NVFP4"
url: "https://huggingface.co/mconcat/Qwopus3.6-27B-v2-NVFP4"
discovered: "2026-05-23"
published: "2026-05-23"
base_model: "Jackrong/Qwopus3.6-27B-v2"
models: [Qwen/Qwen3.5, Qwen/Qwen3.6]
architectures: [transformer]
methods: [NVFP4]
tech: [low-bit-fp4, microscaling-formats]
priority: high
sources: [hf-models]
status: new
related: ["2026-W22-009"]
---

## 日本語要約

Qwen3.6-27B派生のQwopusモデルへのNVFP4量子化。Blackwell GPU向けのFP4フォーマットを採用。同週に同作者からAWQ-4bit版 (2606位ダウンロード) およびFP8版も公開されており、同一モデルを複数精度でカバーしているシリーズ。NVFP4版は2706ダウンロードを記録し、コミュニティでのBlackwell対応需要を示す。

## 量子化仕様

- ベースモデル: Jackrong/Qwopus3.6-27B-v2（Qwen3.6-27Bベース）
- 量子化手法: NVFP4
- ビット幅: FP4 (NVFP4)
- 量子化対象 (weight / activation / kv): weight（主に）
- ファイルフォーマット: Blackwell NVFP4形式

## 精度報告(あれば)

- ベンチマーク: 未報告
- 劣化幅: 未報告

## ダウンロード/利用状況

2706 ダウンロード（2026-05-25時点）。同モデルのAWQ版が5629、FP8版が2494ダウンロードで、NVFP4版はAWQ版に次ぐ人気。Blackwell普及を示す指標として注目。
