FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential curl git qt5-qmake qtbase5-dev qtbase5-dev-tools sudo xmlstarlet && \
    apt clean
RUN mkdir -p /app/skyscraper
RUN cd /app/skyscraper
RUN curl https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | sh
RUN cd /app
ENTRYPOINT ["Skyscraper"]
WORKDIR /data
