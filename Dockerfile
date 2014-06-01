FROM ubuntu:14.04

MAINTAINER Saffi <saffi.h@gmail.com>
ENV container docker

# Add resolv.conf
#nameserver 8.8.8.8
#nameserver 8.8.8.4
ADD code/etc /etc
# build base python and supervisor. opensssh
# apped with apt-get clean for reducing image size in build.
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    apt-get install -y build-essential git  supervisor && apt-get clean
