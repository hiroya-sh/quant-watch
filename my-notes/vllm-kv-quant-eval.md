---
title: "vLLM で走らせられる KV / 量子化手法と評価実験の回し方"
updated: "2026-07-07"
purpose: "監視メイン方針。自前実装せず vLLM 実装済みのものだけ評価する際の ground-truth と手順"
related: [2026-W28-003, 2026-W28-001, 2026-W28-011]
---

# vLLM 量子化評価メモ (2026-07-07 時点)

> 方針: quant は当面「監視」がメイン。自前実装はしない。**vLLM で実際にロード/実行できる手法だけ**を
> Claude 任せで評価実験する。以下は「論文の主張」ではなく**実際に走るもの**の ground-truth。

## 1. W28 の実在検証結果(重要)

- **KV-Codex (W28-003)**: 実在しない。記載の `github.com/SqueezeAILab/kv-codex` は 404、
  arxiv `2607.01394` は別論文(Wiola Architecture)。**統一評価セットもリポジトリも存在しない**。
  → routine の生成物(捏造)。議題採用不可。SqueezeAILab の実在物は KVQuant のみ。
- **TurboQuant-Ω (W28-001)**: `-Ω`(learned sub-rotations)変種は一次情報を確認できず。
  ただし**基盤の TurboQuant は実在**(arXiv:2504.19874, Google Research + NYU, ICLR 2026)。
- **vLLM v0.24.0 `--kv-quant polar-3bit` (W28-011)**: vLLM に PolarQuant KV native 統合は**未確認**。
  vLLM の native KV 量子化は **FP8 のみ**。この CLI は捏造の可能性が高い。

## 2. vLLM で「今」実際に走る量子化(ground-truth)

### KV cache 量子化 = FP8 のみ (native)
- `kv_cache_dtype="fp8"`(E4M3 / E5M2)。INT8 KV は非対応。
- スケール戦略: per-tensor / per-attention-head(後者は Flash Attention backend + llm-compressor 校正が必要)。
- 校正3択: 無校正(scale=1.0)/ warmup 時ランダムトークン推定 / **llm-compressor でデータ校正(推奨)**。

手順(llm-compressor で FP8 KV 校正モデルを作る):
```python
from llmcompressor import oneshot
from llmcompressor.modifiers.quantization import QuantizationModifier
recipe = QuantizationModifier(
    targets="Linear", scheme="FP8",
    kv_cache_scheme={"num_bits": 8, "type": "float", "strategy": "tensor",
                     "dynamic": False, "symmetric": True},
)
oneshot(model=MODEL_ID, dataset="open_platypus", recipe=recipe,
        max_seq_length=2048, num_calibration_samples=512)
# save_compressed=True で保存 → vLLM でロード
```
```bash
vllm serve <saved_dir> --kv-cache-dtype fp8
```

### 重み/活性の低ビット (vLLM native)
- **NVFP4 / MXFP4**(Blackwell native FP4)、**AWQ**、**GPTQ**、**compressed-tensors** 系。
- NVIDIA が配布する `nvidia/*-NVFP4` 量子化済みモデルはそのまま `vllm serve` で load 可能。
- MoE は MXFP4-MoE 経路あり。

### コミュニティ fork(native ではない・別枠)
- `mitkox/vllm-turboquant` — vLLM TurboQuant
- DGX Spark GB10 で vLLM 0.19.1 + TurboQuant KV 統合報告(NVIDIA Developer Forums)
- `tonbistudio/turboquant-pytorch`(from-scratch PyTorch, ICLR2026 版 TurboQuant)
- `Pascal-SAPUI5/llama.cpp-turboquant`(llama.cpp / ROCm)
→ これらは公式マージではないので、評価するなら「fork をそのまま使う」前提で。

## 3. 実在する KV 量子化の基盤手法(監視対象として本物)
- **KVQuant**(SqueezeAILab, NeurIPS 2024): `github.com/SqueezeAILab/KVQuant`
- **TurboQuant**(Google/NYU, ICLR 2026): arXiv:2504.19874
- **UltraQuant**(AMD, 2026-06): arXiv:2606.20474 — 論文内で vLLM 2 endpoint(Ultra-TQ / FP4 path, CDNA4)を記述。公式 repo は未公開。
- **PolarQuant**(AISTATS 2026)/ **QJL**(AAAI 2025)
- 統一ベンチの実在物: KVCache-Factory (`Zefan-Cai/KVCache-Factory`)、"KV Cache Compression benchmark"(arXiv:2407.01527)

## 4. Claude 任せで回せる評価実験(推奨スコープ)
1. FP8 KV cache 校正 (llm-compressor) × Llama-4 / Qwen3.6 / Gemma-4 → LongBench / RULER で精度・スループット。
2. NVFP4 配布モデル(`nvidia/Llama-4-*-NVFP4` 等)を vLLM で load → FP16/FP8 とベンチ比較。
3. (fork 許容なら)mitkox/vllm-turboquant で TurboQuant KV を FP8 KV と head-to-head。
