---
id: "2026-W22-021"
type: paper
title: "Runtime-Certified Bounded-Error Quantized Attention"
url: "https://arxiv.org/abs/2605.20868"
discovered: "2026-05-20"
published: "2026-05-20"
authors: [Dean Calver]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-4, mixed-precision, per-token, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: ["2026-W22-001", "2026-W22-003"]
---

## 日本語要約

GPU上にINT8キーとINT4バリューのKVキャッシュを保持し、長コンテキスト向けにFP16をシステムRAMに待避させる階層型KVキャッシュ設計。誤差分解によりヘッド・ステップ単位のAttention分布歪みに対する上限を理論証明し、適応精度選択とフォールバック機構を実装。フォールバック時は完全密行列Attentionに回帰することで精度を保証。

## 手法

- 階層型KVキャッシュ: GPU (INT8 Key + INT4 Value) / システムRAM (FP16)
- Error decomposition: per-head, per-step のAttention分布歪みを理論上限で証明
- 適応精度選択: 誤差上限に基づきKVキャッシュ精度を動的決定
- フォールバック保証: 量子化誤差が閾値超過時は密行列Attentionに自動切替

## 評価

- 対象モデル: 長コンテキストLLM
- ビット幅: KV = INT8 (Key)、INT4 (Value)、FP16 (システムRAM)
- 精度劣化: 理論的にバウンド保証
- スループット: GPU VRAM削減と推論継続性を両立

## 既存手法との差分

既存の量子化KVキャッシュ手法が経験的に精度を評価するのに対し、本手法は量子化誤差の理論上限を証明してランタイム保証を与える。
