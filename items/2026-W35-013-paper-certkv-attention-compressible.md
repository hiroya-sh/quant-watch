---
id: "2026-W35-013"
type: paper
title: "Beyond Sparse Weights: When Is Attention Compressible? (CertKV)"
url: "https://arxiv.org/abs/2608.21541"
discovered: "2026-09-01"
published: "2026-08-21"
venue: "arXiv (cs.LG, cs.CL)"
models: [meta-llama/Llama-3.1]
architectures: [transformer]
methods: []
tech: [kv-cache-eviction, kv-cache-compression-non-quant, long-context-quant]
priority: normal
sources: [arxiv]
status: new
related: []
---
## 日本語要約
KV cache 圧縮は「attention map に少数の大きな重みがある」ことを根拠に正当化されがちだが、これは不完全 — 大きな重みが質量の大半を持つとは限らず、省いた値は相殺しうるし、attention 出力を保存してもタスク性能が保存されるとは限らない。本論文はこれらを分離して扱う。

## 手法
- **閾値の個数ではなく大域的なスコアギャップ**が、目標質量を保つのに必要なトークン数を決めることを示す
- 実現した行について、省略された値の重み付き和が「厳密に欠けている統計量」
- 検索-集約の制御モデルで truncation が効く条件と害になる条件を説明
- これらから **CertKV**: ヘッドごとに tail-summary スロットを1つ確保し、残りを value dispersion で配分する学習不要圧縮器

## 評価
- **LongBench-v2 の9設定中7つで top-2**
- 128K RULER でも先頭圧縮ティアを維持
- packed Llama プロトタイプで **10倍のキャッシュ予算**を実現

## 既存手法との差分
"attention sparsity → 圧縮可能" という前提そのものを解体し、必要な統計量を明示した。

## 注目度コメント
KV 量子化ではないが KV 圧縮の理論整理として質が高い。W36 の SemKV(量子化側の quality cliff)と読み合わせると良い。
