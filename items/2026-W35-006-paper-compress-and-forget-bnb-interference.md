---
id: "2026-W35-006"
type: paper
title: "Compress and Forget: bitsandbytes Quantization Amplifies Proactive Interference in LLMs"
url: "https://arxiv.org/abs/2608.18578"
discovered: "2026-09-01"
published: "2026-08-19"
venue: "arXiv (cs.CL, cs.LG)"
models: [Qwen/Qwen2.5, mistralai/Mistral, microsoft/Phi-4-mini]
architectures: [transformer]
methods: [bitsandbytes, NF4]
tech: [weight-only, ptq, low-bit-4, low-bit-fp8]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
Proactive interference (PI) = 「繰り返し上書きされた値の検索が、過去の上書きの蓄積とともに劣化する」LLM の既知の失敗モード(人間のワーキングメモリの古典現象に対応)。PTQ はいまやオープンウェイトの既定デプロイ経路だが、この失敗モードへの影響は検証されていなかった。

## 手法
検索タスクを固定したまま、bitsandbytes 経由で FP16 / INT8 / INT4(NF4) の3精度 × アーキテクチャの異なる3つの instruction-tuned モデル (Qwen2.5-7B-Instruct, Mistral-7B-Instruct-v0.3, Phi-3.5-mini-instruct) を評価。

## 評価
- **INT4 は全モデルで高干渉下の精度を有意に低下**(例: Qwen で 81.0% → 68.3%)
- 対応のある McNemar 検定で $p \le 2.6\times10^{-6}$、全干渉レベルにわたる混合効果回帰でも確認
- INT8 は「安全」と見なされがちだが、本文はそこにも留保をつけている

## 既存手法との差分
平均ベンチマークではなく「干渉下の検索」という特定の失敗モードで量子化の副作用を切り出した点。

## 注目度コメント
「INT4 は平均スコアだと無害に見えるが、特定の能力で壊れる」系の報告が W34 の *Which Decisions Low-Bit Breaks* に続いて連発。**議題候補**。bitsandbytes は W36 で 0.50.2 が出ておりバージョン依存の再検証余地あり。
