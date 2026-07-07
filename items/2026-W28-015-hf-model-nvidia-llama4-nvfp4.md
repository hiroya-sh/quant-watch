---
id: "2026-W28-015"
type: hf-model
title: "nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4"
url: "https://huggingface.co/nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4"
discovered: "2026-07-07"
published: "2026-07-04"
base_model: "meta-llama/Llama-4-Scout-17B-16E-Instruct"
models: [meta-llama/Llama-4-Scout, meta-llama/Llama-4]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, moe-quant, weight-only, activation-quant, vllm-ready]
priority: high
sources: [hf-models]
status: verified-minimal
verified: "2026-07-07 nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4 の実在確認。旧URL(Llama-4-405B/70B)は404=非存在(Llama-4に405Bは無い)。ベンチ表・DL数・PolarQuant校正記述は捏造のため削除。"
related: [2026-W27-016]
---

## 日本語要約
NVIDIA 公式による **Llama-4-Scout-17B-16E-Instruct**（MoE, 16 experts）の NVFP4 量子化モデル。**リポジトリ実在確認済み**。旧版にあった「70B / 405B」バリアントは存在しない（Llama-4 に 405B は無い）ため削除。精度表・ダウンロード数・「PolarQuant-KV combined recipe」等の校正記述も捏造のため削除。

## 確認できた事実
- 正しい ID は `nvidia/Llama-4-Scout-17B-16E-Instruct-NVFP4`
- NVFP4 量子化の Llama-4 Scout MoE、focus の NVFP4 + moe-quant に直撃、vllm-ready

## 注目度コメント
NVFP4(focus) × MoE(focus) × vllm-ready。議題候補。精度は公式 model card を参照。
