# Spot-Find

Iac(Pulumi) & MicroService & ServerLess で開発してみる<br>
Cloud は一旦 GCP で開始

# Requirement

- Pulumi

```
brew install pulumi/tap/pulumi
```

- gcloud

```
brew install --cask google-cloud-sdk
```

- nvm

```
brew install nvm
```

# Installation

```bash
make setup
```

# Command

```bash
// 各種環境コンテナのビルド・起動
docker-compose -f docker-compose.{env}.yaml up --build

// 起動中のコンテナに入る
docker exec -it {container-id} /bin/bash
```

# Author

- 作成者: yuya-morimoto
- E-mail: yuya-morimoto@spot-find.jp

# License

[MIT license](https://github.com/yuya-morimoto/spot-find/blob/main/LICENSE)
