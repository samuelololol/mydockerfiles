FROM scivm/scientific-python-2.7
MAINTAINER samuelololol <samuelololol@gmail.com>

RUN mkdir -p /app &&\
    apt-get install -y sox portaudio19-dev libatlas-base-dev gfortran &&\
    pip install --upgrade pip &&\
    pip install \
    --allow-external pyaudio \
    --allow-unverified pyaudio pyaudio \
    matplotlib numpy scipy requests pytest bottle BeautifulSoup

WORKDIR /app
#EXPOSE 8080
#ENTRYPOINT ["python", "mini_server.py"]
#CMD ["asdf"]

