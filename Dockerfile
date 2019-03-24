FROM ubuntu:16.04


ENV DEBIAN_FRONTEND=noninteractive

# Helpers
RUN apt-get update && apt-get install -y vim xterm pulseaudio cups 

RUN apt-get -y dist-upgrade 
RUN apt-get install -y  mate-desktop-environment-core firefox

RUN apt-get install -y wget

ADD nomachine_6.2.4_1_amd64.deb /

RUN dpkg -i /nomachine_6.2.4_1_amd64.deb 

RUN rm -rf /var/lib/apt/lists/*

RUN groupadd -r nomachine -g 433 && \
useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine && \
mkdir /home/nomachine && \
chown -R nomachine:nomachine /home/nomachine && \
echo 'nomachine:nomachine' | chpasswd

EXPOSE 4000

VOLUME [ "/home/nomachine" ]

ADD nxserver.sh /

RUN chmod +x /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]