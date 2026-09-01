---
id: "2026-W34-021"
type: github
subtype: library
title: "llm-compressor 0.13.0"
url: "https://github.com/vllm-project/llm-compressor/releases/tag/0.13.0"
discovered: "2026-08-17"
published: "2026-08-12"
repo: "vllm-project/llm-compressor"
release_tag: "0.13.0"
models: [google/gemma-4, deepseek-ai/DeepSeek-V4, Qwen/Qwen3]
architectures: [moe, transformer]
methods: [AutoRound, SpinQuant, AWQ, GPTQ, REAP, compressed-tensors]
tech: [vllm-ready, weight-only, activation-quant, low-bit-2, low-bit-3, mixed-precision, arbitrary-bit-width, moe-quant, expert-pruning]
priority: high
sources: [github]
status: new
verified: "2026-08-18 release body + PR #2864/#2865/#2895/#2384/#2947, ct#732/#760 を一次情報で精読（Cowork）"
related: [items/2026-W31-020-github-vllm-v0260, items/2026-W34-020-github-vllm-v0270, items/2026-W34-004-paper-which-decisions-lowbit-breaks]
---
## 日本語要約
compressed-tensors 出力(=vLLM 直行)の量子化ツール大型更新。**任意ビット幅量子化 (Humming)**: pack_quantized が dense cross-element packing に。**AutoRound サブビット量子化** (W2A16 等)、**pre-quantized model の oneshot 対応**、W2〜W7 weight-only preset と整数 WxAy 組合せ拡張、Cohere2MoE SpinQuant、REAP(低顕著性 expert 剪定)+量子化の併用、MSE observer の torch.compile 対応。

## 量子化関連の変更点
- 新規対応手法/フォーマット: 任意ビット幅 (Humming, ct#732/#785), AutoRound sub-bit W2A16 (#2895), W2-W7 preset (ct#760)
- 既存手法の改善: AWQ/GPTQ の observer 冗長計算削減, MSE observer chunked torch.compile (#2384)
- 対応モデル拡張: Cohere2MoE SpinQuant (#2867), pre-quantized oneshot (#2909), REAP+量子化

## 影響範囲
- ユーザ視点の変化: W2〜W7 の任意ビット・サブビット量子化を compressed-tensors で作れ、そのまま vLLM に載る
- API/CLI 変更の有無: modifier ごとに requires_calibration_data() 宣言化 (#2947)

## 注目度コメント
vLLM エコシステムの量子化生成器。任意ビット幅と AutoRound サブビットは低ビット実験の幅を広げる。vllm-ready。

---

# 詳細解説（一次情報精読: 2026-08-18）

> 出典: GitHub Release <https://github.com/vllm-project/llm-compressor/releases/tag/0.13.0>（2026-08-11/12 公開）。個別 PR は llm-compressor #2864 / #2865 / #2895 / #2867 / #2384 / #2947 / #2927、compressed-tensors ct#732 / ct#760 の本文を精読。背景として vLLM 公式ブログ「Advancing Low-Bit Quantization for LLMs: AutoRound x LLM Compressor」(<https://vllm.ai/blog/intel-autoround-llmc>) を参照。引用は原文ママ（`>` で併記）。

## 0. なぜこれが「vLLM 0.26.0 の低ビット量子化に繋がる話」なのか

**その通りで、両者は「書く側」と「読む側」のペア。** vLLM 0.26.0 (2026-07-25) が *読める* ようになったフォーマットを、llm-compressor 0.13.0 (2026-08-11) で *作れる* ようになった、という順序で穴が埋まっている。

- vLLM 0.26.0 の追加分（原文ママ）: *"Humming w[2-7]a[4,8] weight-only inference with compressed-tensors (#46390)"* ← **推論側（reader）**
- llm-compressor 0.13.0 の追加分（原文ママ）: *"Arbitrary Bit-Width Quantization (Humming) — Dense packing for non-power-of-2 bit widths (3, 5, 6, 7) with no wasted bits, plus 16 new WxAy presets covering W2–W8 weights with A4, A8, or A16 activations."* ← **生成側（writer）**

つまり 0.26.0 の時点では「載せられる器はできたが、器に合う中身を作る標準ツールが揃っていなかった」。0.13.0 で **プリセット指定 → compressed-tensors 出力 → vLLM で直ロード** が一本の線として繋がった。

<svg viewBox="0 0 640 300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="llm-compressor と vLLM の役割分担">
  <rect x="0" y="0" width="640" height="300" rx="10" fill="#1b1f27"/>
  <text x="20" y="28" fill="#e6edf3" font-family="sans-serif" font-size="15" font-weight="bold">任意ビット幅（w2-w7）が「作れて載る」までの分担</text>

  <!-- writer box -->
  <rect x="24" y="56" width="200" height="150" rx="8" fill="#22303f" stroke="#4ea3ff" stroke-width="1.5"/>
  <text x="124" y="80" fill="#4ea3ff" font-family="sans-serif" font-size="13" font-weight="bold" text-anchor="middle">llm-compressor 0.13.0</text>
  <text x="124" y="98" fill="#9ecbff" font-family="sans-serif" font-size="11" text-anchor="middle">（書く側 / オフライン）</text>
  <text x="40" y="124" fill="#c9d1d9" font-family="sans-serif" font-size="11">・16 種の WxAy プリセット</text>
  <text x="40" y="143" fill="#c9d1d9" font-family="sans-serif" font-size="11">  W2-W8 × A4/A8/A16</text>
  <text x="40" y="162" fill="#c9d1d9" font-family="sans-serif" font-size="11">・AutoRound サブビット</text>
  <text x="40" y="181" fill="#c9d1d9" font-family="sans-serif" font-size="11">・REAP expert 剪定</text>

  <!-- format box -->
  <rect x="248" y="56" width="150" height="150" rx="8" fill="#2b3327" stroke="#56d364" stroke-width="1.5"/>
  <text x="323" y="80" fill="#56d364" font-family="sans-serif" font-size="13" font-weight="bold" text-anchor="middle">compressed-tensors</text>
  <text x="323" y="98" fill="#8fe39a" font-family="sans-serif" font-size="11" text-anchor="middle">（共通フォーマット）</text>
  <text x="262" y="126" fill="#c9d1d9" font-family="sans-serif" font-size="11">ct#732: dense</text>
  <text x="262" y="144" fill="#c9d1d9" font-family="sans-serif" font-size="11">cross-element packing</text>
  <text x="262" y="168" fill="#c9d1d9" font-family="sans-serif" font-size="11">ct#760: W2-W7</text>
  <text x="262" y="186" fill="#c9d1d9" font-family="sans-serif" font-size="11">weight-only preset</text>

  <!-- reader box -->
  <rect x="422" y="56" width="194" height="150" rx="8" fill="#2b2536" stroke="#c58cff" stroke-width="1.5"/>
  <text x="519" y="80" fill="#c58cff" font-family="sans-serif" font-size="13" font-weight="bold" text-anchor="middle">vLLM 0.26.0</text>
  <text x="519" y="98" fill="#dcb8ff" font-family="sans-serif" font-size="11" text-anchor="middle">（読む側 / サービング）</text>
  <text x="438" y="126" fill="#c9d1d9" font-family="sans-serif" font-size="11">#46390 Humming</text>
  <text x="438" y="144" fill="#c9d1d9" font-family="sans-serif" font-size="11">w[2-7]a[4,8]</text>
  <text x="438" y="162" fill="#c9d1d9" font-family="sans-serif" font-size="11">weight-only inference</text>
  <text x="438" y="186" fill="#8b949e" font-family="sans-serif" font-size="11">→ 変換なしで serve</text>

  <!-- arrows -->
  <line x1="224" y1="131" x2="246" y2="131" stroke="#8b949e" stroke-width="2" marker-end="url(#a1)"/>
  <line x1="398" y1="131" x2="420" y2="131" stroke="#8b949e" stroke-width="2" marker-end="url(#a1)"/>

  <text x="20" y="240" fill="#f0d264" font-family="sans-serif" font-size="12" font-weight="bold">時系列: vLLM 0.26.0 (07-25 読む側) → llm-compressor 0.13.0 (08-11 書く側) で穴が埋まった</text>
  <text x="20" y="266" fill="#8b949e" font-family="sans-serif" font-size="11">※ 0.27.0 は任意ビット幅を追加していない。0.27.0 の主戦場は KV cache 側（別item参照）。</text>
  <defs>
    <marker id="a1" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto"><path d="M0,0 L8,3 L0,6 Z" fill="#8b949e"/></marker>
  </defs>
</svg>

## 1. 「Humming」= 任意ビット幅の実装コード名

まず用語の整理。`Humming` は手法名ではなく、**非2冪ビット幅（3/5/6/7 bit）を無駄ビットなしで詰める実装**の呼称としてリリースノートに現れる。

> Release 0.13.0 原文:
> *"**Arbitrary Bit-Width Quantization (Humming)** — Dense packing for non-power-of-2 bit widths (3, 5, 6, 7) with no wasted bits, plus 16 new WxAy presets covering W2–W8 weights with A4, A8, or A16 activations."*

### 1.1 何が変わったか — padded packing → dense cross-element packing (ct#732)

**従来**: `pack_quantized` は理屈上 3/5/6/7 bit を扱えたが **padded packing**、つまり要素を int32 の境界に合わせて詰めるため端数ビットが捨てられていた。3bit を 4bit 相当で持つような無駄が出る。

**0.13.0**: 要素を int32 の境界を**跨いで**連続的に詰める。

> ct#732 原文:
> *"N intB elements get packed into ceil(N*B/32) int32s."*

7bit の例だと「4番目の要素の下位4bitが1語目、上位3bitが2語目」というように分割して縫い合わせる。結果、パディング由来の無駄が消える。

<svg viewBox="0 0 640 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="padded packing と dense cross-element packing の比較">
  <rect x="0" y="0" width="640" height="250" rx="10" fill="#1b1f27"/>
  <text x="20" y="28" fill="#e6edf3" font-family="sans-serif" font-size="15" font-weight="bold">ct#732: 7bit 要素を int32 に詰める（従来 vs dense）</text>

  <!-- padded -->
  <text x="20" y="62" fill="#ff7b72" font-family="sans-serif" font-size="12" font-weight="bold">従来 padded:</text>
  <g>
    <rect x="130" y="48" width="70" height="24" fill="#3a2730" stroke="#ff7b72"/>
    <rect x="200" y="48" width="70" height="24" fill="#3a2730" stroke="#ff7b72"/>
    <rect x="270" y="48" width="70" height="24" fill="#3a2730" stroke="#ff7b72"/>
    <rect x="340" y="48" width="70" height="24" fill="#3a2730" stroke="#ff7b72"/>
    <rect x="410" y="48" width="40" height="24" fill="#4a3038" stroke="#ff5d5d" stroke-dasharray="4 3"/>
    <text x="165" y="65" fill="#ffb3ad" font-family="sans-serif" font-size="10" text-anchor="middle">e0 (7b)</text>
    <text x="235" y="65" fill="#ffb3ad" font-family="sans-serif" font-size="10" text-anchor="middle">e1 (7b)</text>
    <text x="305" y="65" fill="#ffb3ad" font-family="sans-serif" font-size="10" text-anchor="middle">e2 (7b)</text>
    <text x="375" y="65" fill="#ffb3ad" font-family="sans-serif" font-size="10" text-anchor="middle">e3 (7b)</text>
    <text x="430" y="65" fill="#ff5d5d" font-family="sans-serif" font-size="10" text-anchor="middle">4b 捨</text>
  </g>
  <text x="466" y="65" fill="#ff5d5d" font-family="sans-serif" font-size="11">← 1語(32b)ごとに端数が死ぬ</text>

  <!-- dense -->
  <text x="20" y="130" fill="#56d364" font-family="sans-serif" font-size="12" font-weight="bold">dense (0.13.0):</text>
  <g>
    <rect x="130" y="116" width="62" height="24" fill="#2b3327" stroke="#56d364"/>
    <rect x="192" y="116" width="62" height="24" fill="#2b3327" stroke="#56d364"/>
    <rect x="254" y="116" width="62" height="24" fill="#2b3327" stroke="#56d364"/>
    <rect x="316" y="116" width="62" height="24" fill="#2b3327" stroke="#56d364"/>
    <rect x="378" y="116" width="34" height="24" fill="#33452f" stroke="#f0d264"/>
    <rect x="412" y="116" width="28" height="24" fill="#33452f" stroke="#f0d264"/>
    <rect x="440" y="116" width="62" height="24" fill="#2b3327" stroke="#56d364"/>
    <text x="161" y="133" fill="#8fe39a" font-family="sans-serif" font-size="10" text-anchor="middle">e0</text>
    <text x="223" y="133" fill="#8fe39a" font-family="sans-serif" font-size="10" text-anchor="middle">e1</text>
    <text x="285" y="133" fill="#8fe39a" font-family="sans-serif" font-size="10" text-anchor="middle">e2</text>
    <text x="347" y="133" fill="#8fe39a" font-family="sans-serif" font-size="10" text-anchor="middle">e3</text>
    <text x="395" y="133" fill="#f0d264" font-family="sans-serif" font-size="9" text-anchor="middle">e4下4b</text>
    <text x="426" y="133" fill="#f0d264" font-family="sans-serif" font-size="9" text-anchor="middle">上3b</text>
    <text x="471" y="133" fill="#8fe39a" font-family="sans-serif" font-size="10" text-anchor="middle">e5</text>
  </g>
  <line x1="412" y1="110" x2="412" y2="148" stroke="#c9d1d9" stroke-width="1.5" stroke-dasharray="3 3"/>
  <text x="386" y="162" fill="#c9d1d9" font-family="sans-serif" font-size="10">int32 境界（要素が跨ぐ）</text>

  <text x="20" y="196" fill="#e6edf3" font-family="sans-serif" font-size="12">式: N 個の intB 要素 → ceil(N×B/32) 個の int32（＝理論下限まで詰まる）</text>
  <text x="20" y="222" fill="#8b949e" font-family="sans-serif" font-size="11">効果: 3bit≒21要素/64bit、5bit≒6要素/32bit、6bit≒5要素/32bit、7bit≒4要素/32bit — パディング由来の無駄が消滅</text>
</svg>

**実務上の意味**: これまで「w3 にしても実質 w4 のディスク/VRAM しか減らない」状態だったのが、**w3 なら本当に 3/16 まで縮む**。中間ビット幅（w3/w5/w6）を精度-サイズのカーブ上で真面目に比較できるようになったのがポイント。

### 1.2 16 種の WxAy プリセット (ct#760)

> Release 0.13.0 原文:
> *"The new presets cover 'W2–W8 weights with A4, A8, or A16 activations,' including 'W3A8, W5A16, and W6A8.' All use 'group-128 symmetric weights' and 'token-wise dynamic symmetric activations.'"*

- 重み: **group-128 対称**量子化
- 活性: **token 単位の動的対称**量子化
- 例: `W3A8` / `W5A16` / `W6A8` などがレシピ名で直接指定できる

vLLM 0.26.0 が読めるのは **w[2-7]a[4,8]** なので、`A16` プリセットの一部（weight-only）と `A4/A8` 系が vLLM 直行の対象。**W8 系や A16 の一部は vLLM の Humming パスの範囲外**の可能性があるので、レシピを選ぶ時は vLLM 側の対応ビットと突き合わせること（下記「未確認事項」）。

## 2. AutoRound サブビット量子化 (#2895) — 層ごとに違うビット幅を振れるようになった

これが今回の**もう一つの目玉**。AutoRound（Intel の PTQ アルゴリズム）が W2A16〜W7A16 のレンジと、**層種別ごとの混合精度**に対応した。

AutoRound 自体の性質（公式ブログより）:

> *"three trainable parameters per quantized tensor: `V` (rounding offset/adjustment), `α` and `β` (learned clipping range controls)"* / *"Lightweight tuning (hundreds of steps, not thousands)"* / *"Zero additional inference overhead"*

つまり丸め方とクリップ範囲を数百ステップの signed gradient descent で学習する PTQ。推論時の追加コストはゼロで、出力は compressed-tensors。

### 2.1 混合精度レシピの実測（PR #2895, Qwen3-8B / GSM8K, vLLM + bf16）

| レシピ | GSM8K exact match |
|---|---|
| **W2A16 attention + W4A16 MLP** | **68.1%** |
| W4A16 attention + W2A16 MLP | 63.5% |

（参考: 同ブログの W4A16 一律は Qwen3-8B GSM8K で 0.911）

**読み取れること**: 同じ平均ビット数でも **attention を 2bit まで削って MLP を 4bit で守る方が良い**（+4.6pt）。MLP のほうが低ビット化に脆い、という配分の指針が出ている。ただし W4A16 一律の 0.911 からは大きく落ちるので、**サブビット領域は「動く」段階であって「使える」段階ではない**という読みが妥当。

> 注: これは focus の [[items/2026-W34-004-paper-which-decisions-lowbit-breaks|Which Decisions Low-Bit Quantization Breaks]]（3bit で tool 呼び出しが崩壊、2bit で安全拒否が半減するのにベンチ精度は不変）と併せて読むべき。**GSM8K が 68% 残っていても agent 挙動は壊れている可能性がある**ので、サブビット評価では GSM8K 単独で判断しない。

## 3. REAP: MoE の expert を剪定してから量子化する (#2864)

量子化そのものではないが、**量子化と積める圧縮軸**として重要。

- 正式名: **R**outer-weighted **E**xpert **A**ctivation **P**runing
- 顕著性スコア（PR 本文ママ）: `S_j = (1/N_j) ∑ (g_j(t) * ||f_j(t)||_2)`
  - router のゲート重み × expert 出力の L2 ノルム を、その expert にルーティングされたトークンで平均
- 対応剪定率: **25% / 50%**。group-limited router（DeepSeek-V3 系）も対応

### 3.1 実測（PR #2864）

| モデル | 剪定率 | recovery | サイズ |
|---|---|---|---|
| **Qwen3-30B-A3B** | 50% | **99.80%** | 56.93 GiB → **29.92 GiB** |
| Moonlight-16B | 50% | 16.99% | — |

**Qwen3-30B-A3B は expert 半分捨てて 99.8% 維持**という驚異的な数字。一方 Moonlight-16B は 16.99% で崩壊しており、**expert の冗長性がモデル依存で極端に違う**ことを示している。「MoE ならとりあえず REAP」は成り立たない。

> ⚠️ **要確認**: リリースノートは REAP と量子化の併用に言及しているが、PR #2864 本文には併用の明示がない。「REAP で 50% 剪定 → さらに W4A16」を積んだ時の recovery は自分で測る必要がある。

## 4. その他の実務的な改善

| 変更 | PR | 何が助かるか |
|---|---|---|
| Observer fusion & deletion | #2865 | *"a memory leak where statistics persisted after calibration"* を修正。`fusion_handler` で observer のライフサイクル管理。**大モデルの量子化中の OOM が減る** |
| MSE observer の torch.compile + chunked 実行 | #2384 | MSE observer（AWQ/GPTQ の探索で重い部分）が高速化。量子化ジョブの実時間短縮 |
| 各 modifier が `requires_calibration_data()` を宣言 | #2947 | レシピを組んだ時点で「校正データが必要か」が判る。**model-free PTQ とキャリブ必須手法の取り違え防止** |
| デフォルト save shard を 20GB に縮小 | #2927 | 巨大 checkpoint の書き出しが分割され、アップロード/ロードが安定 |
| Cohere2MoE SpinQuant | #2867 | parallel transformer block の特殊扱いに対応 |
| pre-quantized model の `oneshot` 対応（experimental） | — | **既に量子化済みのモデルに追加処理を積める**（例: 公開 FP8 checkpoint に REAP を後付け） |
| `torch.cuda` → `torch.accelerator` 移行 | — | Intel XPU での量子化ジョブが通る |
| MoE linearization 拡張 / Transformers v5.13.0 対応 | — | DeepSeek V4 Pro / GLM 5.2 / HunyuanMoE V3 / **Gemma 4**(focus) / Mellum2 が量子化対象に |

## 5. Hiroyaさん視点での「今すぐ試せること」

1. **中間ビット幅の精度-サイズカーブを引く（本命）**
   `W3A16` / `W5A16` / `W6A8` プリセットで同一モデルを量子化 → vLLM 0.26.0 以降で serve。**dense packing 後の実 VRAM を実測**して「w3 が本当に w4 より小さいか」を確認するのが第一歩。ここが 0.13.0 以前は測れなかった部分。
2. **REAP × 量子化の積み上げ**
   Qwen3-30B-A3B で REAP 50%（99.8% recovery）→ さらに W4A16 を積んで recovery を測る。**56.93 GiB → 29.92 GiB → さらに 1/4** が狙えるなら、MoE のオンプレ配置の選択肢が変わる。ただし Moonlight-16B の 16.99% があるので、対象モデルごとに剪定率を振って崩壊点を先に見つけること。
3. **サブビットは agent 系評価を必ず併走**
   `W2A16 attention + W4A16 MLP` は GSM8K 68.1% だが、W34-004 の知見からすると tool 呼び出しや安全拒否が壊れている可能性が高い。**GSM8K だけで OK 判定しない**。
4. **Gemma 4 (focus) が量子化対象に入った**ので、llm-compressor 0.13.0 側でレシピを回して vLLM に載せる導線が使える。ただし vLLM 0.27.0 の FA4 headdim-256 制約（block_size 固定）に注意（[[items/2026-W34-020-github-vllm-v0270]] 参照）。

## 6. 0.12.0 → 0.13.0 早見表

| 観点 | 0.12.0 (2026-06-15) | 0.13.0 (2026-08-11) |
|---|---|---|
| テーマ | **基盤整備**（Transformers v5 移行、MoE linearization 統一、Multi-GPU model-free PTQ） | **低ビット領域の解禁**（任意ビット幅の dense packing、AutoRound サブビット、REAP） |
| 出せるビット幅 | 実質 2/4/8 の2冪中心 | **W2〜W8 × A4/A8/A16 の 16 プリセット**、3/5/6/7 も無駄ビットなし |
| 新しい圧縮軸 | — | **expert 剪定（REAP）** が量子化と別軸で追加 |
| 混合精度 | scheme 単位 | **層種別ごと**（attention と MLP で別ビット幅） |
| vLLM との関係 | compressed-tensors 出力で直行 | 0.26.0 の Humming reader に対応する **writer 側が揃った** |

## 7. 未確認事項（次回持ち越し）

- **プリセットと vLLM 対応ビットの突合**: vLLM 0.26.0 の reader は `w[2-7]a[4,8]`。0.13.0 の 16 プリセットには `W8` や `A16` も含まれるため、**どのプリセットが vLLM 直ロード可か**の対応表が未確認（llm-compressor 側ドキュメントか vLLM 側の対応スキーマ一覧で要確認）。
- **REAP + 量子化の併用**の公式サポート状況と recovery（§3.1 の ⚠️）
- **dense packing のデコード速度**: サイズは縮むが、int32 境界を跨いだ要素の unpack にコストがかかるはず。vLLM 側 Humming カーネルのスループット実測値が両リリースノートに無い。**「小さくなる」と「速くなる」を分けて測る**必要あり。
- リリース日: release ページの表示は 08-11、本 item frontmatter は `published: 2026-08-12`（UTC/JST 差の可能性）。実害はないが突合時に注意。
