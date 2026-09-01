---
id: "2026-W35-016"
type: github
subtype: library
title: "NVIDIA Model Optimizer 0.46.0"
url: "https://github.com/NVIDIA/TensorRT-Model-Optimizer/releases/tag/0.46.0"
discovered: "2026-09-01"
published: "2026-08-19"
repo: "NVIDIA/TensorRT-Model-Optimizer"
release_tag: "0.46.0"
models: [google/gemma-3, nvidia/Nemotron, MiniMaxAI/MiniMax-M3, Qwen/Qwen3.5, deepseek-ai/DeepSeek-V3]
architectures: [transformer, moe]
methods: [NVFP4, MXFP4, AutoRound]
tech: [ptq, qat, mixed-precision, low-bit-fp4, low-bit-fp8, microscaling-formats, rotation, calibration, moe-quant, trtllm-ready]
priority: high
sources: [github]
status: new
related: []
---
## 日本語要約
今回のキャッチアップ期間で **もっとも量子化中身が濃いリリース**。NVFP4 の scale 探索、QAT/QAD への学習可能スケール導入、AutoQuantize のレシピ化、tied-weight 拡散モデルの PTQ、Minitron pruning の hybrid/MLA/latent-MoE 対応が同時に入った。リポジトリ名は **NVIDIA/Model-Optimizer** に改称されている(旧 URL はリダイレクト)。

## 量子化関連の変更点(release body 全文スキャン)
- **NVFP4 Four-Over-Six (4/6) weight quantization** (`mtq.NVFP4_FOUR_OVER_SIX_CFG`): MSE weight calibration がブロックごとに M=6 と M=4 のダイナミックレンジを選び、選択は FP8 per-block scale に畳み込む。`four_over_six: true` で当該 scale を 448 でなく **256** で正規化し M=4 のヘッドルームを確保。**`mtq.quantize` と HF / Megatron export のみ対応、`mtq.compress` は非対応**(per-block の M=4/M=6 選択を保存できないため)。
- **local_hessian NVFP4 weight-scale 探索の fused Triton fast path**: 単一 8192x4096 重みで Python 参照スイープ比 **約34倍**、fp32/fp16 では bit-exact。dense と fused-MoE expert weight の双方で local_hessian 校正時に自動使用。`MODELOPT_NVFP4_TRITON_SWEEP=0` で無効化。
- **LSQ / Dual-LSQ**(Learned Scale Quantization)を quantization-aware distillation に追加。learnable amax、tied-scale / pre-scale オプション、NVFP4 特化レシピ、scale-only training。
- **AutoQuantize のレシピ化**: `RecipeType.AUTO_QUANTIZE` / `AutoQuantizeConfig` を YAML で宣言。候補フォーマット、`effective_bits` 目標、cost model (`active_moe`, 除外パターン)、スコア法を指定。**block-scale を考慮した NVFP4 の effective_bits = 4.5**。モジュール別探索空間 (`module_search_spaces`) も追加。
- **`rotate.mode`** を torch quantizer config に追加。既定 `"rotate"` は従来の rotate-before-quantize、`"rotate_back"` は fake-quant rotate → quantize → rotate-back。
- **`constant_amax`**: quantizer の amax を定数に固定して activation 校正をスキップ。NVFP4 activation では `constant_amax: 2688.0` で `input_scale == 1.0` になる。既存の `use_constant_amax`(448.0 ハードコード、buffer 非登録)と異なり `_amax` buffer に保存されるので export される scaling factor にも反映。
- **dLLM (tied-weight PTQ + HF export)**: DiffusionGemma のようなエンコーダ/デコーダ重み共有の拡散型 LLM に対応。export 時に重複排除して **tied 26B MoE の nvfp4_experts_only で約42%のストレージ削減**、`sync_tied_input_amax` で両側の `input_quantizer.amax` を max-merge。
- **MiniMax-M3 向け mixed MXFP8 + NVFP4**: `examples/minimax_m3/hf_ptq_mixed_mxfp8_nvfp4.py`。MXFP8 の言語モデルベースに MSE 校正した NVFP4 routed experts、expert の input_scale は 1.0 固定。
- **Minitron pruning 拡張**: GatedDeltaNet(線形注意)+ gated attention(Qwen3.5 等)、MLA(DeepSeek)、Latent MoE(Nemotron-3-Super)に対応。ただし hidden_size のみ pruning され、linear-attention head / MLA latent rank / MoE latent dim は pruning されない。
- **VLM 対応**: Qwen3.5-VL / Gemma3-VL の言語モデル部のみ PTQ / 蒸留 / QAD。vision tower は full precision で温存。
- 重要な修正: **既に compress 済み NVFP4 重みの unified HF export が weight_scale を半分サイズの無意味値で書き出すバグ**(`mtq.compress` / `--low_memory_mode`)を修正 — 内部 `_scale` / `_double_scale` buffer がチェックポイントに漏れて **vLLM / TensorRT-LLM PyTorch backend が KeyError で落ちていた**。
- **vLLM 0.24+ 対応**: `FusedMoE` が factory 関数化し expert weight が `RoutedExperts` サブモジュールへ移動したことで `QuantModuleRegistry` が全滅していた問題を修正。レジストリキーが `vllm_FusedMoE` → `vllm_RoutedExperts` に変更され、**古い `modelopt_state` は 0.24+ にそのまま復元できない**。

## focus 突合(release 本文全文検索)
- NVFP4: **該当あり**(上記多数)
- Gemma: 該当あり(DiffusionGemma レシピ、Gemma3-VL の pruning/PTQ/蒸留)
- TurboQuant / PolarQuant / QJL: 本文中に出現なし

## 影響範囲
- 既に ModelOpt で NVFP4 チェックポイントを作っている場合、**compress 済み export のバグ修正は再エクスポート必須級**。
- vLLM 0.24 以降を使うなら `modelopt_state` の作り直しが必要。

## 注目度コメント
NVFP4 の scale 側(4/6 レンジ選択、Hessian ガイド探索)を攻める動きが、同週 arXiv の [[items/2026-W36-001-paper-h-scale-nvfp4|H-Scale]] と完全に並走している。**議題候補**。
