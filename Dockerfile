FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential git qt5-qmake qtbase5-dev qtbase5-dev-tools sudo wget xmlstarlet && \
    apt clean
RUN mkdir -p /app
RUN cd /app
RUN git clone https://github.com/Gemba/skyscraper.git
RUN cd /app/skyscraper
RUN bash update_skyscraper.sh
RUN cd /app
ENTRYPOINT ["Skyscraper"]
WORKDIR /data
