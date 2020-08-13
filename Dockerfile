FROM ubuntu:latest

RUN apt-get update && apt-get install -y git build-essential \
    && git clone https://github.com/vakuum/tcptunnel.git \
    && cd tcptunnel \
    && git reset --hard cb8917540143d70252608a12f5fcafa762380270 \
    && ./configure \
    && make

WORKDIR tcptunnel

CMD ./tcptunnel --local-port=443 --remote-port=8443 --remote-host=bot.lucaszanella.com --stay-alive
#CMD ls && ./tcptunnel --version
