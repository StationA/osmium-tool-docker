FROM ubuntu:18.10

# Adapted from https://github.com/guillaumerose/osmium-tool-docker

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    libboost-program-options-dev \
    libboost-dev \
    libbz2-dev \
    zlib1g-dev \
    libexpat1-dev \
    libprotozero-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libsparsehash-dev \
    libosmium2-dev

WORKDIR /code
RUN git clone --branch "v1.9.1" --depth 1 https://github.com/osmcode/osmium-tool.git

WORKDIR /code/osmium-tool/build
RUN cmake ..
RUN make install

ENTRYPOINT ["/usr/local/bin/osmium"]
