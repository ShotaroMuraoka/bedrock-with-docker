# bedrock-with-docker
## Overview
WordPressのボイラープレートである、[bedrock](https://roots.io/bedrock/)をDocker環境で使えるようにしたものです。

## How to use
1. このリポジトリをcloneする
1. `bedrock` 配下で `composer install`
1.  `cp .env.example .env`
1. データベースの接続情報を追記する
1. gitルートで `docker-compose -f docker-compose.local.yml up -d`
1. http://localhost:8082 にアクセス