# 現在(2022/08/03)サポートされている最新バージョン
FROM node:16
# FROM node:16-alpine

# 作業ディレクトリ
WORKDIR /workdir

# Firebase toolsのインストール
# RUN npm install firebase-functions@latest firebase-admin@latest --save
RUN npm install -g firebase-tools

# ポート
ENV HOST 0.0.0.0
EXPOSE 4000
EXPOSE 5000
EXPOSE 5001
EXPOSE 8080
EXPOSE 9005