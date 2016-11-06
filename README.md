# README

## Otsuge

Slackに予約投稿するためのサービス

## Setup

direnvを使っているのであれば、.envrcに以下を設定する。

```
export SLACK_API_KEY=
export SLACK_API_SECRET=
export RAILS_ENV=
export SLACK_WEBHOOK_URL=
export SECRET_KEY_BASE=
```

イメージをビルド
```
docker-compose build
```

DB作成
```
docker-compose up -d database
docker-compose run server rails db:setup db:migrate
```

アセットのコンパイル
```
docker-compose run server rails assets:precompile
```

## Start

```
docker-compose up
```
