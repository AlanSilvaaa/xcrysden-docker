FROM ubuntu:18.04

WORKDIR /app

# Install dependencies for Xcrysden and python script
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
        python3 \
        python3-pip \
        zlib1g-dev \
        libjpeg-dev

# Install Python package
RUN pip3 install ase

# Download and extract Xcrysden
RUN wget http://www.xcrysden.org/download/xcrysden-1.6.2-linux_x86_64-shared.tar.gz

RUN tar -xf xcrysden-1.6.2-linux_x86_64-shared.tar.gz && \
    rm xcrysden-1.6.2-linux_x86_64-shared.tar.gz

# Clone the xcrysden-docker repository
RUN git clone https://github.com/AlanSilvaaa/xcrysden-docker

# Change working directory to the xcrysden-docker directory and copy the entrypoint script
WORKDIR /app/xcrysden-1.6.2-bin-shared
RUN chmod +x /app/xcrysden-docker/entrypoint.sh

ENTRYPOINT ["/app/xcrysden-docker/entrypoint.sh"]