FROM ubuntu:14.04

MAINTAINER Saffi <saffi.h@gmail.com>
ENV container docker

# Add resolv.conf
#nameserver 8.8.8.8
#nameserver 8.8.8.4
ADD code/etc /etc
# build base supervisor with resolve.conf
# append with apt-get clean for reducing image size in build.
# descendent images would have ADD at end for faster build due to reuse. The current image must have that at start due to DNS.
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    apt-get install -y build-essential git  supervisor && apt-get clean
