# Based on
# https://github.com/mweibel/redis-docker/blob/master/Dockerfile
FROM       	ubuntu:12.04
MAINTAINER  pitrho


# Set up the environment
#
ENV DEBIAN_FRONTEND noninteractive


# Prevent apt from starting services right after the installation
#
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d


# Update packages
#
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get install -y -q curl && apt-get clean


# Install RabbitMQ
#
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >>/etc/apt/sources.list
ENV KEY_URL https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN curl $KEY_URL -o /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN apt-get update
RUN apt-get -y -q install rabbitmq-server && apt-get clean

# Add our up script
RUN mkdir /app
ADD . /app
WORKDIR /app


# Expose ports for RabbitMQ and RabbitMQ Management
#
EXPOSE 5672 15672


# Start RabbitMQ
#
ENTRYPOINT ["./rabbit-up.sh"]
