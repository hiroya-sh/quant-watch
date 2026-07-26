---
id: "2026-W31-008"
type: paper
title: "HeadCast: Casting Attention Heads for Efficient Autoregressive Video Generation"
url: "https://arxiv.org/abs/2607.20125"
discovered: "2026-07-27"
published: "2026-07-22"
authors: []
venue: "arXiv (cs.CV, cs.LG)"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-compression-non-quant, sparse-attention]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-27 arXiv API 直取得(ID/タイトル一致確認済み)。コード https://github.com/sjlgaga/HeadCast も 200 確認"
related: []
---

## 日本語要約
自己回帰ビデオ拡散モデルの伸び続ける KV cache に対する training-free の高速化フレームワーク。事前学習済みモデルの attention head が安定かつ異質な挙動を示す観察に基づき、最大ノイズステップで一度だけ全 head を Sink / Dummy / Spatial / Global の4アーキタイプに分類し、モノリシックな KV cache を head 別経路に再構成。長距離時間一貫性を守る Global head は保持するため、粗い eviction が起こすフレーム間フリッカを回避。

## 手法
短い warm-up 後の one-time head 分類 + head 別 KV 経路化。Spatial 経路は固定サイズグリッドで動くため、解像度が上がるほど削減が効く。

## 評価
- 対象モデル: SOTA の AR ビデオ生成モデル群
- ビット幅: (量子化ではない)
- 精度劣化: VBench 品質は full attention 同等、フリッカほぼなし
- スループット/メモリ: 720P で最大 1.62x、1080P で 1.95x 高速化

## 既存手法との差分
一様な eviction/再学習に代わり「head の役割分類」で KV を構造化する点。LLM 側の retrieval head 研究のビデオ版に相当。

## 注目度コメント
ビデオ生成の KV cache 問題は高解像度化で深刻化しており、head 役割ベースの KV 削減は LLM の KV 圧縮設計にも輸入可能な発想。
