FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor && apt-get install -y nginx

RUN npm -g install yarn && yarn

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.9.0/jet-linux_amd64_2.9.0.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_2.9.0.tar.gz
RUN chmod +x /usr/local/bin/jet

RUN apt-get update && apt-get install -y apt-transport-https && apt-get install -y ca-certificates && apt-get install -y curl && apt-get install -y software-properties-common && apt-get install -y gnupg2
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce
