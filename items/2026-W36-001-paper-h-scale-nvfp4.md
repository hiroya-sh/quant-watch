---
id: "2026-W36-001"
type: paper
title: "H-Scale: Hessian-Guided Scale Refinement for NVFP4 Sub-Byte LLM Inference"
url: "https://arxiv.org/abs/2608.28113"
discovered: "2026-09-01"
published: "2026-08-28"
venue: "arXiv (cs.CL)"
models: []
architectures: [transformer]
methods: [NVFP4, H-Scale]
tech: [weight-only, ptq, low-bit-fp4, microscaling-formats, block-wise, outlier-handling]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
NVIDIA Blackwell の NVFP4 ネイティブ対応は LLM 推論加速の新しい機会を開くが、**group size 16 という極細粒度のマイクロブロック設計**は、局所的な重み分布の捕捉と外れ値の隔離に強い表現柔軟性を与える一方で、**per-group scaling factor の巨大で極めて感度の高い探索空間**を生む。既存 PTQ は量子化「値」の refinement に集中しており、この scale 選択の段階は未開拓のままだった。

## 手法
**H-Scale** — NVFP4 の per-group scale を後処理で refine する軽量手法。素朴な重み再構成誤差の最小化ではなく、**対角二次近似(Hessian の対角プロキシ)由来の基準でハードウェア上有効な group scale を選ぶ**。

## 評価
- 対象: NVFP4 (group size 16) の weight-only PTQ
- 位置づけ: 既存 PTQ の後処理として上乗せ可能

## 既存手法との差分
量子化値ではなく **scale 側**を二次情報で選ぶ点。従来の GPTQ / AWQ 系は値の丸めを最適化していた。

## 注目度コメント
focus method **NVFP4 に直撃**。同じ週の ModelOpt 0.46.0 が「local_hessian NVFP4 weight-scale 探索の Triton fast path(参照比34倍)」と「NVFP4 4/6 レンジ選択」を実装しており、**論文と実装が同時期に同じ場所を攻めている**。ModelOpt の `local_hessian` 校正で近い効果が既に得られる可能性があり、比較実験の価値が高い。**強推し議題候補**。
