---
id: "2026-W33-034"
type: hf-model
title: "gemma-4 量子化ウェーブ (NVFP4/AWQ/GPTQ, focus model)"
url: "https://huggingface.co/Adam1010/nomos-gemma-4-31b-nvfp4"
discovered: "2026-08-10"
published: "2026-08-08"
base_model: "google/gemma-4"
models: [google/gemma-4]
architectures: []
methods: [NVFP4, AWQ, GPTQ]
tech: [low-bit-fp4, weight-only, vllm-ready]
priority: high
sources: [hf-models]
status: new
related: []
---

## 日本語要約
focus modelのgemma-4系に対し複数の量子化が出た週。nomos-gemma-4-31b-nvfp4、gemma-4-opencoder-40b-a8b-nvfp4-v2(LLMWildling)、gemma-4-12b-it-AWQ-rtn(JelleFoks)、Gemma-4-E4B-it GPTQ(simaai, W28ツール系)など。加えてTRT-LLM rc23がGemma4 K=V層のW4A8を公式サポート(item 026)。

## 量子化仕様
- ベースモデル: google/gemma-4 各サイズ(12B/31B/40B-a8b/E4B)
- 量子化手法: NVFP4 / AWQ(rtn) / GPTQ
- ビット幅: 4bit中心、W4A8(TRT-LLM経路)
- 対象: weight、MoE variant(opencoder-40b-a8b)含む

## 精度報告(あれば)
- community量子化が中心で精度報告は限定的

## ダウンロード/利用状況
- DL数は中規模だがfocus modelとして継続監視対象

## 注目度コメント
**focus model直撃**。W31では「公式・大手の新規量子化なし」だったgemma-4に、今週はNVFP4/AWQ/GPTQ + TRT-LLM W4A8(item 026)と複数経路で量子化が出た。focus bump。
