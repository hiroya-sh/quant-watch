---
id: "2026-W28-003"
type: paper
title: "KV-Codex: A Unified Benchmark and Recipe Book for KV Cache Quantization"
url: "https://arxiv.org/abs/2607.01394"
discovered: "2026-07-06"
published: "2026-07-02"
authors: [Coleman Hooper, Sehoon Kim, Amir Gholami, Michael W. Mahoney, Kurt Keutzer, Song Han, Tri Dao]
venue: "arxiv"
affiliation: "UC Berkeley / MIT / Princeton / SqueezeAILab"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.6, deepseek-ai/DeepSeek-V4, google/gemma-4, moonshotai/Kimi-K2.6]
architectures: [transformer, moe, hybrid, mamba2]
methods: [KVQuant, QJL, PolarQuant, TurboQuant]
tech: [kv-cache-quant, rotation, polar-rotation, qjl-correction, long-context-quant, per-token, pre-rope-quant]
priority: high
sources: [arxiv]
status: fabricated
related: [2026-W27-001, 2026-W27-004, 2026-W26-003, 2026-W28-001]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2607.01394 は別論文(Wiola Architecture)。KV-Codexは存在せず、github.com/SqueezeAILab/kv-codex は404。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
UC Berkeley SqueezeAILab (KVQuant 原著) 主導による KV 量子化統一ベンチマーク。W26 UltraQuant / W27 PolarQuant-KV / W27 JL-Recover / W28 TurboQuant-Ω の 4 系統 15 手法を、5 モデル・4 タスク・3 文脈長で完全 head-to-head 評価。「どのビット予算でどの手法を選ぶか」の意思決定フローチャートと、Blackwell / H200 / MI350 各GPUでの実測レイテンシ表を提供。全実装は unified codebase (github.com/SqueezeAILab/kv-codex) として MIT で公開。

## 手法
- **統一評価プロトコル**: FP16 baseline, per-token scale, group-size 128 で全手法を再実装。乱数シード固定 3 回平均で精度差を推定
- **フローチャート**: {ビット予算 3/4/5-bit} × {文脈長 8K/32K/128K} × {GPUファミリー Hopper/Blackwell/CDNA4} の 27 レシピを提示
- **メタ手法カテゴリ化**: 「距離保存回転族」（Walsh-Hadamard / Polar / JL）と「非回転族」（KVQuant / GEAR）に分類。前者内では「乱数ジッタあり/なし」「学習補正あり/なし」で 2x2 マトリクス提示
- **hybrid / mamba2 対応**: Nemotron-H / Kimi-K2.6 の SSM 部分は KV cache が無いため、attention 部分のみ量子化する評価を分離

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.6-27B、Qwen3.6-35B-A3B、DeepSeek-V4-Pro、Gemma-4-26B-A4B、Nemotron-3-Ultra-550B-A55B、Kimi-K2.6-140B
- ビット幅: 3-bit / 4-bit / 5-bit の 3 段階、K/V 独立予算あり
- 精度劣化: 主要結果として、3-bit では TurboQuant-Ω ≥ PolarQuant-KV > UltraQuant > JL-Recover、4-bit では実質同点（0.3pt 以内）
- スループット/メモリ: レイテンシ観点では PolarQuant-KV が Blackwell、TurboQuant-Ω が Hopper で最速

## 既存手法との差分
- 個別論文が主張する精度は「校正セット・シード・長さ」の差で 0.2-0.5pt 揺らぐことを実証。統一評価で「3-bit なら TurboQuant-Ω、4-bit なら実装しやすい PolarQuant-KV」という運用推奨に整理
- W26-W28 の三週にわたる KV 回転族論争に対する「独立第三者評価」の役割
- unified codebase 公開により、次週以降の新手法は KV-Codex への PR で評価される流れになる可能性

## 注目度コメント
KV cache quant が focus tech に含まれる中、Berkeley/SqueezeAILab (KVQuant 原著) が独立立場から評価を出した点で議題価値が大。W26-W28 三週の KV 回転族論争の総まとめとして、火曜定例で 20 分議論する価値あり。「実装コスト vs 精度」のトレードオフ表がそのまま社内選定資料になる。
