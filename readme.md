### node.js のパッケージのインストール

環境設定のため、初回に1度だけ実行してください。

```
$ npm i
```

### gulp起動

```
$ gulp
```

(終了は `control + c`)

### gulp設定の説明

- 設定ファイルは `gulpfile.coffee` にあります
- SCSS の監視・自動コンパイルと browser-sync の起動のみ行っています
  - SCSS のコンパイル時に、autoprefix処理と sourcemap の出力も行います
- SCSS ファイルは `/src/styles/` 内に配置し、コンパイル結果は `/assets/css/` に出力されます
- browser-sync は自動的にブラウザを立ち上げ、html や css が変更されるたびにブラウザを自動でリロードします
