---
id: "2026-W29-007"
type: paper
title: "HiFA4: Training-Free 4-bit FlashAttention on Ascend HIF4 NPUs for LLM Inference"
url: "https://arxiv.org/abs/2607.04302"
discovered: "2026-07-13"
published: "2026-07-05"
authors: [Hui Dong, Yanzhao Li, Jie Gao, Chunlu Li, Zhiyuan Zhang, Yupeng Sun]
venue: "arxiv (cs.LG, cs.AI, cs.AR)"
models: []
architectures: [transformer]
methods: [HiF4]
tech: [activation-quant, low-bit-4, ptq, calibration, per-channel]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認"
related: []
---

## 日本語要約
FlashAttention の QK^T と PV の両 GEMM を Ascend NPU の **HIF4(4bit)Cube GEMM** で実行する training-free のオペレータ設計 HiFA4。online softmax 状態は FP16 で保持。Smooth-QK(RoPE 後の Q/K に校正静的 per-channel 等価リスケール、量子化難度を K→Q へ移転)と P-Reordering(PV GEMM と同じ量子化済み P̂ から softmax 正規化子を蓄積)の2機構。Ascend-HIF4 対象では初の設計と主張。

## 注目ポイント
- attention 計算自体の 4bit 化(KV cache 保存ではなく計算パス)
- HiF4 フォーマット(taxonomy 登録済み)の Ascend 実装系

## 注目度コメント
NVIDIA 外のハード(Ascend)での低ビット attention 実装として記録。優先度 normal。
