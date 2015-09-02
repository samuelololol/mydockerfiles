FROM scivm/scientific-python-2.7
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir -p /app
WORKDIR /app
ONBUILD RUN pip install -r requirements.txt
RUN apt-get install -y sox portaudio19-dev libatlas-base-dev gfortran &&\
    pip install --upgrade pip &&\
    pip install \
    --allow-external pyaudio \
    --allow-unverified pyaudio pyaudio \
    matplotlib numpy scipy requests pytest bottle BeautifulSoup celery[redis]
ONBUILD COPY . /app
#CMD ["celery", "-A", "tasks", "worker", "--loglevel=debug"]

