FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY nest-cli.json tsconfig*.json ./
COPY src ./src

RUN npm run build


FROM node:22-alpine AS dependencies

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force


FROM node:22-alpine AS runtime

WORKDIR /app
ENV NODE_ENV=production

COPY --from=dependencies --chown=node:node /app/node_modules ./node_modules
COPY --from=build --chown=node:node /app/dist ./dist
COPY --chown=node:node package*.json ./

USER node

CMD ["node", "dist/main.js"]