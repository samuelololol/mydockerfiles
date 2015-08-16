FROM ubuntu:15.10
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gfortran build-essential make gcc build-essential \
                       vim-tiny git-core curl wget mercurial subversion \
                       python2.7-dev python2.7 python-pip python-virtualenv \
                       libsqlite3-dev sqlite3 libmysqlclient-dev postgresql \
                       libpq-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev \
                       libxml2-dev libxslt-dev openssh-server gettext unzip \
                       docker.io docker-compose && \
    pip install --upgrade pip && \
    pip install buildbot buildbot-slave pytest nose PyMySQL docker-py && \
    chmod 755 /usr/local/bin/buildbot && \
    chmod 755 /usr/local/bin/buildslave && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt-lists/*

