# pulse-x-ios

# Requirement

- Version 14.2 (14C18)
- Swift5.x
- apollo

```bash
# Apollo
nvm install v18
npm install -g apollo
```

# SetUp

```
projectを右クリック
Install CLIでApollo Cliのシンボリックリンク生成
```

```
// localhost:3000よりschemaのダウンロードを行う
// 切り替える場合はエンドポイントを切り替えて実行する
make download-schema
```

```
// ダウンロードしたschemaからSwiftファイルを生成する
// Schema更新時にコマンドを実行して最新状態に置き換える
make apollo-generate
```

```
// もしフォルダやファイルがXcode上で表示されない場合
File > Add File to "..."より対象のフォルダまたはファイルを追加する(Copy items if neededにチェック)
```
