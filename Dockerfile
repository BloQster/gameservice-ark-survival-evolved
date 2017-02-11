FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl nano lsof libc6-i386 lib32gcc1
# curl lsof libc6-i386 lib32gcc1

RUN useradd -m steam
USER steam
WORKDIR /home/steam
RUN mkdir Steam
WORKDIR /home/steam/Steam
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
WORKDIR /home/steam
USER root
RUN curl -sL http://git.io/vtf5N | bash -s steam
RUN systemctl disable arkmanager.service
USER steam