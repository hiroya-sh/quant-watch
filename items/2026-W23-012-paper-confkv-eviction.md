---
id: "2026-W23-012"
type: hf-paper
title: "CONF-KV: Confidence-Aware KV Cache Eviction with Mixed-Precision Storage for Long-Horizon LLM"
url: "https://huggingface.co/papers/2605.24786"
arxiv_url: "https://arxiv.org/abs/2605.24786"
discovered: "2026-06-01"
published: "2026-05-24"
authors: [Yubo Li, Yidi Miao]
hf_upvotes: 4
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, kv-cache-eviction, mixed-precision]
priority: normal
sources: [hf-papers, arxiv]
status: new
related: []
---

## 日本語要約
モデルの次トークン予測確信度に基づいてKVキャッシュ予算を動的調整するシステム。確信度が低い（不確実）場合はキャッシュを多く保持し、確信度が高い場合は積極的に削除。トークンをattention質量と再近接性でランク付けし、FP16/INT8混合精度ストレージで容量を最適化。固定スライディングウィンドウと同メモリで、フル KVキャッシュ比perplexity差1.5〜2.1ポイント以内。

## 手法
各トークン生成時にモデルの確信度（予測確率のエントロピー等）を計算し、動的なキャッシュ予算を決定。重要トークンはFP16、それ以外はINT8で保存する2段階混合精度ストレージ。確信度ドリブンな制御ループが既存eviction手法（StreamingLLM等）とは異なる。

## 評価
- 対象モデル: 複数LLM（長文コンテキストベンチマーク）
- ビット幅: FP16/INT8 mixed（KVキャッシュのみ）
- 精度劣化: フルKV比 perplexity +1.5〜2.1ポイント
- スループット/メモリ: 固定スライディングウィンドウと同等メモリ

## HF Papersでの注目度
- upvote数: 4
- コメントの傾向: 初期段階で注目度は低め

## 注目度コメント
kv-cache-quantはfocusのためpriority bumpでnormal。確信度ベースの動的制御は新規アイデアだが、実験規模が限定的で追跡継続推奨。
