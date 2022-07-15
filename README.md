## アプリ概要

### 画面設計(TBD)
- figma:ユーザーフロー
  - https://www.figma.com/file/LFlpRBi5CMWRJNMCnElqaY/picbook?node-id=15%3A95

### スキーマ定義
![](docs/modeling.drawio.png)
- 図はdart上でのEntityとしての持ち方。
- 詳細なスキーマについては[docs/schema.yml](docs/schema.yml)を参照。

### フォルダ構成(TBD)
- TODO



## プロジェクト進行について

### 開発環境
- TODO

### 全体のタスク管理
- GitHub Projectsを用いて行う。カンバン方式
  - [ver 1.0](https://github.com/pj-picbook/picbook/projects/1)
- 初期資料
  - https://docs.google.com/spreadsheets/d/1l_Nu-918y9GVZ78cG5aG6ptdbY0iy-jf/edit#gid=1807751388

### Issueの立て方
New Issue をクリックすると 5 つのテンプレートがあります(salon_app の丸パクリ)  
それぞれ使い方や例が書いてあるのでそれにならって記載してください。  
質問なども Issue で立てていただけるとありがたいです

### ブランチ運用
Git Flow に沿って開発を行う(ツールは使わない)  
- 参考
  - [Git-flowって何？ - Qiita](https://qiita.com/KosukeSone/items/514dd24828b485c69a05)
  - [共同開発時のgithubの使い方（ブランチの作り方、マージの仕方、コンフリクトの解消方法）- vimeo(Flutter大学限)](https://vimeo.com/showcase/7431597/video/441969458)
- 基本的な流れ
  - main ブランチと develop ブランチが常に存在し、保護しておく
  - 機能を追加するときは develop ブランチから featureブランチを作成する
    - ブランチの名前は feature/#(issue 番号)\_わかりやすい名前
    - 作業が終わったら feature ブランチから develop ブランチへのPR(プルリクエスト)を作成する
    - PRを誰かがレビューし、LGTMが付けばMergeする
- 各ブランチについて
  - main
    - リリースされたアプリの状態と同期させる。直接の変更不可。PRからのマージのみ。
    - releaseブランチ or hotfixブランチからマージされ、バージョンが変更されるはずなので、mainへマージされた再はバージョンに合わせてタグを付与する
  - develop
    - 開発するためのブランチ。直接の変更不可。PRからのマージのみ。
    - developブランチでは常にビルドが通る状態にしておく。
  - feature
    - 機能追加の際に作成するブランチ。
    - developブランチから`feature/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはdevelopブランチをターゲットとする。
  - release
    - developブランチからmainブランチへ変更を取り込み、リリースを行う際に作成されるブランチ。
    - developブランチから`release/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはmainブランチをターゲットとする。
    - マージ後はリリース作業 & developブランチへもマージする。
  - hotfix
    - mainブランチで見つかったバグに対して修正したい場合に用いる
    - mainブランチから`hotfix/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはmainブランチをターゲットとする。
    - マージ後はリリース作業 & developブランチへもマージする。
- バージョニングについて
  - 一般的なセマンティックバージョニングを採用する
    - [セマンティック バージョニング 2.0.0 | Semantic Versioning](https://semver.org/lang/ja/)
  - 形式：`1.2.3` major.miner.patch
    - major
      - 大きな機能変更、後方互換性がない変更を行った際にインクリメントする
    - miner
      - 機能追加等の際にインクリメントする
    - patch
      - バグ修正などを行った場合にインクリメントする
      


## 事前の準備

### gitのレポジトリをクローンする方法
- git clone https://github.com/pj-picbook/picbook

### FVM（Flutter Version Management）のインストール方法
- Mac https://zenn.dev/riscait/articles/flutter-version-management
- Windows https://qiita.com/idani/items/0e45d037b4c2a93840a7
