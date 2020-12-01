# Nodeイメージの取得
FROM node:14.4.0-alpine3.10
# ワーキングディレクトリの指定
WORKDIR /app
# パッケージをコピー(このファイルだけ別にして先にインストールしたほうが良い)
COPY package*.json ./
# npmのバージョン決定
RUN npm install
# エラー回避のため
RUN apk update && apk add \
    python\
    make\
    g++
# その他のファイルをコピー
COPY . .
# エラー回避のため
RUN npm rebuild
# 本当はいらないが開発環境でvue-cliを使っていたのでそこに含まれているパッケージを使っているようでwarnが出たので入れる
RUN npm install vue-cli -g
# ビルドします
RUN npm run build
# なくても良い
ENV HOST 0.0.0.0
# なくても良い
EXPOSE 3000
# 起動コマンド
CMD ["npm", "run", "start"]