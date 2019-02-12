FROM ubuntu:trusty

# prevent dpkg errors
ENV TERM=xterm-256color

# set mirrors to NZ
RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list
 

 RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get install -y nodejs

COPY . /app

WORKDIR /app

RUN npm install -g mocha && \
    npm install 

ENTRYPOINT ["mocha"]
