---
id: "2026-W29-035"
type: hf-model
title: "jarrelscy/GLM-5.2-NVFP4-AQLM-hybrid"
url: "https://huggingface.co/jarrelscy/GLM-5.2-NVFP4-AQLM-hybrid"
discovered: "2026-07-13"
published: "2026-07-06"
base_model: "zai-org/GLM-5.2"
models: [zai-org/GLM-5.2]
architectures: [transformer, moe]
methods: [NVFP4]
tech: [low-bit-fp4, low-bit-2, weight-only, mixed-precision]
priority: normal
sources: [hf-models]
status: new
verified: "2026-07-13 HF API で repo/createdAt/quant_config 確認 (createdAt 2026-07-06, quant_method: nvfp4_aqlm_hybrid)"
related: []
---

## 日本語要約
GLM-5.2 に **NVFP4 と AQLM(加法的ベクトル量子化)のハイブリッド**を適用したコミュニティモデル(1.7k DL)。quant_method は独自の `nvfp4_aqlm_hybrid`。250k / 500k 校正トークン数違いの variant も同時公開。ハードウェアネイティブな FP4 とコードブック系 VQ を層別に使い分ける発想。

## 注目度コメント
独自 quant_method のため標準エンジンでは直接ロード不可(vllm-ready 非付与)。FP4×VQ ハイブリッドという方向性は [[items/2026-W29-005-paper-bisco-llm-binary-spherical|BiSCo-LLM]](VQ のルックアップ除去)と対照的で興味深い。normal。methods タグ候補: `AQLM`(taxonomy 未登録)。
