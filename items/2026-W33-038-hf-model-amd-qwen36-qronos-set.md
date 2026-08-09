---
id: "2026-W33-038"
type: hf-model
title: "AMD Qwen3.6-35B-A3B W4 比較セット (Qronos/AWQ/GPTQ/AutoSmoothQuant)"
url: "https://huggingface.co/amd-satre/Qwen3.6-35B-A3B-w_int4_a_bf16-qronos"
discovered: "2026-08-10"
published: "2026-08-08"
base_model: "Qwen/Qwen3.6-35B-A3B"
models: []
architectures: [moe]
methods: [AWQ, GPTQ, SmoothQuant]
tech: [weight-only, low-bit-4, moe-quant]
priority: normal
sources: [hf-models]
status: new
related: []
---

## 日本語要約
AMD(amd-satre)がQwen3.6-35B-A3Bを同一設定(w_int4_a_bf16)で複数手法量子化した比較セット: qronos / awq / autosmoothquant / gptq / 無量子化。手法横断の公平比較用アーティファクト。

## 量子化仕様
- ベースモデル: Qwen3.6-35B-A3B (MoE)
- 量子化手法: Qronos / AWQ / AutoSmoothQuant / GPTQ
- ビット幅: W4(int4 weight) / A16(bf16 activation)
- 対象: weight-only, MoE

## 精度報告(あれば)
- 同一bit設定で手法比較できる構成。精度数値は各card依存

## ダウンロード/利用状況
- 公開直後で低DLだがAMD公式の比較セットとして価値

## 注目度コメント
Qronos(比較的新しいweight-only手法)をAWQ/GPTQと並置。手法比較の参照点として有用。taxonomy未登録のQronosは新規タグ候補。
