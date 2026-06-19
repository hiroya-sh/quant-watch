---
id: "2026-W24-004"
type: paper
title: "KVarN: Variance-Normalized KV-Cache Quantization Mitigates Error Accumulation in Reasoning Tasks"
url: "https://arxiv.org/abs/2606.03458"
discovered: "2026-06-08"
published: "2026-06-02"
authors: [Lorenz K. Muller, Philippe Bich, Chiara Boretti, Hyun-Min Chang, Jiawei Zhuang, Lukas Cavigelli]
venue: "arxiv"
models: []
architectures: [transformer]
methods: []
tech: [kv-cache-quant, calibration-free, rotation, low-bit-2, per-token]
priority: high
sources: [arxiv, hf-papers]
status: new
related: []
---

## 日本語要約
推論タスクの長期デコード中にKVキャッシュ量子化誤差が累積する問題を解決。自己回帰デコード時は誤差がタイムステップ間で積算されるがプリフィルと異なる特性があることを実証。Hadamard回転に加えてK・V行列の両軸にわたる分散正規化（dual-scaling variance normalization）を適用するKVarNを提案。校正データ不要で2ビット精度においてMATH500・AIME24・HumanEvalで新SOTA。vLLM実装あり。

## 手法
- Hadamard回転で外れ値を抑制（既存手法共通）
- 加えてK行列・V行列の両軸（token軸・channel軸）での分散正規化を適用
- トークンスケールの誤りが誤差累積の主因であることを分析で特定
- キャリブレーション不要

## 評価
- ベンチマーク: MATH500、AIME24、HumanEval
- ビット幅: 2bit KVキャッシュ
- 結果: 各ベンチマークで新SOTA（reasoning特化の評価では既存手法を大幅に凌駕）
- 実装: vLLM対応コード公開済み (https://github.com/huawei-csl/KVarN)

## 既存手法との差分
RotateKV・KVLinCはプリフィル設定での評価が主体。KVarNは自己回帰デコードでの誤差累積メカニズムを分析し、reasoning taskに特化したSoTAを達成。Hadamard+分散正規化の組み合わせが新規。

## 注目度コメント
kv-cache-quantがfocus。reasoning model（Qwen3等）普及でlong-horizon decodingが重要化する中、タイムステップ間誤差累積の解消はHurwitzQuant（W23）と並んで注目の観点。HF Papersでも342いいねと高エンゲージメント。

---

# 詳細解説（原著精読: 2026-06-19）

> 出典: arXiv:2606.03458v1「KVarN: Variance-Normalized KV-Cache Quantization Mitigates Error Accumulation in Reasoning Tasks」(Muller, Bich, Boretti, Chang, Zhuang, Cavigelli — **Huawei**)。HTML版 <https://arxiv.org/html/2606.03458v1> を精読。引用は原文ママ（> で併記）。本文中の式番号・図番号・節番号は原著に対応。
> 注: 本解説は本文§1〜§4.1.1（Table 1 まで）を精読して作成。Table 2/3・line-retrieval・runtime overhead・related work・付録の数値は未読部分があり、確認できた範囲のみ記載している（捏造防止のため）。

## 1. 何を解いた論文か

**test-time scaling（推論時に思考トークンを伸ばして賢くする）が長期デコードでメモリ律速になる**問題に対し、KVキャッシュ量子化を「自己回帰デコード」設定で正しく扱うことを狙う。

著者らの中心主張は、既存手法の**評価設定が "prefill風" であること**への批判から始まる。

> 原著 Abstract:
> *"KV-cache quantization can help improve this, but current methods are evaluated under prefill-like settings and errors behave differently under autoregressive decoding. We show that in the latter regime, **quantization errors accumulate across timesteps, driven primarily by incorrect token scales.**"*

つまり、(a) 既存手法は長い固定コンテキストを一括量子化する prefill 的ベンチで測られているが、(b) 実際の reasoning デコードでは生成しながら逐次量子化するため**誤差がタイムステップをまたいで累積**し、(c) その累積の主因は**トークンごとのスケール（magnitude）の取り違え**である、という3点を指摘する。

KVarN の構成は2段：**Hadamard回転 → K・V両軸の dual-scaling 分散正規化（VarN）**。校正データ不要（calibration-free）。

> 原著 Abstract:
> *"We introduce KVarN, a calibration-free KV-cache quantizer that applies a Hadamard rotation followed by a **dual-scaling variance normalization across both axes** of the K and V matrices."*

（余談だが KVarN の名は脚注で「kvarn = スウェーデン語で穀物・コーヒー豆…そして KV-Cache をすり潰す挽き器」という言葉遊び。原著§1.1 脚注1）

## 2. 前提知識（原著§2）

### 2.1 KVキャッシュ量子化の基本（§2.1）
KIVI [KIVI] に倣い、チャネル次元はヘッドごと、トークン次元はチャンク（例: 128）ごとに処理する。基本タイルは `head-dim × token-chunk`（Llama3.1-8B では 128×128）。

> 原著§2.1:
> *"KIVI has shown that with round-to-nearest quantization, it is best to quantize the V matrix **per token** and the K matrix **per channel**."*

K は低精度行列 $K_q$ + 高精度の zero-point $\vec{z}$ + scale $\vec{s}$（各チャネル1要素）で表現し、復元は

$$K_{dq} = (K_q + \vec{z}) \odot \vec{s} \quad \text{（原著 式(1)）}$$

**K は V より量子化が難しい**ことが繰り返し強調される（KVarN が K に注力する理由）。

> 原著§2 脚注2:
> *"in Llama3.1-8B >98% of the top 5% quantization errors under the KIVI-scheme lie in a K-matrix."*

### 2.2 Incoherence processing（Hadamard回転, §2.2）
Hadamard変換は $O(N\log N)$ でオンライン適用でき、隣接重みに吸収可能（QuaRot [ashkboos2024quarot] と同じ配置）。大行列の極限で出力がガウス分布化し、チャネル方向の外れ値を均す。**ただし単独ではトークン方向のスケール誤差を抑えきれない**——これが KVarN の出発点。

> 原著§2.2:
> *"incoherence processing is helpful to equalize channel-space outliers, but **insufficient on its own to manage token-wise scaling errors**."*

### 2.3 Dual-scaling（重み量子化由来, §2.3）
重み量子化で流行した Sinkhorn-Knopp 風の「入力・出力両チャネルの分散を一様化する正規化」（SINQ [muller2025sinq]）を借用。重みでは校正データを近似する効果で end-to-end は良くなるが**逆に行列再構成誤差は増える**という性質がある。KVarN では**理由が違う**点が重要：

> 原著§2.3:
> *"We find that dual-scaling variance normalization is also helpful in KV-Cache quantization, but **for unrelated reasons as there is no calibration data to approximate**."*

### 2.4 キーアイデア：上位5%の外れ誤差が支配的（§2.4）
論文の論理の核。**端的に言えば「大きい誤差だけ直せばよい」**。

> 原著§2.4:
> *"The largest, e.g. top 5%, errors in the KV-Cache cause most of the end-to-end degradation, smaller errors (even if they are many) are less important."*

Fig.3 では、**最悪5%の外れ誤差だけを高精度に戻すほうが、残り95%を全部直すより end-to-end の KL ダイバージェンスが改善する**（MSE 自体は95%側に多くあるのに、である）。そしてその外れ誤差の主因が **per-token magnitude**（Fig.1a）。

## 3. 手法（原著§3）

### 3.1 誤差を「大きさ」と「向き」に分解（§3.1）
全精度 key ベクトル $K$ と復元 $K_{dq}$ の二乗 $\mathcal{L}_2$ 誤差を、内積の幾何的定義（$\theta$ は両者のなす角）で展開：

$$\|K-K_{dq}\|^2 = \|K\|^2 - 2\|K\|\|K_{dq}\|\cos\theta + \|K_{dq}\|^2 \quad\text{（式(2)）}$$

クロス項 $2\|K\|\|K_{dq}\|$ を足し引きして2成分に分離：

$$\underbrace{\|K-K_{dq}\|^2}_{E_T,\,\text{Total}} = \underbrace{(\|K\|-\|K_{dq}\|)^2}_{E_M,\,\text{Magnitude Error}} + \underbrace{2\|K\|\|K_{dq}\|(1-\cos\theta)}_{E_D,\,\text{Directional Error}} \quad\text{（式(3)）}$$

すなわち**大きさのズレ $E_M$** と**向きのズレ $E_D$** に綺麗に切り分けられる。Fig.1a では比 $E_M/E_T$ を見て「**外れ誤差は圧倒的に magnitude 由来**」と示す。

> 原著§3.1:
> *"In Fig.1(a) we use $\frac{E_M}{E_T}$ ... to show that **outlier errors are overwhelmingly caused by incorrect magnitudes.**"*

<svg viewBox="0 0 560 230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="誤差の magnitude/direction 分解">
  <rect x="0" y="0" width="560" height="230" rx="10" fill="#1b1f27"/>
  <text x="20" y="28" fill="#e6edf3" font-family="sans-serif" font-size="15" font-weight="bold">式(3): 量子化誤差 = 大きさ誤差 E_M + 向き誤差 E_D</text>
  <!-- origin -->
  <circle cx="90" cy="180" r="3" fill="#9aa7b3"/>
  <text x="66" y="198" fill="#9aa7b3" font-family="sans-serif" font-size="11">原点</text>
  <!-- K vector (full precision) -->
  <line x1="90" y1="180" x2="430" y2="60" stroke="#4ea3ff" stroke-width="3" marker-end="url(#ar)"/>
  <text x="300" y="100" fill="#4ea3ff" font-family="sans-serif" font-size="13" font-weight="bold">K（全精度）  ‖K‖</text>
  <!-- K_dq vector (quantized) -->
  <line x1="90" y1="180" x2="380" y2="120" stroke="#ff9d4e" stroke-width="3" marker-end="url(#ar2)"/>
  <text x="250" y="160" fill="#ff9d4e" font-family="sans-serif" font-size="13" font-weight="bold">K_dq（復元）  ‖K_dq‖</text>
  <!-- angle -->
  <path d="M 150 159 A 65 65 0 0 0 150 145" fill="none" stroke="#c9d1d9" stroke-width="1.5"/>
  <text x="158" y="150" fill="#c9d1d9" font-family="sans-serif" font-size="12">θ（向きのズレ→E_D）</text>
  <!-- magnitude diff -->
  <line x1="380" y1="120" x2="430" y2="60" stroke="#ff5d5d" stroke-width="2" stroke-dasharray="5 4"/>
  <text x="392" y="92" fill="#ff5d5d" font-family="sans-serif" font-size="12">‖K‖−‖K_dq‖（大きさのズレ→E_M）</text>
  <text x="20" y="222" fill="#8b949e" font-family="sans-serif" font-size="11">主張: 外れ値（上位5%）の誤差は大半が E_M（赤）由来 → トークンの大きさを保てば直る</text>
  <defs>
    <marker id="ar" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto"><path d="M0,0 L8,3 L0,6 Z" fill="#4ea3ff"/></marker>
    <marker id="ar2" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto"><path d="M0,0 L8,3 L0,6 Z" fill="#ff9d4e"/></marker>
  </defs>
</svg>

### 3.2 誤差累積と "pseudo-decode" 評価（§3.2）
深いモデルでデコード中に KV を量子化すると、ブロック $B_l$ の attention が量子化済み KV で計算され、その誤差が次ブロック $B_{l+1}$ が生む K,V を汚し、それを量子化してさらに $B_{l+2}$ 以降に伝播…**層・タイムステップをまたいで誤差が累積し、系列が長いほど悪化する**。

> 原著§3.2:
> *"KV-Cache quantization errors can be accumulated across layers and eventually time-steps. This problem **compounds as the generated sequence gets longer.**"*

これを安価に測るため **pseudo-decode 設定**を提案：系列をサイズ $b$ のブロックに分け、$b$ トークン通過ごとに KV を量子化、以降のトークンは**その量子化済みキャッシュ**で計算する（＝デコード時の挙動を模す）。従来の prefill 一括量子化（誤差累積を見ない静的設定）と対比される。

<svg viewBox="0 0 560 210" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="prefill vs pseudo-decode">
  <rect x="0" y="0" width="560" height="210" rx="10" fill="#1b1f27"/>
  <text x="20" y="26" fill="#e6edf3" font-family="sans-serif" font-size="15" font-weight="bold">図4の要点: prefill一括量子化 と pseudo-decode（逐次）</text>
  <!-- prefill row -->
  <text x="20" y="62" fill="#ff7b72" font-family="sans-serif" font-size="13" font-weight="bold">従来(prefill):</text>
  <rect x="150" y="48" width="360" height="22" rx="4" fill="#3a2730" stroke="#ff7b72"/>
  <text x="330" y="64" fill="#ffb3ad" font-family="sans-serif" font-size="11" text-anchor="middle">長い文脈を一括で1回だけ量子化（誤差は累積しない）</text>
  <!-- pseudo-decode row -->
  <text x="20" y="118" fill="#56d364" font-family="sans-serif" font-size="13" font-weight="bold">提案(pseudo-decode):</text>
  <g font-family="sans-serif" font-size="10" text-anchor="middle">
    <rect x="150" y="104" width="78" height="22" rx="4" fill="#26342a" stroke="#56d364"/><text x="189" y="119" fill="#aef2b6">block b₁→量子化</text>
    <rect x="236" y="104" width="78" height="22" rx="4" fill="#26342a" stroke="#56d364"/><text x="275" y="119" fill="#aef2b6">b₂→量子化</text>
    <rect x="322" y="104" width="78" height="22" rx="4" fill="#26342a" stroke="#56d364"/><text x="361" y="119" fill="#aef2b6">b₃→量子化</text>
    <rect x="408" y="104" width="100" height="22" rx="4" fill="#26342a" stroke="#56d364"/><text x="458" y="119" fill="#aef2b6">… 量子化済みKVを参照</text>
  </g>
  <path d="M228 138 Q 275 152 322 138" fill="none" stroke="#f0883e" stroke-width="2" marker-end="url(#ar3)"/>
  <path d="M314 138 Q 361 152 408 138" fill="none" stroke="#f0883e" stroke-width="2" marker-end="url(#ar3)"/>
  <text x="285" y="178" fill="#f0883e" font-family="sans-serif" font-size="12" text-anchor="middle">誤差が後続ブロックへ累積 → 長文脈ほど悪化</text>
  <text x="20" y="200" fill="#8b949e" font-family="sans-serif" font-size="11">KVarN はこの「累積する領域」で動くよう設計されている（原著§3.2）</text>
  <defs><marker id="ar3" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto"><path d="M0,0 L8,3 L0,6 Z" fill="#f0883e"/></marker></defs>
</svg>

### 3.3 KVarN 本体（§3.3）
2つの変換でトークンスケール誤差を抑える：

1. **チャネル方向に Hadamard回転**（QuaRot配置）。チャネルの外れ値を低減。
2. **チャネル・トークン両方向に分散正規化（VarN, オンライン）**。

トークン方向に Hadamard を掛けないのは復元コストのため。

> 原著§3.3:
> *"In the token dimension it would be too costly to apply a Hadamard rotation (because on decompression this rotation will have to be undone online for every token position; i.e. typically $128^2$ operations per 128 tokens per channel)."*

代わりに**両軸の要素ごとスケーリング**を使う。これは復元コストを**トークン×チャネルあたり +1 FLOP** しか増やさない（Hadamard より遥かに安い）。スケーリングベクトルは行・列の分散を反復正規化して得る（Sinkhorn-Knopp風）。

実装上の注意点が2つ明記されている：

> 原著§3.3:
> *"It is not possible to work directly with the magnitude of the matrices, because they are signed and in some cases have large offsets. One cannot directly use the token-axis variance alone to normalize tokens, because this would **increase the per-channel kurtosis**. Iterative variance normalization can avoid this."*

具体的には SINQ [muller2025sinq] の**対数領域での標準偏差スケーリング**実装を KVキャッシュ向けに流用（付録H Alg.1）。重み量子化と違い、**ここでは再構成誤差そのものを直接下げる**点が肝。

> 原著§3.3:
> *"In our setting, this normalization is useful because **it reduces directly the matrix reconstruction error** ... it decreases tail-errors that are primarily due to incorrect token scaling by directly fixing the magnitude with an additional high-precision scale."*

格納するのは「標準スケール + zero-point + 2つ目のscale」で、**平均2.3 bit/要素**（2つ目のscaleを足してもこの低ビットで既存手法に匹敵/凌駕、原著 Fig.2 注記）。

<svg viewBox="0 0 560 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="KVarN パイプライン">
  <rect x="0" y="0" width="560" height="250" rx="10" fill="#1b1f27"/>
  <text x="20" y="26" fill="#e6edf3" font-family="sans-serif" font-size="15" font-weight="bold">図2の要点: KVarN パイプライン（K, V 各々に適用）</text>
  <g font-family="sans-serif" font-size="12" text-anchor="middle">
    <rect x="22" y="60" width="110" height="56" rx="6" fill="#21262d" stroke="#7d8590"/>
    <text x="77" y="84" fill="#e6edf3">生の K / V</text><text x="77" y="102" fill="#8b949e" font-size="10">トークン×チャネル</text>
    <rect x="160" y="60" width="120" height="56" rx="6" fill="#1d2b3a" stroke="#4ea3ff"/>
    <text x="220" y="82" fill="#79c0ff">① Hadamard回転</text><text x="220" y="100" fill="#8b949e" font-size="10">チャネル方向 / 外れ値抑制</text>
    <rect x="308" y="60" width="140" height="56" rx="6" fill="#2a2336" stroke="#bc8cff"/>
    <text x="378" y="78" fill="#d2a8ff">② VarN（両軸）</text><text x="378" y="94" fill="#8b949e" font-size="10">トークン＋チャネルの</text><text x="378" y="107" fill="#8b949e" font-size="10">分散を反復正規化(Sinkhorn風)</text>
    <rect x="476" y="60" width="70" height="56" rx="6" fill="#26342a" stroke="#56d364"/>
    <text x="511" y="84" fill="#aef2b6">③ RTN</text><text x="511" y="102" fill="#8b949e" font-size="10">2bit量子化</text>
  </g>
  <g stroke="#f0883e" stroke-width="2" marker-end="url(#ar4)" fill="none">
    <line x1="132" y1="88" x2="158" y2="88"/><line x1="280" y1="88" x2="306" y2="88"/><line x1="448" y1="88" x2="474" y2="88"/>
  </g>
  <text x="20" y="158" fill="#e6edf3" font-family="sans-serif" font-size="13" font-weight="bold">格納物（平均 2.3 bit/要素）:</text>
  <g font-family="sans-serif" font-size="11">
    <rect x="30" y="172" width="150" height="28" rx="4" fill="#26342a" stroke="#56d364"/><text x="105" y="190" fill="#aef2b6" text-anchor="middle">低精度行列 K_q（2bit）</text>
    <rect x="195" y="172" width="120" height="28" rx="4" fill="#21262d" stroke="#7d8590"/><text x="255" y="190" fill="#e6edf3" text-anchor="middle">scale + zero-point</text>
    <rect x="330" y="172" width="170" height="28" rx="4" fill="#2a2336" stroke="#bc8cff"/><text x="415" y="190" fill="#d2a8ff" text-anchor="middle">2つ目のscale（VarN由来）</text>
  </g>
  <text x="20" y="228" fill="#8b949e" font-family="sans-serif" font-size="11">復元コスト: VarHの追加は token×channel あたり +1 FLOP のみ（トークン方向Hadamardは高すぎるので不採用）</text>
  <defs><marker id="ar4" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto"><path d="M0,0 L8,3 L0,6 Z" fill="#f0883e"/></marker></defs>
</svg>

### 3.4 局所プロキシ検証：attention出力の再構成誤差（§3.4）
attention層出力の再構成誤差ノルムを、prefill的（累積なし）と pseudo-decode（累積あり）両方で評価（Fig.5, Qwen3-4B）。

> 原著§3.4:
> *"compared to RTN (KIVI), the proposed KVarN achieves much lower error, and accumulates less error over time ... in the worst case, such scale errors can **compound exponentially** (repeated application of incorrect multipliers) and avoiding them is particularly helpful over longer contexts."*

KVarN は全コンテキスト長で KIVI より誤差が小さく、**文脈が長いほど KIVI に対する優位が拡大**する（Fig.5c）。スケール誤差は最悪指数的に膨らむため、長文脈での累積抑制が効く、という因果が綺麗に繋がっている。

## 4. 実験（原著§4）

評価モデルは **Qwen3-4B / Llama-3.1-8B / Phi-4-14B**（サイズ・系統を網羅。Qwenはネイティブreasoning、Phiにreasoning版あり、Llamaはreasoning版なし）。reasoning系ベンチは reasoning対応モデルで、line-retrieval・instruction-following は全モデルで実施。

対象ベンチ（原著§4.1.1）：
- **MATH500** … 数学的導出を要する推論
- **AIME24** … 競技数学（長いCoT + 整数解）
- **HumanEval** … docstring→Python実装
- **IFEval** … 形式・内容制約への追従（文字数制限や出力テンプレ等）

各3runの平均精度。KVarN は **平均2.3 bit/要素で最高の総合性能**を主張。

> 原著§4.1.1:
> *"KVarN achieves the best overall performance with the lowest average bits (2.3 per element of KV-Cache)."*

### Table 1（AIME24 / MATH500, 精度% — 確認できた数値のみ転記）

**Qwen3-4B**:

| 手法 | K/V bits | bits/elem | AIME24 Acc. | MATH500 Acc. |
|---|---|---|---|---|
| FP16（無圧縮） | 16/16 | 16.0 | 61.1 ±3.1 | 82.6 ±0.5 |
| KIVI | 2/2 | 2.3 | 55.5 ±6.9 | 77.8 ±0.5 |
| QuaRot | 2/2 | 2.3 | 56.7 ±3.3 | 78.9 ±0.1 |
| KVQuant-1% | 2/2 | 2.4 | 40.0 ±3.3 | 67.5 ±1.5 |
| PolarQuant | 4/2 | 3.3 | 52.2 ±5.8 | 71.1 ±1.6 |
| TurboQuant | 3/3 | 4.6 | 48.9 ±1.9 | 77.0 ±0.9 |
| Kitty | 2/2 | 2.4 | 53.3 ±8.8 | 78.5 ±0.8 |
| **KVarN (ours)** | 2/2 | **2.3** | **60.0 ±1.1** | **79.2 ±0.4** |

**Phi-4-14B**（一部）: FP16 AIME24 62.2 / MATH500 84.9。KIVI 57.8 / 74.4、QuaRot 58.9 / 77.0、KVQuant-1% 55.6 / 72.3、PolarQuant(4/2) 60.0 / 75.8 … KVarN行は今回読んだHTML範囲では末尾が途切れており未確認。

注目点：**2bit (2.3 bit/elem) でありながら AIME24 で 60.0% と FP16(61.1%) にほぼ肉薄**し、より多ビットを使う PolarQuant(3.3) や TurboQuant(4.6) を上回る。focus手法 **PolarQuant / TurboQuant がここでは比較対象（baseline）側**として大差で負けている点は、Hiroyaさんの関心軸的に要注目。KVQuant-1% のような mixed-precision（UP=×）でなく **uniform precision（UP=✓）で達成**しているのも実装上の利点。

> 注: Table 2（HumanEval / IFEval）・Table 3・line-retrieval(§4.1.2)・runtime overhead(§4.2) の数値は今回のHTML取得が Table 1 途中で打ち切られたため未確認。必要なら PDF を読んで追記する。

## 5. 位置づけ・focusとの接続

- **kv-cache-quant（focus tech）**の中で、「prefillベンチでの好成績 ≠ reasoningデコードでの好成績」という評価方法論そのものへの問題提起が新しい。pseudo-decode 評価は他手法の再評価にも使える枠組み。
- **rotation + dual-scale variance normalization** の組み合わせが新規（rotationは既存、VarNは重み量子化SINQからの移植だが「校正データ近似ではなく再構成誤差を直接下げる」という別理由づけ）。
- focus手法 **PolarQuant・TurboQuant** が baseline として明示比較され、2bit reasoning では KVarN に劣後。focus手法の「適用設定（prefill寄りか decode 寄りか）」を意識する材料になる。
- W23 の **HurwitzQuant**（タイムステップ間誤差累積の観点）と問題意識が並走。`related:` 候補。
- 実装: vLLM対応コード公開 <https://github.com/huawei-csl/KVarN>。Huawei CSL 製。

Sources:
- [arXiv:2606.03458v1 (abstract)](https://arxiv.org/abs/2606.03458)
- [arXiv:2606.03458v1 (HTML full text)](https://arxiv.org/html/2606.03458v1)
- [huawei-csl/KVarN (GitHub)](https://github.com/huawei-csl/KVarN)
