#!/usr/bin/env bash

# Enable rabbitmq management web interface
rabbitmq-plugins enable rabbitmq_management

# start rabbitmq-server
rabbitmq-server
