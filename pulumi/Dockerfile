# Pulumi Client
# image: https://hub.docker.com/layers/library/node/16-bullseye-slim/images/sha256-0b889cbf70af3740c8caaee425be6a26f2e7f3ceffdb94a83b6d236eea1b421e?context=explore

FROM node:16-bullseye-slim

RUN curl -fsSL https://get.pulumi.com | bash

ENV PATH="/root/.pulumi/bin:${PATH}"

WORKDIR /app

COPY . .

RUN npm install

ENTRYPOINT [ "pulumi" ]