FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor && apt-get install -y nginx

RUN npm -g install yarn && yarn

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.9.0/jet-linux_amd64_2.9.0.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_2.9.0.tar.gz
RUN chmod +x /usr/local/bin/jet
