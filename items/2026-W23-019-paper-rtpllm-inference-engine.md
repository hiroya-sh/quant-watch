---
id: "2026-W23-019"
type: paper
title: "RTP-LLM: High-Performance Alibaba LLM Inference Engine"
url: "https://arxiv.org/abs/2605.29639"
discovered: "2026-06-01"
published: "2026-05-28"
authors: [Boyu Tan, Jiarui Guo, Zongwei Lv, Hanbo Sun, Tong Yang, Kan Liu]
venue: "arXiv"
models: []
architectures:
  - transformer
  - moe
methods: []
tech:
  - kv-cache-quant
  - speculative-decoding
  - paged-attention
  - moe-quant
priority: normal
sources: [arxiv]
status: new
related: []
---

## 日本語要約
Alibaba が本番運用する大規模LLM推論エンジン RTP-LLM の技術報告。Prefill-Decode Disaggregation・階層的KVキャッシュ管理・適応的KVキャッシュ量子化を組み合わせ、8B〜235Bパラメータモデルに対応。モデルロード速度4.7〜6.3倍、量子化推論で P95 TTFT 35〜40%削減、スループット1.9〜3.0倍改善を報告。産業用途での量子化推論の実運用事例として参照価値が高い。

## 手法
- **Prefill-Decode Disaggregation**: Prefillのcompute-bound処理とDecodeのmemory-bound処理を独立サービスに分離
- **階層的KVキャッシュ管理**: GPU→CPU→ディスクの多段キャッシュと量子化を組み合わせたメモリ最適化
- **適応的KVキャッシュ量子化**: 入力特性に応じて動的に量子化精度を調整
- **Speculative Decoding**: 複数アルゴリズムをモジュラーに組み込み
- 8B〜235Bパラメータの幅広いアーキテクチャ（dense/MoE）対応

## 評価
- 対象モデル: 8B〜235Bパラメータ（Alibaba本番ワークロード）
- ビット幅: 適応的（KVキャッシュ量子化）
- 精度劣化: 記載なし（産業用途で許容済み）
- スループット/メモリ: モデルロード4.7〜6.3×、量子化推論TTFT -35〜40%、スループット1.9〜3.0×

## 既存手法との差分
vLLM/SGLang と同様のOSSエンジンと比較し、Prefill-Decode分離を先行導入した点とAriba本番規模での検証データが特徴。KVキャッシュの適応的量子化はvLLMの階層化と類似するが、入力適応型の量子化精度選択が特徴。

## 注目度コメント
新規量子化手法の提案ではなく産業適用事例報告のためNORMAL。ただし kv-cache-quant focus 項目に関連し、本番規模での動作実績は実装参考として価値が高い。
