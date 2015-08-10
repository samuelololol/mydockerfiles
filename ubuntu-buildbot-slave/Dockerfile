FROM ubuntu:15.10
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir -p /app &&\
    apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y \
        gfortran build-essential make gcc build-essential git-core curl wget \
        vim-tiny libsqlite3-dev sqlite3 libmysqlclient-dev python2.7 \
        libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
        python2.7-dev python2.7 python-pip python-virtualenv \
        libxml2-dev libxslt-dev openssh-server &&\
    pip install --upgrade pip &&\
    pip install \
        buildbot buildbot-slave pytest nose && \
    apt-get clean && \
    apt-get purge
EXPOSE 9989

#buildslave create-slave -r {BASEDIR} {MASTERHOST}:{PORT} {SLAVENAME} {PASSWORD}
ENTRYPOINT ["buildbot", "create-slave", "-r"]
CMD ["/app", "$DOCKER_MASTER_URL:$DOCKER_MASTER_PORT", "$DOCKER_SLAVE_NAME", "DOCKER_SLAVE_PASSWORD"]

# required
# COPY/ADD/BIND {BASEDIR} folder
# (option)
# BIND git repo volumn 

