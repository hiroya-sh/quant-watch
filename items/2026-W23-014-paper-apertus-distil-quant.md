---
id: "2026-W23-014"
type: paper
title: "Apertus LLM Family Expansion via Distillation and Quantization"
url: "https://arxiv.org/abs/2605.29128"
discovered: "2026-06-01"
published: "2026-05-27"
authors: [Andrei Panferov, Davit Melikidze, Martin Jaggi, Dan Alistarh]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [ptq, weight-only]
priority: watching
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Apertus-v1.1（8B permissiveライセンスモデル）からより小型モデルファミリー（〜4B）を蒸留＋量子化で生成する研究。新規量子化手法の提案ではなく、既存蒸留・量子化技術を組み合わせてモデルファミリーを拡張する実用論文。Dan Alistarh（QuIP等の著者）のグループが関与している点で注目。

## 手法
8BベースモデルからKDにより4Bサイズモデルを生成し、PTQ量子化で各ハードウェア制約向けに最適化。詳細な新規手法要素は論文本文を要確認。

## 評価
- 対象モデル: Apertus-v1.1（8B）→ 小型変種（〜4B）
- ビット幅: 未詳（PTQ適用）
- 精度劣化: 各ハードウェア向けに最適化済み（詳細要確認）

## 既存手法との差分
新規手法提案ではなくモデルファミリー拡張実証。Alistarh グループ（QuIP, QuaRot著者）の実用応用として量子化研究の成熟度を示す。

## 注目度コメント
新規手法なしのためwatching。ただしAlistarh グループのpractical展開として観察価値あり。Apertus自体のPermissiveライセンスも注目点。
