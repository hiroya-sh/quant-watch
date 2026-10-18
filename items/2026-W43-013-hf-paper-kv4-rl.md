---
id: "2026-W43-013"
type: hf-paper
title: "KV4-RL: Unlocking Faster Asynchronous Rollouts for RLVR with INT4 KV Cache Quantization"
url: "https://arxiv.org/abs/2610.14448"
hf_url: "https://huggingface.co/papers/2610.14448"
discovered: "2026-10-19"
published: "2026-10-10"
authors: ["Sihwan Park", "Sung-Yub Kim", "Doohyuk Jang"]
venue: "arXiv:2610.14448v1"
models: [Qwen/Qwen3]
architectures: [transformer]
methods: []
tech: [weight-only, calibration, calibration-free, kv-cache-quant, low-bit-4, mixed-precision]
priority: high
sources: [hf-papers, arxiv]
status: new
related: []
---

## 日本語要約
RLVR(Reinforcement Learning with Verifiable Rewards)の非同期ロールアウトで、KV cache 量子化は weight-only / weight-activation 量子化より加速効果が大きいと報告。INT4 KV + attention sink / recent context の INT8 保護(KV4-RL)で、Qwen3-8B-Base GRPO 400 iter にて累積 1.80x ロールアウト加速、BF16 評価者で精度 0.5pt 以内。focus:kv-cache-quant 直撃。

## 手法 / 評価のポイント
- 対象: RLVR(非同期ロールアウト)
- 手法: INT4 KV + attention sink / recent の INT8 保護
- 結果: Qwen3-8B-Base GRPO 400 iter で累積 1.80x roll / 1.27x full iter 加速 / BF16 評価 -0.5pt 以内

## 注目度コメント
KV4-RL: INT4 KV Cache Quant for RLVR async rollouts — focus:kv-cache-quant bump, HF up=36
