---
id: "2026-W36-013"
type: paper
title: "Budget-Aware Compression Pipeline for Single-GPU LLM Inference: Methods, Trade-offs, and Coupling Effects"
url: "https://arxiv.org/abs/2608.30076"
discovered: "2026-09-01"
published: "2026-08-30"
venue: "arXiv (cs.CL)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, weight-only, mixed-precision, low-bit-8]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
70B クラスのモデルを単一 GPU に載せる際の制約はデバイスメモリ・長文脈スループット・統合コストの3軸。本論文は単一 GPU 推論を「予算を意識した設計問題」として定式化し、pruning・量子化・KV cache 圧縮が現実の実行下でどう相互作用するかを調べる。

## 評価(制御された ablation)
- **層単位 pruning は weight quantization を頑健にする**
- **KV cache のスパース化は INT8 KV 量子化と補完的**で、デコード速度を落とさずメモリを削減
- **静的なベクトル量子化器は動的キャッシングと衝突しがち**
- 結果として組み立てたパイプラインで **70B モデルを約 33 GB に圧縮、単一 A40 で 10k トークンプロンプトに対し約 57 tokens/s、絶対精度は所定範囲内**

## 既存手法との差分
組み合わせの「結合効果」を明示的に測って、そこからパイプラインを設計した。

## 注目度コメント
数値が具体的で再現しやすい。「KV スパース化 × INT8 KV 量子化は補完的」は vLLM 上でも試せる組み合わせ。
