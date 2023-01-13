FROM node:14-alpine3.17

RUN npm i -g @nestjs/cli

WORKDIR /srv/app

COPY package*.json ./

RUN npm install

COPY . .

RUN deluser --remove-home node \
    && addgroup -S node -g 1000 \
    && adduser -S -G node -u 1000 node

EXPOSE 8080

#CMD ["npm", "start"]

USER node
