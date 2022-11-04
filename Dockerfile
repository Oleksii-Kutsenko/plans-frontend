FROM node:19-alpine AS build

WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM node:19-alpine as deploy-node

WORKDIR /app
RUN rm -rf ./*
COPY --from=build /app/package.json .
COPY --from=build /app/build .
RUN yarn --prod
CMD ["node", "index.js"]