FROM ubuntu:18.04

WORKDIR /app

RUN apt-get update && \
    apt install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt install -y \
        tk \
        libglu1-mesa \
        libtogl2 \
        libfftw3-3 \
        libxmu6 \
        imagemagick \
        openbabel \
        libgfortran5 \
        wget \
        git \
        python

RUN wget http://www.xcrysden.org/download/xcrysden-1.6.2-linux_x86_64-shared.tar.gz

RUN tar -xf xcrysden-1.6.2-linux_x86_64-shared.tar.gz && \
    rm xcrysden-1.6.2-linux_x86_64-shared.tar.gz

RUN git clone https://github.com/AlanSilvaaa/xcrysden-docker

WORKDIR /app/xcrysden-1.6.2-bin-shared

CMD ["/bin/bash"]