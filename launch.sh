#!/bin/bash
export ROCKETCHAT_URL=http://rocketchat:3000
export ROCKETCHAT_USER=gitlab
export ROCKETCHAT_PASSWORD='12345'
export HUBOT_ADAPTER=rocketchat
export HUBOT_OWNER=RocketChat
export HUBOT_NAME='Gitlab'
export HUBOT_DESCRIPTION="Gitlab API bot"
export ROCKETCHAT_ROOM=general
export RESPOND_TO_DM=true
export RESPOND_TO_LIVECHAT=true
export LISTEN_ON_ALL_PUBLIC=true
export ROCKETCHAT_AUTH=password
export HUBOT_LOG_LEVEL=debug
export GITLAB_TOKEN='SET_YOUR_TOKEN_HERE'
export GITLAB_URL='https://gitlab.com'
bin/hubot -a rocketchat
