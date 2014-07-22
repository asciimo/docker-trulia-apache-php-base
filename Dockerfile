# FE apache php base container
# base off of ubuntu for now
FROM ubuntu

MAINTAINER Hinling Yeung

# Make DEBIAN_FRONTEND less chatty
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND newt

# Update the default application repository sources list
RUN apt-get update

# Install apache 2
RUN apt-get -y install apache2

# Install php5
RUN apt-get -y install php5 libapache2-mod-php5

# Install mysql client
RUN apt-get -y install libapache2-mod-auth-mysql php5-mysql mysql-client

# Install PEAR
RUN apt-get -y install php-pear

# Install phpmods
RUN pear upgrade --force pear
RUN pecl install stomp-1.0.3
RUN pecl install APC-3.1.9
RUN pecl install xdebug
RUN pecl install memcached

# Install apache libs
RUN apt-get -y install apache2-dev apache2-doc

# Install all the php libraries
RUN apt-get -y install php5-common libapache2-mod-php5 php5-cli
#RUN apt-get -y install php-gd
RUN apt-get -y install php5-mcrypt
RUN apt-get -y install php5-curl
RUN apt-get -y install php5-memcache
RUN apt-get -y install php5-memcached

# Install Memcached
# RUN apt-get -y install -y memcached
