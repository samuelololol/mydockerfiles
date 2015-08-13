#FROM ubuntu:15.10
#MAINTAINER samuelololol <samuelololol@gmail.com>
#
#RUN mkdir -p /app &&\
#    apt-get update &&\
#    apt-get upgrade -y &&\
#    apt-get install -y \
#        gfortran build-essential make gcc build-essential git-core curl wget \
#        vim-tiny libsqlite3-dev sqlite3 libmysqlclient-dev python2.7 \
#        libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
#        python2.7-dev python2.7 python-pip python-virtualenv \
#        libxml2-dev libxslt-dev openssh-server \
#        docker.io &&\
#    pip install --upgrade pip &&\
#    pip install \
#        buildbot buildbot-slave pytest nose && \
#    apt-get clean && \
#    apt-get purge
#EXPOSE 9989
#
##buildslave create-slave -r {BASEDIR} {MASTERHOST}:{PORT} {SLAVENAME} {PASSWORD}
#ENTRYPOINT ["buildbot", "create-slave", "-r"]
#CMD ["/app", "$DOCKER_MASTER_URL:$DOCKER_MASTER_PORT", "$DOCKER_SLAVE_NAME", "DOCKER_SLAVE_PASSWORD"]
#
## required
## COPY/ADD/BIND {BASEDIR} folder
## BIND docker domain socket
## (option)
## BIND SSH_AUTH_SOCK
## BIND git repo volumn 
#

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
RUN apt-get install -y docker.io
RUN ["chmod", "755", "/usr/local/bin/buildslave"]
RUN ["buildslave", "create-slave", "--umask=022", "/app", "buildbotmaster:9989", "example-slave", "pass"]
RUN apt-get clean && apt-get purge
CMD ["buildslave", "start", "--nodaemon", "/app"]



# run buildbot-master
#
# $ docker run -d --name buildbotslave --link buildbotmaster:buildbotmaster -p 8010:8010 -p 9989:9989 # ubuntu-buildbot-slave
