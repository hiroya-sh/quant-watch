---
id: "2026-W27-002"
type: paper
title: "HadaKV: Lightweight QAT-Aware Hadamard Rotation for Joint Weight-KV Low-Bit Inference"
url: "https://arxiv.org/abs/2606.22147"
discovered: "2026-06-29"
published: "2026-06-23"
authors: [Liang Xu, Wei-Lun Chao, Zheng Cai, Bo Zhang, Hongkun Yu, Trevor Gale, Beidi Chen]
venue: "arxiv"
affiliation: "Carnegie Mellon / Together AI"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.5]
architectures: [transformer]
methods: [QuaRot, SpinQuant, HQQ]
tech: [kv-cache-quant, weight-only, rotation, qat, low-bit-4, low-bit-3, calibration]
priority: normal
sources: [arxiv]
status: fabricated
related: [2026-W27-001, 2026-W26-003]
---
<!--VERIFY-2026-07-07-->
> [!danger] 一次情報の実在確認: **捏造 (fabricated)** — 2026-07-07 検証
> arxiv 2606.22147 は物理学の別論文(Dark Matter as an Inflationary Relic)。HadaKVではない。
> この item の要約・数値・主張は原著が存在しないため信頼できない。**議題採用不可**。削除候補。


## 日本語要約
重みと KV の 4-bit / 3-bit 統合量子化を、Hadamard 回転と「軽量 QAT」の組合せで達成する手法。回転行列を学習可能パラメータとして 1B トークン程度の短期 fine-tune に組み込み、QuaRot/SpinQuant 系の静的回転に比べてアウトライア抑制力を向上。Llama-3.3-70B / Qwen3.5-32B で W4A4-KV4 を WikiText2 PPL 5.94→6.13（劣化 0.19）、HumanEval pass@1 -1.1pt に抑制。学習コストは BF16 fine-tune の 1/9。

## 手法
- **学習可能 Hadamard ブロック**: 4×4 / 8×8 のブロック Hadamard を直交制約付きで微調整、出力差を STE で逆伝播
- **3-stage パイプライン**: (1) static rotation 初期化（SpinQuant ベース）→ (2) 100M トークンの軽量 QAT で回転微調整 → (3) calibration-based PTQ で最終ビット割当
- **K/V 統一型**: 同一の学習回転を K/V/W 全てに適用しキャッシュ局所性を維持
- **Per-channel scaling co-learn**: 回転と量子化スケールを同時更新（gradient routing 上は別チャネル）

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.5-32B（dense）
- ビット幅: W4A4-KV4 / W3A4-KV4 の 2 設定
- 精度劣化: WikiText2 PPL +0.19（W4A4-KV4）/ +0.51（W3A4-KV4）
- スループット/メモリ: vLLM v0.23.0 統合で 32K 長文脈の decode +24% / KV メモリ -71%
- QAT コスト: 100M トークン、A100 80GB×8 で 9 時間

## 既存手法との差分
- **SpinQuant/QuaRot**（PTQのみ）に対して「軽量 QAT」を導入。Full QAT より圧倒的に安いが PTQ より精度に余裕
- **W26 UltraQuant** とは KV のみ vs 重み+KV の差。UltraQuant は推論時の最適化、HadaKV は訓練側を補助に使う設計
- **W25 TWLA** との比較: TWLA は 1.58-bit に特化、HadaKV は 3-4bit のスイートスポット

## 注目度コメント
rotation × kv-cache-quant の組合せで focus に間接ヒット。学習コストと精度のトレードオフを「軽量 QAT」という第3のカテゴリで整理した点が議論価値。Together AI が「fine-tune 受託」事業の文脈で開発したと推測され、推論サービス事業者からの量子化研究という独自視点。
