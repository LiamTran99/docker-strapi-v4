FROM node:14-alpine3.16

# # Let WatchTower know to ignore this container for checking
# LABEL com.centurylinklabs.watchtower.enable="false"

WORKDIR /srv/app

COPY ./app/package*.json ./app/yarn.lock ./

RUN yarn

COPY ./app .

# # ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
