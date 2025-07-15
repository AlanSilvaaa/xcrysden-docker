FROM ubuntu:18.04

WORKDIR /app

RUN apt-get update && \
    apt install tk libglu1-mesa libtogl2 libfftw3-3 libxmu6 imagemagick openbabel libgfortran5 wget -y

RUN wget http://www.xcrysden.org/download/xcrysden-1.6.2-linux_x86_64-shared.tar.gz

RUN tar -xf xcrysden-1.6.2-linux_x86_64-shared.tar.gz && \
    rm xcrysden-1.6.2-linux_x86_64-shared.tar.gz

WORKDIR /app/xcrysden-1.6.2-bin-shared

CMD ["./xcrysden"]