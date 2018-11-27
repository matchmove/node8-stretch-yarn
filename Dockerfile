FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor

RUN npm -g install yarn && yarn
