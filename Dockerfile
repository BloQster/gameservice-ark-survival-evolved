FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl nano lsof lib32stdc++6 libc6-i386 lib32gcc1 cron

RUN useradd -m steam
USER steam
WORKDIR /home/steam
RUN mkdir steamcmd
WORKDIR /home/steam/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
WORKDIR /home/steam
USER root
RUN curl -sL http://git.io/vtf5N | bash -s steam
RUN systemctl disable arkmanager.service

VOLUME ["/home/steam/ARK-Staging", "/home/steam/ARK-Backups", "/etc/arkmanager", "/usr/local/share/arkmanager"]
#ENTRYPOINT ["echo"]
ADD "start.sh" "/home/steam/start.sh"
RUN chown steam:steam /home/steam/start.sh
RUN chmod 777 /home/steam/start.sh
# ENTRYPOINT ["arkmanager", "--verbose"]
# ENTRYPOINT ["bash"]
USER steam
CMD ["/home/steam/start.sh"]