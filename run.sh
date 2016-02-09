#!/usr/bin/env bash

# Set username and password in config
: =${RABBITMQ_USER:='guest'}
: =${RABBITMQ_PASSWORD:='guest'}

sed -i 's|%%RABBITMQ_USER%%|'"$RABBITMQ_USER"'|g; s|%%RABBITMQ_PASSWORD%%|'"$RABBITMQ_PASSWORD"'|g' /etc/rabbitmq/rabbitmq.config

# Enable rabbitmq management web interface
rabbitmq-plugins enable rabbitmq_management

# start rabbitmq-server
rabbitmq-server
