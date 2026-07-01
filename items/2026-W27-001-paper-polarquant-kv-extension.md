---
id: "2026-W27-001"
type: paper
title: "PolarQuant-KV: Spherical Polar Coordinate Quantization for Long-Context KV Caches"
url: "https://arxiv.org/abs/2606.21503"
discovered: "2026-06-29"
published: "2026-06-23"
authors: [Mingyu Tan, Hossein Rastegar, Sumit Vyas, Karthik Murali, Yifan Chen, Adam Wei, Pradeep Dubey, Saurabh Goyal]
venue: "arxiv"
affiliation: "Intel Labs / Cornell / Hugging Face"
models: [meta-llama/Llama-3.3, Qwen/Qwen3.5, deepseek-ai/DeepSeek-V4]
architectures: [transformer]
methods: [PolarQuant, TurboQuant, QJL]
tech: [kv-cache-quant, polar-rotation, low-bit-3, low-bit-fp4, rotation, long-context-quant, per-token]
priority: high
sources: [arxiv]
status: new
related: [2026-W26-003]
---

## 日本語要約
PolarQuant原著（W14）が weight-only に限定していた極座標量子化を KV cache に拡張した直接後継論文。極座標分解（半径 r + 角度θ）でアウトライアが集中する半径方向を高精度に、角度方向を低ビットでブロック共有することで、Walsh-Hadamard 系（TurboQuant/UltraQuant）よりも 1-bit 低いビット予算で同等精度を達成すると主張。3-bit KV で Llama-3.3-70B / Qwen3.5-32B / DeepSeek-V4-Pro の長文脈（128K）推論を ROUGE-L 99.4% 保持、FP16 比 5.2倍のメモリ削減。CUDA カーネルは Hopper・Blackwell・CDNA4 でテンプレート展開。

## 手法
- **球面極座標分解**: KV ベクトルを `(r, θ_1...θ_{d-1})` に変換。半径方向の重みアウトライア集中を per-token FP4 で保存、角度方向は per-block INT3 共有スケール
- **Pre-RoPE polar rotation**: RoPE 適用前に静的な極座標変換を挿入し、QJL 系のような乱数ジッタなしで距離保存性を維持
- **K/V 個別予算**: K は意味的距離感応のため 4-bit、V は線形和の重み因子として 3-bit が最適と報告
- **CDNA4/Blackwell カーネル**: scaled-MFMA / WGMMA で FP4×INT3 混合行列積を 1 step に融合

## 評価
- 対象モデル: Llama-3.3-70B、Qwen3.5-32B、DeepSeek-V4-Pro
- ビット幅: K=4-bit / V=3-bit（実効 3.5-bit/element）
- 精度劣化: 128K LongBench ROUGE-L 99.4% / RULER 98.7% / NIAH 99.1%（FP16 比）
- スループット/メモリ: メモリ 5.2x 削減、prefill 2.1x / decode 1.6x（H100 SXM5、UltraQuant FP4 比 prefill +18%）

## 既存手法との差分
- **W26 UltraQuant** とは「同じ FP4 KV カーネル空間」での競合。UltraQuant が「Walsh-Hadamard + QJL削除」を選んだのに対し、PolarQuant-KV は「極座標変換 + QJL不要」と異なる回転族を選択。距離保存性の理論証明を Walsh-Hadamard より一般化（任意の等角写像で成立）
- **W14 PolarQuant**（weight-only）からの素直な拡張。原著著者は2人重複だが、本論文の主著は Intel Labs 側に移動

## 注目度コメント
PolarQuant・TurboQuant・QJL がすべて focus 手法。W26 UltraQuant が「TurboQuant-style」「QJL削除」を打ち出した直後の同系統論文として議題の中心になり得る。Walsh-Hadamard vs 極座標の選択基準が KV 量子化設計空間の主要分岐になる予感。火曜定例の最強推し候補。
