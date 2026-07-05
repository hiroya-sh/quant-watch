---
id: "2026-W28-017"
type: hf-model
title: "mlx-community/Nemotron-3-{Ultra-550B-A55B, Nano-30B-A3B, Nano-9B}-4bit"
url: "https://huggingface.co/mlx-community/Nemotron-3-Nano-30B-A3B-4bit"
discovered: "2026-07-06"
published: "2026-07-05"
base_model: "nvidia/Nemotron-3-{Ultra-550B-A55B, Nano-30B-A3B, Nano-9B}"
models: [nvidia/Nemotron]
architectures: [transformer, moe, hybrid, mamba2]
methods: [AWQ]
tech: [weight-only, moe-quant, low-bit-4, mixed-precision]
priority: normal
sources: [hf-models]
status: new
related: [2026-W26-014]
---

## 日本語要約
mlx-community が Nemotron-3 ファミリー 3 モデルの MLX 4-bit 量子化を一斉リリース。W26 で HF Papers に登場した Nemotron-3 系のうち、mlx への MLX 変換が W28 で揃った。Ultra 550B-A55B の MoE 部分と Nemotron-H hybrid の mamba2 部分の両方に対応した変換パイプラインが公開。Apple Silicon (M4 Ultra 192GB) で Ultra-550B-A55B の実機推論が可能になった初のリリース。

## 量子化仕様
- **Nemotron-3-Ultra-550B-A55B-4bit**: MoE expert 4-bit、router BF16、mamba2 SSM は BF16 保持
- **Nemotron-3-Nano-30B-A3B-4bit**: 同上、小型 MoE
- **Nemotron-3-Nano-9B-4bit**: dense 4-bit、hybrid Mamba2+Transformer
- 全モデル group-size 64 で MLX MPI 対応

## 精度報告
- **Nemotron-3-Ultra-550B-A55B-4bit**: MMLU 86.4 (FP16 87.9, -1.5pt)、GSM8K 91.2 (FP16 92.8, -1.6pt)
- **Nemotron-3-Nano-9B-4bit**: MMLU 72.1 (FP16 73.4, -1.3pt)、hybrid 部分の劣化が支配的

## ダウンロード/利用状況
- Ultra-550B-A55B-4bit は M4 Ultra 192GB でギリギリ動作、Metal で decode 8-11 tok/s 報告
- 3 モデル合計 downloads 12,000+（48 時間）

## 注目度コメント
Nemotron の hybrid + MoE 両方への対応が Apple Silicon 側で揃った点は少数派ユーザに嬉しい進展。focus には該当しないが、量子化と hybrid アーキテクチャの組み合わせという意味で taxonomy 上の interesting corner。normal priority。
