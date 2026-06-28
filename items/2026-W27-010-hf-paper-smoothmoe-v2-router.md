---
id: "2026-W27-010"
type: hf-paper
title: "SmoothMoE V2: Router-Aware Activation Smoothing for Sparse Mixture-of-Experts Quantization"
url: "https://huggingface.co/papers/2606.27091"
arxiv_url: "https://arxiv.org/abs/2606.27091"
discovered: "2026-06-29"
published: "2026-06-27"
authors: [Cong Guo, Yiwen Zhu, Chen Zhang, Eric Xing, Zhenghua Wang]
hf_upvotes: 47
hf_papers_date: "2026-06-27"
venue: "arxiv / HF Papers"
affiliation: "MBZUAI / Tsinghua"
models: [deepseek-ai/DeepSeek-V4, Qwen/Qwen3.5, moonshotai/Kimi-K2.6]
architectures: [transformer, moe]
methods: [SmoothQuant, AWQ]
tech: [moe-quant, activation-quant, calibration, per-channel, ptq]
priority: normal
sources: [hf-papers, arxiv]
status: new
related: [2026-W26-001, 2026-W27-005]
---

## 日本語要約
SmoothQuant の MoE 拡張第 2 弾。ルーター層出力（gating scores）の分布特性に基づき、エキスパート別の smoothing factor を動的調整する。固定 smoothing が共有 backbone 想定だった V1 に対し、V2 はルーター→エキスパート間の活性化アウトライアをエキスパート単位で平準化。DeepSeek-V4 / Qwen3.5 MoE / Kimi-K2.6 で W4A4 を MMLU -1.2pt（V1: -2.4pt）に改善。

## 手法
- **Router-aware smoothing α**: 各エキスパート入力分布のアウトライア比率からエキスパート別 α を導出
- **Calibration token routing trace**: calibration 中のルーター出力を保持し、エキスパート別統計を構築
- **Active-only smoothing application**: backward は active expert のみ更新

## 評価
- 対象モデル: DeepSeek-V4-Pro、Qwen3.5-32B-A3B、Kimi-K2.6-32B
- ビット幅: W4A4
- 精度劣化: MMLU -1.2pt（SmoothQuant-V1 -2.4pt、AWQ -1.8pt）
- スループット: vLLM v0.23.1 で +12%

## HF Papersでの注目度
- upvote 数: 47
- コメント傾向: 「MoE の SmoothQuant 系統が再ブームの兆し」「W27 DeltaQuant との組合せ実験を見たい」

## 注目度コメント
moe-quant が focus 直接ヒット。古典 SmoothQuant 系の MoE 派生が継続している点で taxonomy 拡張の参照点。W27 DeltaQuant / MXFP6-MoE / SmoothMoE-V2 と MoE 量子化が 3 本同週で活性化。
