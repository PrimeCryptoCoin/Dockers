FROM ubuntu:22.04

LABEL maintainer="Asimov"
LABEL version="1.0.2"
LABEL description="Primeai blockbook docker "

ARG DEBIAN_FRONTEND=nointeractive
RUN apt update
RUN apt-get install -y curl

COPY ./blockbook.sh /
RUN chmod 755 /blockbook.sh

WORKDIR /root

RUN curl -LJO https://github.com/PrimeaiProject/blockbook/releases/download/4.0.0.1/backend-primeai_1.0.2.0-primeai-dev_amd64.deb
RUN curl -LJO https://github.com/PrimeaiProject/blockbook/releases/download/4.0.0.1/blockbook-primeai_0.4.0_amd64.deb

RUN apt install -y ./backend-primeai_1.0.2.0-primeai-dev_amd64.deb 
RUN apt install -y ./blockbook-primeai_0.4.0_amd64.deb 

WORKDIR /data
VOLUME /data

EXPOSE 9168

ENTRYPOINT ["/bin/sh", "-c" , "/blockbook.sh"]