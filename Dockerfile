# Build a docker image for nginx on Ubuntu 14.04LTS.
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.17
MAINTAINER  pitrho

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Set up the environment
ENV DEBIAN_FRONTEND noninteractive

# Prevent apt from starting services right after the installation
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

# Install utilities
RUN apt-get update && apt-get install wget

# Install RabbitMQ
RUN wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y -q install rabbitmq-server

# Define our service
RUN mkdir /etc/service/rabbitmq
COPY run.sh /etc/service/rabbitmq/run
COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config

# Expose ports for RabbitMQ and RabbitMQ Management
EXPOSE 5672 15672

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
