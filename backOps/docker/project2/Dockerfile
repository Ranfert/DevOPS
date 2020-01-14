FROM ubuntu:trusty

ARG DEBIAN_FRONTEND=noninteractive

RUN echo exit 0 > /usr/sbin/policy-rc.d

RUN apt-get update

RUN apt-get -y install default-jdk \
&& apt-get -y install ntp \ 
&& apt-get -y install apache2

EXPOSE 80

