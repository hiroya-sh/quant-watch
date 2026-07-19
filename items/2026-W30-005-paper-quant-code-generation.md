---
id: "2026-W30-005"
type: paper
title: "Quantize with Confidence? An Empirical Study of Quantization for Code Generation"
url: "https://arxiv.org/abs/2607.14181"
discovered: "2026-07-20"
published: "2026-07-15"
authors: []
venue: "arXiv (cs.SE, cs.LG, cs.PL)"
models: [Qwen/Qwen2.5]
architectures: [transformer, dense]
methods: [GPTQ, AWQ, QuIP, bitsandbytes, GGUF]
tech: [ptq, weight-only]
priority: normal
sources: [arxiv]
status: new
verified: "2026-07-20 arXiv API 直取得(ID/タイトル一致確認済み)"
related: []
---

## 日本語要約
コード生成に対する量子化の影響を体系評価した実証研究。GPTQ / AWQ / QuIP# / AQLM / BitsAndBytes / GGUF の6手法を Qwen2.5-Coder と CodeLlama に適用し、多言語ベンチマーク McEval / CoderEval(Python・Java)で機能的正しさ(pass@1)等を測定。Ollama 等ローカル推論でのコードモデル量子化の実態把握を狙う。

## 手法
評価研究。量子化手法×モデルファミリ×言語のマトリクスで pass@1 とコード品質指標を比較。

## 評価
- 対象モデル: Qwen2.5-Coder, CodeLlama
- ビット幅: 手法ごとの標準設定(4bit 中心)
- 精度劣化: 手法・言語による差を定量化
- スループット/メモリ: ローカル配備前提のメモリ削減

## 既存手法との差分
一般ベンチではなくコード生成特化で量子化劣化を横断比較する点。AQLM / QuIP# まで含む網羅性。

## 注目度コメント
コード生成×量子化は実務直結のテーマ。focus 非該当で normal だが、量子化モデルでのコーディング評価の参照データとして有用。
