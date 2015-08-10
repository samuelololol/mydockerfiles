FROM ubuntu:15.04
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir -p /app &&\
    apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y \
        gfortran build-essential make gcc build-essential git-core curl wget \
        vim-tiny libsqlite3-dev sqlite3 libmysqlclient-dev python2.7 \
        python2.7-dev python2.7 python-pip \
        libxml2-dev libxslt-dev openssh-server \
        docker.io &&\
    pip install --upgrade pip &&\
    pip install \
        buildbot buildbot-slave pytest nose && \
    apt-get clean && \
    apt-get purge
EXPOSE 8010
ENTRYPOINT ["buildbot", "create-master", "-r"]
CMD ["/app"]
