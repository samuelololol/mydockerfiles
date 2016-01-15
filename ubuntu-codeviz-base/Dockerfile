FROM ubuntu:14.04
MAINTAINER samuelololol <samuelololol@gmail.com>
COPY install_gcc-4.6.2.sh /root/
RUN apt-get update && \
    apt-get build-dep -y gcc-4.6-base && \
    apt-get install -y ncftp wget && \
    cd /usr/include && ln -s x86_64-linux-gnu/* .; \
    cd /usr/lib && ln -s x86_64-linux-gnu/crt* .; \
    cd /root/ && wget http://www.csn.ul.ie/~mel/projects/codeviz/codeviz-1.0.12.tar.gz && \
    cd /root/ && tar zxf codeviz-1.0.12.tar.gz && \
    cp /root/install_gcc-4.6.2.sh /root/codeviz-1.0.12/compilers/install_gcc-4.6.2.sh && \
    cd /root/codeviz-1.0.12/ && ./configure && make && make install && \
    rm -rf /root/codeviz-1.0.12 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt-lists/*
