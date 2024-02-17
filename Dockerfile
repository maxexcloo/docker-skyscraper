FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential git qt5-qmake qtbase5-dev qtbase5-dev-tools sudo wget xmlstarlet && \
    apt clean
RUN mkdir -p /app/skyscraper
RUN git clone https://github.com/Gemba/skyscraper.git /app/skyscraper
RUN cd /app/skyscraper
RUN git remote add maxexcloo https://github.com/maxexcloo/skyscraper.git
RUN git pull maxexcloo patch-1
RUN qmake
RUN make -j$(nproc)
RUN make install
ENTRYPOINT ["Skyscraper"]
WORKDIR /data
