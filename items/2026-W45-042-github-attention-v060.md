---
id: "2026-W45-042"
type: github
subtype: library
title: "fla-org/flash-linear-attention: v0.6.0"
url: "https://github.com/fla-org/flash-linear-attention/releases/tag/v0.6.0"
discovered: "2026-11-02"
published: "2026-10-23"
repo: "fla-org/flash-linear-attention"
release_tag: "v0.6.0"
models: []
architectures: ["transformer", "mamba", "mamba2", "linear-attention", "gla", "rwkv"]
methods: ["QuIP"]
tech: []
priority: normal
sources: [github]
status: new
related: []
---

## 日本語要約

fla-org/flash-linear-attention v0.6.0 リリース。詳細はリリースノート抜粋を参照。

## 量子化関連の変更点

(リリースノート抜粋を参照)

## 影響範囲

(リリースノート抜粋を参照)

## リリースノート抜粋

```
## What's Changed
* [Docs] Add fla-ascend-performance agent skill for Ascend NPU profiling and optimization by @sunyi0505 in https://github.com/fla-org/flash-linear-attention/pull/1068
* [Fix] Zero-init Ascend chunk_scaled_dot_kkt output and add solve_tril to CI by @zheliuyu in https://github.com/fla-org/flash-linear-attention/pull/1070
* [Perf] Refactor Ascend KDA WY backward: split dA finalize and precompute dw workspace by @sunyi0505 in https://github.com/fla-org/flash-linear-attention/pull/1074
* [Perf] Rewrite Ascend chunk_delta_h fwd by @OsirisDuan in https://github.com/fla-org/flash-linear-attention/pull/1055
* [Fix] Gate the recomputed output in layer_norm_gated backward by @truong-v in https://github.com/fla-org/flash-linear-attention/pull/1071
* [Fix] Use the full token stride for DPLR safe-gate offsets by @morluto in https://github.com/fla-org/flash-linear-attention/pull/1085
* [Fix] Fix int32 overflow in pointer arithmetic across Triton kernels by @zhiyuan1i in https://github.com/fla-org/flash-linear-attention/pull/1082
* [Feature] Add Ascend NPU backend for KDA fused recurrent forward by @sunyi0505 in https://github.com/fla-org/flash-linear-attention/pull/1090
* [Fix] Restore tuple-form legacy cache round trips by @morluto in https://github.com/fla-org/flash-linear-attention/pull/1089
* [Fix] Correct GRPO loss with old log probabilities by @dongchany in https://github.com/fla-org/flash-linear-attention/pull/1076
* [GDN] Enable FlashQLA forward dispatch on SM120 by @Akrao9 in https://github.com/fla-org/flash-linear-attention/pull/1094
* [GDN] Fix invalid launch above 65535/HV sequences in the state kernels by @schmidt-jake in https://github.com/fla-org/flash-linear-attention/pull/1077
* [Fix] Fix invalid launch above 65535 blocks in decode-path kernels by @zhiyuan1i in https://github.com/fla-org/flash-linear-attention/pull/1097
* [GDN] Match SM120 exactly for FlashQLA dispatch by @Akrao9 in https://github.com/fla-org/flash-linear-attention/pull/1098
* [Fix] Preserve explicit cu_seqlens with attention masks by @morluto in https://github.com/fla-org/flash-linear-attention/pull/1088
* [CI] Enforce PR checklist and add PR template by @zhiyuan1i in https://github.com/fla-org/flash-linear-attention/pull/1101
* [CI] Run Ascend A2 CI on NPU-related file changes by @zheliuyu in https://github.com/fla-org/flash-linear-attention/pull/1091
* [Perf] Optimize KDA NPU recompute_w_u_fwd kernel launch and fused u/w loop- #1081 by @sunyi0505 in...
```

## 注目度コメント

**NORMAL** — 監視対象。
