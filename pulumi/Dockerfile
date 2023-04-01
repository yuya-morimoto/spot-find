# Pulumi Client

FROM node:16-slim

RUN curl -fsSL https://get.pulumi.com | bash

ENV PATH="/root/.pulumi/bin:${PATH}"

WORKDIR /app

COPY . .

RUN npm install

ENTRYPOINT [ "pulumi" ]