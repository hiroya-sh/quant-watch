---
id: "2026-W29-021"
type: hf-paper
title: "OrbitQuant: Data-Agnostic Quantization for Image and Video Diffusion Transformers"
url: "https://arxiv.org/abs/2607.02461"
discovered: "2026-07-13"
published: "2026-07-02"
authors: [Donghyun Lee, Jitesh Chavan, Duy Nguyen, Sam Huang, Liming Jiang, Priyadarshini Panda]
venue: "arxiv / HF Papers 2026-07-06 (39 upvotes)"
models: []
architectures: [transformer]
methods: []
tech: [ptq, calibration-free, rotation, full-quant, diffusion-llm-quant]
priority: normal
sources: [hf-papers, arxiv]
status: new
verified: "2026-07-13 arXiv API で ID/タイトル/著者/abstract 取得・実在確認、HF daily_papers 掲載確認"
related: []
---

## 日本語要約
画像/動画 DiT の weight-activation 量子化を **data-agnostic(校正データ不要)**に行う OrbitQuant。DiT の activation は timestep・プロンプト・guidance 分岐で変動し、既存 PTQ はチェックポイント毎に再校正が必要という問題に対し、randomized permuted block-Hadamard (RPBH) 回転で正規化・回転された基底で量子化することで range 推定自体を回避。

## 注目ポイント
- calibration-free × rotation は LLM 側(QuaRot 系)の発想の DiT 展開
- HF Papers 39 upvotes、KronQ と同じ Yale Panda グループ

## 注目度コメント
校正不要化は運用コスト面で重要な方向。優先度 normal。
