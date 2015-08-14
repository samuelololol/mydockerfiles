FROM ubuntu:15.10
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gfortran build-essential make gcc build-essential git-core curl wget mercurial subversion
RUN apt-get install -y python2.7-dev python2.7 python-pip python-virtualenv 
RUN apt-get install -y vim-tiny libsqlite3-dev sqlite3 libmysqlclient-dev postgresql libpq-dev 
RUN apt-get install -y libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
RUN apt-get install -y libxml2-dev libxslt-dev openssh-server
RUN apt-get install -y docker.io
RUN pip install --upgrade pip
RUN pip install buildbot buildbot-slave pytest nose PyMySQL
RUN ["chmod", "755", "/usr/local/bin/buildbot"]
RUN ["chmod", "755", "/usr/local/bin/buildslave"]

