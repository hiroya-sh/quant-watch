---
id: "2026-W26-014"
type: paper
title: "Nemotron 3 Ultra: Open, Efficient Mixture-of-Experts Hybrid Mamba-Transformer Model for Agentic Reasoning"
url: "https://arxiv.org/abs/2606.15007"
discovered: "2026-06-22"
published: "2026-06-14"
authors: []
venue: "arxiv / HF Papers"
affiliation: "NVIDIA"
models: [nvidia/Nemotron]
architectures: [transformer, moe, hybrid, mamba2]
methods: [NVFP4]
tech: [moe-quant, low-bit-fp8, low-bit-fp4]
priority: watching
sources: [hf-papers]
hf_papers_date: "2026-06-16"
hf_papers_upvotes: 15
status: new
related: []
---

## 日本語要約
NVIDIA Nemotron 3 Ultra（550B A55B、MoE Mamba-Transformer Hybrid）の技術報告論文。W25でnvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-NVFP4が収集済みで、本論文はその元となるモデルアーキテクチャの技術詳細。Mamba2（state-space-model）とTransformerを交互に配置するハイブリッドアーキテクチャ、MoE構成（55B active）、エージェント推論に特化した訓練手順などを解説。NVFP4量子化済みチェックポイントがNVIDIA公式から提供。HF Papers 15 upvotes（2026-06-16）。

## アーキテクチャ特徴
- **Hybrid Mamba-Transformer MoE**: Mamba2（SSM）とSelf-Attentionを交互配置、エキスパートはMoEで分散
- **規模**: 550B総パラメータ、55B活性化パラメータ
- **長文脈**: 長大コンテキスト推論対応
- **量子化**: NVFP4（重み・活性化）でnvidia公式提供済み（W25で収集）

## 注目度コメント
量子化論文としては量子化詳細なし（architectureペーパー）のためwatching。hybrid + mamba2 + moeの組み合わせに対するNVFP4量子化の詳細はW25のモデルページが情報源。NVFP4 + Hybrid + MoEの組み合わせとして量子化エコシステムの参照点として記録。
