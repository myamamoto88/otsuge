# README

## Otsuge

Slackに予約投稿するためのサービス

## Setup

direnvを使っているのであれば、.envrcに以下を設定する。

```
export GOOGLE_CLIENT_ID=
export GOOGLE_CLIENT_SECRET
export RAILS_ENV=
export SLACK_WEBHOOK_URL=
export SECRET_KEY_BASE=
```

イメージをビルド、DB作成

```shell
bin/setup
```

アセットのコンパイル ※ RAILS_ENV=productionの場合
```
docker-compose run server rails assets:precompile
```

## Start

```
docker-compose up
```
