FROM selenium/standalone-chrome
MAINTAINER samuelololol<samuelololol@gmail.com>
ONBUILD RUN mkdir -p /app
ONBUILD WORKDIR /app
ONBUILD COPY . /app
ONBUILD RUN pip install -r requirements.txt
RUN sudo apt-get update &&\
    sudo apt-get install -y python-sklearn python-dev python-pip python-pyaudio sox portaudio19-dev libatlas-base-dev &&\
    sudo pip install --upgrade pip &&\
    sudo pip install pyaudio gevent matplotlib numpy scipy requests pytest bottle BeautifulSoup celery[redis]
