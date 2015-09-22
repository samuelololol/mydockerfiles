from nodesource/vivid
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir /app &&\
    apt-get update
RUN apt-get install -y git wget &&\
    cd /app &&\
    git clone https://github.com/webpro/reveal-md &&\
    cd /app/reveal-md &&\
    npm install -g &&\
    wget https://github.com/samuelololol/mydockerfiles/raw/master/ubuntu-reveal-md/go.sh &&\
    chmod 755 go.sh

WORKDIR /app/reveal-md
ENTRYPOINT ["/app/reveal-md/go.sh", "/app/reveal-md/demo"]
CMD ["--theme", "solarized"]
