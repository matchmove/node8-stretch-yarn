FROM node:8.12.0-stretch

RUN apt-get update && apt-get install -y awscli && apt-get install -y supervisor && apt-get install -y nginx

RUN npm -g install yarn && yarn

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.9.0/jet-linux_amd64_2.9.0.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_2.9.0.tar.gz
RUN chmod +x /usr/local/bin/jet

RUN apt install -y curl apt-transport-https \
    software-properties-common ca-certificates

# Install docker.
RUN curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
RUN add-apt-repository "deb https://apt.dockerproject.org/repo/ \
debian-$(lsb_release -cs) \
testing"

RUN apt-get update -y
RUN apt-get install -y docker-engine

# Run docker.
RUN systemctl start docker
