FROM ubuntu:jammy
RUN apt update
RUN apt install -y build-essential qt5-qmake qtbase5-dev qtbase5-dev-tools wget
RUN mkdir /app
RUN cd /app
RUN wget -O - https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash
ENTRYPOINT Skyscraper
WORKDIR /data
