FROM scivm/scientific-python-2.7
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir -p /app
WORKDIR /app
ONBUILD COPY . /app
ONBUILD RUN pip install -r requirements.txt
RUN apt-get install -y sox portaudio19-dev libatlas-base-dev gfortran \
    build-essential python-dev libffi-dev libssl-dev &&\
    pip install --upgrade pip &&\
    pip install \
    --allow-external pyaudio \
    --allow-unverified pyaudio pyaudio gevent \
    matplotlib numpy scipy requests[security] pytest bottle BeautifulSoup celery[redis]
#pyopenssl ndg-httpsclient pyasn1 
#CMD ["celery", "-A", "tasks", "worker", "--loglevel=debug"]

