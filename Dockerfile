FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor && apt-get install -y nginx

RUN npm -g install yarn && yarn

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.9.0/jet-linux_amd64_2.9.0.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_2.9.0.tar.gz
RUN chmod +x /usr/local/bin/jet

RUN apt-get install -y apt-transport-https dirmngr
RUN echo 'deb https://apt.dockerproject.org/repo debian-stretch main' >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys F76221572C52609D
RUN apt-get update
RUN apt-get install -y docker-engine
