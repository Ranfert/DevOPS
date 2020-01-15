FROM ubuntu:trusty

ARG DEBIAN_FRONTEND=noninteractive

RUN echo exit 0 > /usr/sbin/policy-rc.d

RUN apt-get update

RUN apt-get -y install default-jdk \
&& apt-get -y install ntp \ 
&& apt-get -y install apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

CMD ["/usr/sbin/apache2","-D","FOREGROUND"]
