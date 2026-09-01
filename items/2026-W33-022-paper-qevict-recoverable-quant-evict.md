---
id: "2026-W33-022"
type: paper
title: "QEvict: Recoverable Quantized KV Eviction for Attention-Drift-Robust Long-Context Decoding"
url: "https://arxiv.org/abs/2608.05326"
discovered: "2026-08-10"
published: "2026-08-05"
authors: [Ayushman Garg, Akshita Gupta, Shaswata Bhattacharya]
venue: "arXiv"
models: []
architectures: [transformer]
methods: [KVQuant]
tech: [kv-cache-quant, kv-cache-eviction, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
KVキャッシュのメモリ制約下でeviction系はattentionスコアで不要トークンを捨てるが、生成queryの進行でトークン/窓の重要度がドリフトし、後で重要になるトークンを不可逆に捨ててしまう脆さがある。

## 手法
Future Missed MassとGlobal LIRでドリフトを特徴づけ、捨てるのではなく量子化して低精度で保持し必要時に回復可能にする(recoverable quantized eviction)。

## 評価
- 対象モデル: 長文脈LLM
- ビット幅: 量子化KV + eviction回復
- 精度劣化: attentionドリフトに頑健
- スループット/メモリ: KVメモリ削減と精度両立

## 既存手法との差分
不可逆eviction(破棄)を、回復可能な量子化保持に置き換える。

## 注目度コメント
eviction(破棄)と量子化(低精度保持)を統合しドリフト耐性を得る。kv-cache-quant focus。
