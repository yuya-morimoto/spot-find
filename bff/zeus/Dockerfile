FROM node:18.16.0-alpine3.17 AS dependency
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:18.16.0-alpine3.17 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
RUN npm i -g @nestjs/cli
COPY . .
RUN npm run build

FROM node:18.16.0-bullseye-slim AS runner
WORKDIR /app
ENV NODE_ENV production
COPY --from=builder /app/dist ./dist
COPY --from=dependency /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]