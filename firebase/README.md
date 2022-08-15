## Firebase 関連

### Firebase のデプロイ先プロジェクトについて
- プロジェクトの確認
```
firebase projects:list
```

| Project Display Name | Project ID |
| --- | --- |
| pj-picbook-pro | pj-picbook  |
| pj-picbook-dev | pj-picbook-pro |
※ dev環境の ProjectID は pj-picbook-pro です

- プロジェクトの変更
```
firebase use <Project ID>
```

### デプロイ方法

- docker-composeがあるディレクトリに移動
```
cd firebase
```

- Dockerの起動
```
docker compose up
docker compose run -p 4000:4000 -p 5001:5001 -p 8080:8080 -p 9005:9005 firebase-cli-container ash

# 短縮コマンド
make up
make ash
```

- npmパッケージをインストール
```
yarn
```

- firebaseにログイン
```
firebase login
```

- デプロイ
```
firebase deploy
```

※ [--only ~~]で一部のみデプロイ可能。

```
例）firebase deploy --only functions
firebase deploy --only firestore:rules
```

- unit test実施
```
yarn test
```