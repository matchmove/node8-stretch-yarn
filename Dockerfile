FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor && apt-get install -y nginx

RUN npm -g install yarn && yarn
