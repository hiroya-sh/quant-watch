# Local Setup — quant-watch (launchd)

**対応OS: macOS のみ** (launchd / pmset wake を使用するため)

Anthropicクラウド経由のRoutineが組織ポリシーで使えないので、ローカルlaunchdで実行する構成。

## 配置

### 1. run.sh をrepoに追加

```bash
# このzipの scripts/run.sh を repoの scripts/ にコピー
mkdir -p ~/path/to/quant-watch/scripts
cp scripts/run.sh ~/path/to/quant-watch/scripts/run.sh
chmod +x ~/path/to/quant-watch/scripts/run.sh

# .gitignore に追加(ログをcommitしないため)
cd ~/path/to/quant-watch
echo ".logs/" >> .gitignore

# commit
git add scripts/run.sh .gitignore
git commit -m "Add local run script"
git push
```

### 2. plistを編集して LaunchAgents に配置

```bash
# パスを実際の場所に置換
sed -i '' "s|/ABSOLUTE/PATH/TO/quant-watch|$HOME/path/to/quant-watch|g" \
    com.quant-watch.plist

# LaunchAgents に配置
mv com.quant-watch.plist ~/Library/LaunchAgents/

# 配置確認
cat ~/Library/LaunchAgents/com.quant-watch.plist | grep run.sh
# 正しい絶対パスが入っていることを確認
```

### 3. launchd にロード

```bash
launchctl load ~/Library/LaunchAgents/com.quant-watch.plist

# 確認
launchctl list | grep quant-watch
# com.quant-watch が表示されればOK
```

### 4. pmset wake を設定

```bash
# 毎週月曜 07:55 にスリープから自動起床
sudo pmset repeat wake M 07:55:00

# 確認
pmset -g sched
# Repeating power events: wakeorpoweron at 07:55:00 every Mon と表示されればOK
```

## テスト

### 動作確認(手動実行)

スケジュールを待たずにスクリプト単体で動くか確認:

```bash
~/path/to/quant-watch/scripts/run.sh
```

成功すれば quant-watch リポジトリに claude/week-2026-WXX ブランチとPRが作成されているはず。

### launchd経由のテスト

スケジュール時刻に頼らず手動でジョブを発火:

```bash
launchctl start com.quant-watch

# ログ確認
tail -f /tmp/quant-watch.launchd.stdout.log
tail -f /tmp/quant-watch.launchd.stderr.log
tail -f ~/path/to/quant-watch/.logs/$(ls -t ~/path/to/quant-watch/.logs/ | head -1)
```

これが成功すれば、月曜 08:00 に自動発火する状態。

## トラブルシューティング

### launchctl load 時にエラー

`Bootstrap failed` 等が出る場合:

```bash
# 一度unloadしてから再load
launchctl unload ~/Library/LaunchAgents/com.quant-watch.plist
launchctl load ~/Library/LaunchAgents/com.quant-watch.plist
```

### スクリプトが claude を見つけられない

launchd起動時の PATH が最小限なため。`run.sh` 内で PATH 補強してるが、 `claude` の場所が変則的なら以下を追記:

```bash
export PATH="/path/to/claude/binary:$PATH"
```

### `Operation not permitted` で run.sh が実行できない（重要）

launchd 経由でだけ `bash: .../run.sh: Operation not permitted` が出る場合、原因は
macOS の TCC（プライバシー保護）。`~/Documents` `~/Desktop` `~/Downloads` `iCloud Drive`
は保護フォルダで、launchd が起動したプロセスには既定でアクセス権が無い（手動実行は
Terminal の権限を継承するので動く）。

`/bin/bash` をフルディスクアクセスに追加する回避策は、launchd の TCC 帰属では
**安定して尊重されず効かないことが多い**。確実な解決は **repo を保護フォルダの外に置く**こと:

```bash
launchctl unload ~/Library/LaunchAgents/com.hiroya.quant-watch.plist
mv ~/Documents/quant-watch ~/quant-watch          # ホーム直下は非保護
# ラッパー(~/bin/quant-watch-launch.sh)の exec パスを新しい場所へ更新
launchctl load ~/Library/LaunchAgents/com.hiroya.quant-watch.plist
launchctl start com.hiroya.quant-watch
```

`run.sh` は自分の位置から REPO_DIR を自動検出するため編集不要。移動後は Obsidian の
vault を新パスで開き直す。**最初から `~/Documents` 以外に置くのが推奨。**

### pmset wake が効かない

- MacBookは電源接続必須(バッテリ駆動だと wake しない設定がデフォルト)
- システム設定 → バッテリー → オプション → 「電源アダプタ接続時にディスプレイをオフにする」が原因の場合あり
- Apple Siliconの一部モデルではwakeが不安定。launchdの取り逃し補完に頼る運用でカバー

### 設定変更後の反映

plistを編集した場合は unload → load が必要:

```bash
launchctl unload ~/Library/LaunchAgents/com.quant-watch.plist
launchctl load ~/Library/LaunchAgents/com.quant-watch.plist
```

## 停止/削除

一時停止:

```bash
launchctl unload ~/Library/LaunchAgents/com.quant-watch.plist
```

完全削除:

```bash
launchctl unload ~/Library/LaunchAgents/com.quant-watch.plist
rm ~/Library/LaunchAgents/com.quant-watch.plist
sudo pmset repeat cancel
```
