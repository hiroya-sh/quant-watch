---
id: "2026-W22-005"
type: hf-paper
title: "OCTOPUS: Optimized KV Cache for Transformers via Octahedral Parametrization Under optimal Squared error quantization"
url: "https://huggingface.co/papers/2605.21226"
arxiv_url: "https://arxiv.org/abs/2605.21226"
discovered: "2026-05-21"
published: "2026-05-21"
authors: []
hf_upvotes: 9
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, rotation, low-bit-2, kv-cache-compression-non-quant]
priority: high
sources: [hf-papers, arxiv]
status: new
related: ["2026-W22-001", "2026-W22-003", "2026-W22-013"]
---

## 日本語要約

KVキャッシュの量子化にOctahedral Parametrizationを導入。KVベクトルを座標3要素組（トリプレット）としてOctahedron面にマッピングし、方向と大きさを分離してLloyd-Max量子化。TurboQuant・PolarQuant（いずれもHiroyaのfocusメソッド）を全報告ビット幅で上回ると主張。テキスト・動画・音声モデルに対応。オンライン・決定論的・データ非依存。

## 手法

- Octahedral Parametrization: KVトリプレットをOctahedron（8面体）に射影し方向を2次元正方形にマッピング
- 方向（角度）と大きさ（norm）を独立にLloyd-Max量子化
- オンライン処理（逐次更新）、追加Calibrationなし
- テキスト・動画・音声モデルへ汎用適用

## 評価

- 対象モデル: 各種 LLM（テキスト/動画/音声）
- ビット幅: 各種（全比較ビット幅で測定）
- 精度劣化: TurboQuant, PolarQuant 比で全ビット幅で優位と主張
- スループット/メモリ: 記載なし（品質重視の評価）

## 既存手法との差分

TurboQuant・PolarQuant（回転ベースのKVコーデック）を直接比較して上回る実験結果を示す。Hiroyaのfocusメソッドに直接競合する新手法。

## 注目度コメント

`kv-cache-quant`（focus）＋TurboQuant・PolarQuant（focus methods）を上回ると主張。focus methods の置き換え候補として議論価値が非常に高い。
