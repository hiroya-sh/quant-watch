---
id: "2026-W27-004"
type: paper
title: "Smaller Models, Unexpected Costs: Trade-offs in LLM Quantization for Automated Program Repair"
url: "https://arxiv.org/abs/2606.27205"
discovered: "2026-07-07"
published: "2026-06-25"
authors: [Fernando Vallecillos-Ruiz, Giordano d'Aloisio, Max Hort, Luca Traini, Antinisca Di Marco, Leon Moonen]
venue: "arxiv (ICSME 2026)"
affiliation: "（要確認）"
models: []
architectures: [transformer]
methods: []
tech: [ptq, kv-cache-quant]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-07 arxiv abs 実在確認・abstract読了 (v1 06-25 / v2 07-03)"
related: []
---

## 日本語要約
自動プログラム修復(APR)における LLM 量子化のトレードオフを実証的に分析。ビット幅・手法・対象(weights と KV-cache)にわたる 13 構成を 6 つの LLM で比較し、HumanEval-Java / Defects4J で評価。（論文主張）ベースと量子化モデルは修復できる問題集合がほぼ重ならないが件数は同等、量子化はメモリを最大 85% 削減する一方で推論時間・エネルギーは増加（ハードウェア利用の非最適が原因と推定）、Pareto 分析で 48% の構成が厳密に劣位。

## 注目度コメント
新手法ではなく応用ドメイン(APR)での量子化評価研究。「小さくすれば速い/省エネ」という直感への反例として有用。focus 直撃ではないが評価軸の参考。
