FROM node:18-alpine3.16

WORKDIR /home/node/app

ENV PORT=3000

COPY package.json ./
COPY yarn.lock ./

RUN corepack enable && \
    yarn

COPY . .
RUN yarn run build

EXPOSE 3000/tcp

CMD ["yarn", "run", "start", "-p", "3000"]
