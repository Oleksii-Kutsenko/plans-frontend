FROM node:lts-alpine3.16 as builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build && npm prune --production

FROM node:lts-alpine3.16 as runner
USER node:node

WORKDIR /app
COPY --from=builder --chown=node:node /app/build ./build
COPY --from=builder --chown=node:node /app/node_modules ./node_modules
COPY --chown=node:node package.json .

ENV PORT 3000
EXPOSE 3000

CMD ["npm", "run", "dev", "--", "--open"]