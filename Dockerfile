FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential git qt5-qmake qtbase5-dev qtbase5-dev-tools sudo wget xmlstarlet && \
    apt clean
RUN mkdir -p /app/skyscraper
RUN cd /app/skyscraper
RUN wget -O - https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash
RUN cd /app
ENTRYPOINT ["Skyscraper"]
WORKDIR /data
