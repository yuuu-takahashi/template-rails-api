# template-rails-api

RailsのAPIテンプレート

## 使用技術

- **Ruby**: プログラミング言語
- **Rails**: Ruby製のWebアプリケーションフレームワーク
- **MySQL**: データベース管理システム
- **Prettier**: コードフォーマッター
- **RuboCop**: Rubyのコード品質管理ツール
- **Docker**: コンテナー管理ツール
- **Ruby LSP**: エディター補完と静的解析
- **rswag**: Swagger仕様でAPIドキュメントを生成するためのGem

## 開発環境構築

このプロジェクトでは **Docker** を利用して開発環境を構築します。

### 前提条件

- Docker Desktopをインストール
- Visual Studio Code(VS Code)とRemote-Containers拡張機能をインストール

### セットアップ手順

1. リポジトリをクローンします。

    ```bash
    git clone git@github.com:yumatakahashi/template-rails-api.git
    cd template-rails-api
    ```

2. VS CodeでReopen in Containerを選択して、Dev Containerを開く

## 開発サーバーの起動 (Dev Container内)

開発サーバーを起動するには、Dev Container内で以下のコマンドを実行します

```bash
bundle exec rails s
```

開発サーバーは <http://localhost:3000> で確認できます

## テスト方法 (Dev Container内)

以下のコマンドを実行してテストを実行します

```bash
bundle exec rspec
```

## APIドキュメント生成方法 (Dev Container内)

Swaggerを使用してAPIのドキュメントを生成します。以下のコマンドでAPIドキュメントを生成できます。

```bash
bundle exec rake rswag:specs:swaggerize
```

APIドキュメントは <http://localhost:3000/api-docs> で確認できます

## デプロイ、リリース方法

TODO:
