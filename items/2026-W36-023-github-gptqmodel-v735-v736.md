---
id: "2026-W36-023"
type: github
subtype: library
title: "GPT-QModel v7.3.5 / v7.3.6"
url: "https://github.com/ModelCloud/GPTQModel/releases/tag/v7.3.6"
discovered: "2026-09-01"
published: "2026-08-31"
repo: "ModelCloud/GPTQModel"
release_tag: "v7.3.5, v7.3.6"
models: [deepseek-ai/DeepSeek-V3]
architectures: [transformer]
methods: [GPTQ, AWQ]
tech: [weight-only, low-bit-4, calibration]
priority: normal
sources: [github]
status: new
related: []
---
## 日本語要約
v7.3.4 の大きめの機能追加(planar `gptq_p` 3/5/6/7bit、Swordfish カーネル)の後を受けたモデル対応 + 安定化の2本。

> 注: v7.3.6 は 2026-09-01 08:28 JST 公開で W36 窓外だが、キャッチアップのため取り込む。

## focus 突合(release body 全文スキャン)
- focus method / model いずれも出現なし

## 量子化関連の変更点
### v7.3.5 (2026-08-25)
- Mage-VL / Muse Glimmer / OLMo 3 / SmolLM3 / **DeepSeek V3.2** の量子化対応 (#3020)
- **LM-head と embedding の量子化ライフサイクル追加** (#3021)
- Unlimited-OCR の量子化対応 (#3023)

### v7.3.6 (2026-09-01)
- **tile-misaligned な GPTQ Marlin 形状に対応** (#3028)、同じく **4-bit AWQ Marlin** (#3033)
- QQQ の workspace 寿命修正 + packing メモリ削減 (#3029)
- HunyuanOCR / locateanything / **Qwen3.8 Flash Next** の量子化対応 (#3030, #3032, #3040)
- **`fix(awq): stop variable-length calibration collapsing to the last batch`** (#3036) ← 可変長校正のバグ
- marlin のデバイス検証と runtime buffer 登録 (#3041)、CUDA JIT キャッシュ再利用と CUTLASS 更新 (#3039)

## 影響範囲
- **AWQ で可変長の校正データを使っていた場合、最後のバッチに潰れていた**(#3036)。校正結果が変わる可能性がある重要修正。
- LM-head / embedding 量子化は、[[items/2026-W36-017-paper-layer-importance-metric|Layer Importance Metric]] が「embedding は加速の有望ターゲット」としている点と一致。

## 注目度コメント
#3036 の校正バグは実務影響が大きい。Qwen3.8-Flash-Next 対応が公開4日後に入っている点も速い。
