---
id: "2026-W45-022"
type: github
subtype: library
title: "NVIDIA/Megatron-LM: core_v0.20.0"
url: "https://github.com/NVIDIA/Megatron-LM/releases/tag/core_v0.20.0"
discovered: "2026-11-02"
published: "2026-10-29"
repo: "NVIDIA/Megatron-LM"
release_tag: "core_v0.20.0"
models: []
architectures: ["transformer", "mamba", "linear-attention", "hybrid", "moe", "dense"]
methods: ["NVFP4", "MXFP8", "REAP", "QAD"]
tech: ["mixed-precision"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

**NCCL EP MXFP8 通信 (experimental)**: MXFP8 dispatch-forward / combine-backward を NCCL EP バックエンドに追加 #6524。**MLA / MoE kernel 最適化**: fused MLA Q up-projection + RoPE + **MXFP8 量子化(SM100)** #6213。**DeepSeek V4 を次世代 HybridModel で正式サポート** #6403-#6405/#7469。**Gated Delta Product (GDP) レイヤー追加** #6074。**ShortcutMoE**(ハイブリッド stack で attention/Mamba と expert all-to-all を overlap)#6959。**Megatron-FSDP v2 integration + CUDA graphs** #5865-#7220/#7075。bitwise-deterministic 事前学習(マルチリリース効果)。

## 量子化関連の変更点

- **MoE 通信**: NCCL EP に MXFP8 dispatch-forward + combine-backward(experimental) #6524 — MXFP8 を expert all-to-all に乗せる
- MLA 融合カーネルに **MXFP8 量子化(SM100)** を追加 #6213
- DeepEP v2 dispatcher 追加 #5153、ShortcutMoE で expert all-to-all を attention/Mamba と overlap #6959
- DeepSeek-V4 を HybridModel で正式サポート #6403-6405/#7469
- GDP(Gated Delta Product)レイヤー追加 — ハイブリッド/GLA 系モデル構築 #6074
- MTP 専用学習モード #7021、wide residual streams #6716
- **Megatron-FSDP v2** 統合 #5865-#7220 + CUDA graphs 完全キャプチャ #7075
- bitwise-deterministic 事前学習(blog へ誘導)

## 影響範囲

- 事前学習側の変更が主で、推論側のユーザへの影響は限定的。ただし **MXFP8 全プロセスでの事前学習**(MLA SM100 + NCCL EP MXFP8)の **大規模トレーニング用一次情報**として重要。
- bitwise-deterministic 対応は、量子化前の学習時再現性(scale drift 検証など)の精度評価の基盤。
- Megatron-FSDP v2 対応で、ハイブリッド/GDN モデルの事前学習が一本化。

## リリースノート抜粋

```
#### MoE

* **DeepEP v2 dispatcher:** adds an experimental DeepEP v2 backend for the flex token dispatcher ([\#5153](https://github.com/NVIDIA/Megatron-LM/pull/5153)).  
* **NCCL EP MXFP8 communication (experimental):** adds MXFP8 dispatch-forward and combine-backward communication to the NCCL EP backend ([\#6524](https://github.com/NVIDIA/Megatron-LM/pull/6524)).  
* **NCCL EP eager mode**: now NCCL EP supports both eager mode and full-iteration graph mode ([\#6229](https://github.com/NVIDIA/Megatron-LM/pull/6229)).  
* [**ShortcutMoE**](https://arxiv.org/pdf/2404.05019)**:** adds shortcut-connected routing in HybridStack and overlaps expert all-to-all communication with paired attention or Mamba computation; CUDA graphs are not supported ([\#6959](https://github.com/NVIDIA/Megatron-LM/pull/6959)).

#### Model Architecture and Support

* **DeepSeek V4:** fully supported by the next-gen `HybridModel` class ([\#6403](https://github.com/NVIDIA/Megatron-LM/pull/6403), [\#6404](https://github.com/NVIDIA/Megatron-LM/pull/6404), [\#6405](https://github.com/NVIDIA/Megatron-LM/pull/6405), [\#7469](https://github.com/NVIDIA/Megatron-LM/pull/7469)).  
* **Manifold-constrained hyper-connections (mHC):** adds fused mHC connections to HybridModel, including pipeline and virtual-pipeline parallel support ([\#6401](https://github.com/NVIDIA/Megatron-LM/pull/6401), [\#7336](https://github.com/NVIDIA/Megatron-LM/pull/7336)).  
* **Gated Delta Product (GDP):** adds GDP layers and model-building support for hybrid architectures ([\#6074](https://github.com/NVIDIA/Megatron-LM/pull/6074)).  
* **Wide residual streams:** adds streamwise residual connections, selective residual-stream recomputation, and integration with MTP and MIMO; currently requires PP=1 and CUDA graphs disabled ([\#6716](https://github.com/NVIDIA/Megatron-LM/pull/6716), [\#6805](https://github.com/NVIDIA/Megatron-LM/pull/6805), [\#6855](https://github.com/NVIDIA/Megatron-LM/pull/6855), [\#7440](https://github.com/NVIDIA/Megatron-LM/pull/7440)).  
* **MTP-only training:** adds a mode that freezes the base model and trains only Multi-Token Prediction heads ([\#7021](https://github.com/NVIDIA/Megatron-LM/pull/7021)).

#### Parallelism

* **Megatron-FSDP v2 integration:** adds the experimental Megatron Core adapter and Megatron Bridge, with context, expert, pipeline, and hybrid data-parallel sharding support; the adapter requires TP=1 and expert TP=1 ([\#5865](https://github.com/NVIDIA/Megatron-...
```

## 注目度コメント

**HIGH** — focus method NVFP4 にマッチ。火曜定例の議題候補。
