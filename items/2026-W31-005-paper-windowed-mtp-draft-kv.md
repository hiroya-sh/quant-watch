---
id: "2026-W31-005"
type: paper
title: "Windowed-MTP: Removing the Full-Context Draft-KV Tax at Million-Token Context"
url: "https://arxiv.org/abs/2607.21535"
discovered: "2026-07-27"
published: "2026-07-23"
authors: []
venue: "arXiv (cs.LG, cs.CL, cs.PF)"
models: []
architectures: [hybrid, mamba2, linear-attention, moe]
methods: []
tech: [speculative-decoding]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
100万トークン文脈では、モデル内蔵の MTP/NEXTN draft head が毎 draft ステップで全 KV cache に full attention をかけるため、draft コストが文脈長に比例して支配的になる(「draft-KV 税」)。特に hybrid/linear-attention ターゲットでは verify が安い分 draft の full-attention 読み出しが露呈する。draft の attention だけに StreamingLLM 式の sliding window + attention sink を適用する Windowed-MTP を提案。verify は full attention のままなので構成上 lossless。

## 手法
training-free・drop-in。draft の KV working set を定数に固定し、1M 文脈で KV エントリの約99%を draft から外す。未読の draft KV(全 KV の 7.7-11%)はリングバッファで回収。

## 評価
- 対象モデル: Qwen GDN-MoE 35B/122B、Mamba2-hybrid NoPE 120B(1M 文脈、単一 GPU、SGLang 上)
- ビット幅: (量子化ではない)
- 精度劣化: なし(受理判定は full-attention target が行うため出力分布保存)
- スループット/メモリ: per-decode-step コスト +28%〜+44% 改善、文脈長とともにマージン拡大

## 既存手法との差分
speculative decoding の高速化研究が draft の質(受理率)に集中する中、「draft の KV 読み出しコスト」自体をボトルネックとして特定し攻めた点。

## 注目度コメント
hybrid/linear-attention + 長文脈 + SGLang 実測という、監視対象アーキテクチャと実装エンジンが揃った実用的研究。エンジン本体への統合が出たら格上げ。
