---
id: "2026-W46-038"
type: github
subtype: library
title: "ggml-org/llama.cpp: v0.9.0 (incl. b12034-b12207)"
url: "https://github.com/ggml-org/llama.cpp/releases/tag/v0.9.0"
discovered: "2026-11-09"
published: "2026-11-04"
repo: "ggml-org/llama.cpp"
release_tag: "v0.9.0"
models: ["google/gemma-4", "mistralai/Mistral", "nvidia/Nemotron"]
architectures: ["transformer", "hybrid", "mamba2"]
methods: ["GGUF", "NVFP4", "MXFP4"]
tech: ["low-bit-fp8", "hif8", "low-bit-fp4", "rotation", "kv-cache-quant", "weight-only", "llamacpp-ready"]
priority: high
sources: [github]
status: new
related: []
---

## 日本語要約

llama.cpp v0.9.0 (本週は b12034-b12207 の 104 nightly build + semver v0.9.0 の両立) の最大の成果は **OCP FP8 E4M3 量子化タイプの追加 (#27512)**、**flash_attn_ext_rows で multi-seq unified KV の prefill 復活 (#29510)**、**ggml v0.29.0 への更新 (FP8 E4M3 + NCCL multi-node TP + 各バックエンドの性能作業)**。**gemma4 グラフ最適化で E2B/E4B の prefill が大幅高速化 (#31356)**、**LFM3 NVFP4 GGUF を有効化 (#31608)** で HF の `BennyDaBall/LFM3-1.7B-NVFP4-GGUF` 配布と呼応。**kv-cache の Hadamard rotation 定数を GPU 常駐化 (#31073)** は W45 からの rotation 系の下地整備。NCCL 多ノード TP の初版 (#28967)、Hexagon LIGHTNING_INDEXER (#31289)、Vulkan NVFP4 UE4M3 scale lookup OOB 修正 (#31079) など全バックエンドで低ビット FP の整備が進む。

## 量子化関連の変更点

- **Quant: OCP FP8 E4M3 tensor type (saturating) + ftype `LLAMA_FTYPE_MOSTLY_F8_E4M3` (#27512)** — 新たな FP8 標準対応。
- **ggml v0.29.0: OCP FP8 E4M3 tensor type + CUDA fused MoE MMQ + Metal MXFP4 mat-vec 高速化 + Vulkan split-K tuning + OpenCL の量子化 GEMM/GEMV 対応拡大**。
- **flash_attn_ext_rows (#29510)**: query ごとに自分の K/V 行だけ attend する op、unified KV cache の multi-seq prefill 効率回復。
- **kv-cache: Hadamard rotation 定数を GPU 常駐化 (#31073)** + **shared-KV 層での attention tensor 回転 (#31406)**。
- **LFM3: NVFP4 GGUF を有効化 (#31608)** + tensor split 対応 (#31431) + audio codec decoder 量子化 (#31386)。
- **gemma4: グラフ最適化で E2B/E4B の prefill 大幅高速化 (#31356)** + token_embd を tied output 前に生成 (#31394) + Gemma4 MTP assistant が ctx_other のデバイス / FlashAttn 設定を継承 (#31635)。
- **Vulkan NVFP4 UE4M3 scale lookup OOB 修正 (#31079)** — 以前のビルドで正しくない可能性。
- OpenCL: iq1/iq3/iq4_xs/q2_0 の初期サポート (#31341, #31338, #31339, #31340)。
- Hexagon: LIGHTNING_INDEXER (#31289) + TOP_K_MASK (#31552) + DSV4_HC_PRE/POST (#30953)。
- **NCCL 多ノード tensor parallelism の初期実装 (#28967)**。
- `-hf` tag matching で長い quant 名との衝突を修正 (#31620) — Q4_K_M などの混乱防止。
- `gguf-py` の `np_roundf` が負値で符号を落とすバグ修正 (#31310)。
- `imatrix --nextn` クラッシュ修正 (#31522)。

## 影響範囲

- 新モデル: Clover-35B-A3B-Preview (diffusion AR mode, #31306)、Limite 1B Violetto (#29433)、Metis-1.6 Praxis/Logos (hybrid Mamba-2 + GQA + LatentMoE, #31134)、Mistral Large 4 (#31376)。
- 多モーダル: Chatterbox TTS (#30993), Nemotron 3.5 Transcribe (#31471), Pocket TTS predefined voices, Qwen3-VL video 正式対応 (#31619)。
- gemma4 画像 letterbox 削除 (#30922) + Gemma 4 を `test-llama-archs` 追加 (#31401)。
- ROCm: RDNA4_M family for gfx1170/gfx1171 (#31373)。

## 注目度コメント

**gemma-4 focus 直接関与 (3 件)** — graph 最適化、token_embd 順序修正、MTP assistant の設定継承。**OCP FP8 E4M3** は llama.cpp が業界標準 FP8 に乗ることを意味し、量子化フォーマットの整備が一段進む。**LFM3 NVFP4 GGUF は HF 側の BennyDaBall 配布と連動し、"NVFP4 GGUF 配布リードタイムゼロ" が LFM3 系でも成立**。TurboQuant / PolarQuant / QJL は本文言及ゼロ。
