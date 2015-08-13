FROM ubuntu:15.10
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gfortran build-essential make gcc build-essential git-core curl wget mercurial subversion
RUN apt-get install -y python2.7-dev python2.7 python-pip python-virtualenv 
RUN apt-get install -y vim-tiny libsqlite3-dev sqlite3 libmysqlclient-dev postgresql libpq-dev 
RUN apt-get install -y libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
RUN apt-get install -y libxml2-dev libxslt-dev openssh-server
RUN pip install --upgrade pip
RUN pip install buildbot buildbot-slave pytest nose PyMySQL
RUN ["chmod", "755", "/usr/local/bin/buildbot"]
RUN ["buildbot", "create-master", "-r", "/app"]
ADD https://raw.githubusercontent.com/samuelololol/mydockerfiles/master/ubuntu-buildbot-master/master.cfg /app/master.cfg
RUN ["buildbot", "upgrade-master", "-r", "/app"]
RUN apt-get clean && apt-get purge
EXPOSE 8010

#buildbot create-master -r {BASDIR}
#ENTRYPOINT ["buildbot", "create-master", "-r"]
CMD ["buildbot", "start", "--nodaemon", "/app"]

# required
# COPY/ADD/BIND {BASEDIR} folder
# (option)
# BIND SSH_AUTH_SOCK
# BIND git repo volumn 

# run buildbot-master
# 
# $ docker run -d --name buildbotmaster -p 8010:8010 -p 9989:9989 ubuntu-buildbot-master

