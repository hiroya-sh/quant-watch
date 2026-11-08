---
id: "2026-W46-005"
type: paper
title: "FlagRot: Selective Rotation for Low-Bit KV Caches"
url: "https://arxiv.org/abs/2611.03992"
discovered: "2026-11-09"
published: "2026-11-02"
authors: ["Kunming Shao", "Xijie Huang", "Jierun Chen", "Jiaqi Shao"]
venue: "arXiv:2611.03992"
models: []
architectures: ["transformer"]
methods: []
tech: ["rotation", "per-channel", "per-token", "kv-cache-quant", "low-bit-fp4", "low-bit-2", "low-bit-4"]
priority: high
sources: [arxiv]
status: new
related: []
---

## 日本語要約

FlagRot は 32-channel ごとに「回転 or 素」を calibrated attention error で選ぶ 2-bit KV 量子化手法。回転は常に善ではなく、尖った piece を平らにする一方で、平らな piece に新たな peak を与える。クエリ側を読み取り時に回転させる。per-channel cache (KIVI) は head 単位で決定でき追加書き込みコスト 0, per-token cache は既存 sign bit に選択を格納。2.5bpv で KIVI の 12-model KL を 18.7→12.4e-3 (RotateKV 以下 9/12)、vLLM plugin で RULER@128k +2.9pt, LongBench v1 mean +0.4〜+1.9pt。

## 手法

各 32-channel piece に 2 択 (rotated / identity) を与え、calibrated attention error が小さい方を採用。per-channel cache は head 単位、per-token cache は token 単位で選択。読み取り時はクエリを対応する回転で処理。

## 評価

- モデル: Llama-3.1, Qwen3 系 12 モデル
- ビット幅: 2bit / 2.5bit / 4bit INT, FP4
- 精度: KIVI 2.5bpv で KL 18.7→12.4 (-34%), RotateKV < on 9/12
- 実装: vLLM plugin, RULER@128k +2.9pt

## 注目度コメント

kv-cache-quant focus + vLLM 接続 — 「回転は常に正しい」通念を覆す重要知見。vllm-ready として扱える。
