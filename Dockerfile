FROM ubuntu:14.04

MAINTAINER Saffi <saffi.h@gmail.com>
ENV container docker

# Add resolv.conf
#nameserver 8.8.8.8
#nameserver 8.8.8.4
ADD code/etc/resolv.conf /etc/reslov.conf

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq \
  && apt-get install -y build-essential git supervisor \
  && apt-get clean

RUN mkdir -p /root/scripts
WORKDIR /root/scripts

# the 3 lines are self contained, todo make the two Run commands. one.
ADD code/scripts/buildssh.sh /root/scripts/
RUN chmod +x buildssh.sh
RUN ./buildssh.sh


# keep changes last for fast build
ADD code/etc /etc
RUN chmod +x /etc/supervisor/*.sh
# expose if ssh needed - or in dev.
#EXPOSE 22
CMD ["-c", "/etc/supervisor/start.sh"]
ENTRYPOINT ["bash", "--verbose", "-i","-s"]

