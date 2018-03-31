FROM node:alpine

LABEL mantainer "Diego Dorgam <diego.dorgam@rocket.chat>"

ENV LISTEN_ON_ALL_PUBLIC=true RESPOND_TO_EDITED=true HUBOT_OWNER=RocketChat RESPOND_TO_DM=true HUBOT_LOG_LEVEL=debug 

RUN apk --update add --no-cache git && \
    npm install -g coffee-script hubot yo generator-hubot && \
    addgroup -S hubot && adduser -S -g hubot hubot

WORKDIR /home/hubot/bot

RUN mkdir -p /home/hubot/.config/configstore && \
  echo "optOut: true" > /home/hubot/.config/configstore/insight-yo.yml && \
  chown -R hubot:hubot /home/hubot

USER hubot

RUN /usr/local/bin/yo hubot --adapter ${HUBOT_ADAPTER} --owner ${HUBOT_OWNER} --name ${HUBOT_NAME} --description ${HUBOT_DESCRIPTION} --defaults --no-insight

COPY ["package.json", "index.coffee", "/home/hubot/bot/"]

ADD scripts/ /home/hubot/bot/scripts/

USER root
RUN chown -R hubot:hubot /home/hubot

USER hubot

RUN npm install && rm external-scripts.json hubot-scripts.json

ENTRYPOINT /home/hubot/bot/bin/hubot -a rocketchat
