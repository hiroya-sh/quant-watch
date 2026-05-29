---
id: "2026-W22-006"
type: hf-paper
title: "KVServe: Service-Aware KV Cache Compression for Communication-Efficient Disaggregated LLM Serving"
url: "https://huggingface.co/papers/2605.13734"
arxiv_url: "https://arxiv.org/abs/2605.13734"
discovered: "2026-05-22"
published: "2026-05-22"
authors: []
hf_upvotes: 11
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, mixed-precision, rotation, low-bit-2, low-bit-4, per-channel]
priority: high
sources: [hf-papers]
status: new
related: ["2026-W22-001", "2026-W22-003", "2026-W22-005"]
---

## 日本語要約

Disaggregated LLM Serving（プリフィルとデコードを別ノードで処理する構成）向けの初のサービス認識型適応KVキャッシュ圧縮フレームワーク。量子化（2ビット・4ビット・混合精度）、Hadamard/Affine変換、プルーニングをモジュラーな戦略空間に統合。Bayesian Profiling＋バンディットベースのオンラインコントローラで戦略を動的選択。MixHQ（Mixed-Precision Head-Wise Quantization）を新規提案。9.13×JCT高速化・32.8×TTFT削減を達成。

## 手法

- 戦略空間: 量子化（INT2/INT4/混合）＋変換（Hadamard/Affine）＋プルーニングの組み合わせ
- Bayesian Profiling: サービス特性をプロファイリングして最適戦略を事前特定
- Bandit-based online controller: リクエスト境界で戦略を動的切り替え
- MixHQ: Head単位の混合精度KV量子化（新規）

## 評価

- 対象モデル: 大規模LLM（Disaggregated Serving環境）
- ビット幅: KV = INT2/INT4/混合精度
- 精度劣化: 論文中で品質保証
- スループット: JCT 9.13×向上、TTFT 32.8×削減

## 既存手法との差分

既存のKVキャッシュ圧縮手法は静的な単一戦略を採用するのに対し、KVServeはサービス負荷・レイテンシ要件に応じて戦略を動的に選択する初のシステム。Disaggregated Serving文脈で通信ボトルネックを直接解決。

## 注目度コメント

`kv-cache-quant`（focus）。Disaggregated Servingは産業界で主流になりつつあるため実装参考価値高い。
