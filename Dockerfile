FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential git qt5-qmake qtbase5-dev qtbase5-dev-tools sudo wget xmlstarlet && \
    apt clean
RUN mkdir -p /app/skyscraper && \
    git clone https://github.com/maxexcloo/skyscraper.git /app/skyscraper && \
    cd /app/skyscraper && \
    git checkout patch-1 && \
    qmake && \
    make -j$(nproc) && \
    make install
ENTRYPOINT ["Skyscraper"]
WORKDIR /data
