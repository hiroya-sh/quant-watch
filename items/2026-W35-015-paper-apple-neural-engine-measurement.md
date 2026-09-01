---
id: "2026-W35-015"
type: paper
title: "What actually runs: a measurement study of language model placement and decode speed on the Apple Neural Engine"
url: "https://arxiv.org/abs/2608.22110"
discovered: "2026-09-01"
published: "2026-08-22"
venue: "arXiv (cs.LG, cs.AR, cs.PF)"
models: []
architectures: [transformer]
methods: []
tech: [low-bit-4, ptq]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
「何が言語モデルを Apple Neural Engine (ANE) に載せるのか、そこで何が速さを決めるのか」を3つの計測で答える。(1) 計算内容を固定したまま表現方法を変える 64 形状の LLM プリミティブ行列を掃引し、演算ごとのデバイスサポートを記録。(2) サイズと精度を揃えたモデルを学習し、量子化チェックポイントは fp16 版と構造がバイト同一 — つまり全デプロイ計測が実在の学習済み成果物に対するもの。(3) 推論中に ANE のメモリコントローラのバイトカウンタを読み、「コンパイラが意図したもの」でなく「実際に走ったもの」を確定。

## 評価
- 主要主張はすべて3経路のうち少なくとも2つで裏付け
- 発見: **配置は「何を計算するか」ではなく「どう表現するか」の性質**。fused RMSNorm は完全に ANE 適格だが、算術的に同一の分解形は適格でない

## 既存手法との差分
ベンチマーク数値でなく、ハードウェア側カウンタで「実際の配置」を検証した点。

## 注目度コメント
mlx v0.32.1/v0.32.2 の Metal/NVFP4 最適化と同じ Apple 系。オンデバイス評価をするなら必読の計測方法論。
