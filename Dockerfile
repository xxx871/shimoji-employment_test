FROM node:20-alpine

# 要件を満たすようにDockerfileを編集してください。

# ヒント1：コマンドを実行するディレクトリを作成
WORKDIR /usr/src/app
# ヒント2：依存関係ファイルをコピー
COPY app/package*.json ./
# ヒント3：依存関係のインストール
RUN npm install
# ヒント4：アプリケーションのソースコードをコピー
COPY app ./
# ヒント5：ポートを公開
EXPOSE 3000
# ヒント6：npm run devを実行
CMD ["npm", "run", "dev"]

# メンテナーラベル
LABEL maintainer="Shimoji"