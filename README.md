# PulseX

IaC(Pulumi) & MicroService & ServerLess & BFF Pattern で開発してみる<br>
Cloud は一旦 GCP で開始

# Requirement

- infra/kronos

  - Pulumi
    - `brew install pulumi/tap/pulumi`
  - Node(v16)
    - `nvm use`

- MS
  - none
- BFF
  - zeus
    - Node(v18.16.0)
      - `nvm use`
    - NestCli
      - `npm install -g @nestjs/cli`
- Client
  - ios
    - Xcode(Version 14.2 (14C18))
    - Swift5.x
    - apollo
- Other
  - Docker
  - nvm
    - `brew install nvm`
  - git
  - gcloud
    - `brew install --cask google-cloud-sdk`

# SetUp

```bash
#ローカルコミットメッセージのチェックを追加
make setup
```

# Command

```bash
// 各種環境コンテナの起動
docker-compose -f docker-compose.{env}.yaml up

// 起動中のコンテナに入る
docker exec -it {container-id} /bin/bash
```

# Author

- 作成者: yuya-morimoto
- E-mail: yuya-morimoto@zero-hack.jp

# License

[MIT license](https://github.com/yuya-morimoto/pulse-x/blob/main/LICENSE)
