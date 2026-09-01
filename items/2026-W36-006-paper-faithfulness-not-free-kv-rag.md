---
id: "2026-W36-006"
type: paper
title: "Faithfulness Is Not Free: Auditing Offline KV-Cache Quantization in Retrieval-Augmented Generation"
url: "https://arxiv.org/abs/2608.30996"
discovered: "2026-09-01"
published: "2026-08-31"
venue: "arXiv (cs.CL)"
models: [Qwen/Qwen2.5]
architectures: [transformer]
methods: []
tech: [kv-cache-quant, low-bit-4, ptq, long-context-quant]
priority: high
sources: [arxiv]
status: new
related: []
---
## 日本語要約
RAG システムは検索した文書の KV cache を事前計算・保存してクエリごとの再エンコードを避けられる。このキャッシュをさらに量子化すればストレージが減るが、**圧縮が faithfulness(応答が検索証拠に接地しているか)を損なうかを問うた研究はこれまでなかった**。faithfulness と accuracy は等価ではない — 与えられた文脈にもはや支持されない「正解」をモデルは出しうる。

## 手法
Qwen2.5-7B-Instruct を INT8 / INT4 量子化下で RGB と HotpotQA で評価。hallucination detector、NLI entailment、LLM judge の3系統で accuracy と faithfulness の両方を測る。

## 評価
- **INT8 は両指標でほぼ無損失**
- **INT4 は accuracy を下げ、さらに重要なことに、事実として正解のままの回答の中でさえ faithfulness 変化の 90% 超が負の方向**

## 既存手法との差分
KV 量子化の評価軸に faithfulness を持ち込んだ。accuracy だけ見ていると見落とす劣化を可視化。

## 注目度コメント
focus tech **kv-cache-quant**。[[items/2026-W36-002-paper-semkv-quality-cliff|SemKV]] の「2.322bit の cliff」と合わせると、**「INT8 KV は安全、INT4 KV は用途を選ぶ」**という運用ラインが立つ。vLLM の `kv_cache_dtype=fp8` を既定にする根拠にもなる。**議題候補**。
