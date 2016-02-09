# Docker Precise RabbitMQ

This repository contains a Dockerfile and associated
scripts for building a [RabbmitMQ](http://www.rabbitmq.com/).

## Building the image

Clone the repository

	git clone https://github.com/pitrho/docker-precise-rabbitmq.git
	cd docker-precise-rabbitmq
	./build


## Usage

### Basic usage

To start the image run:

	docker run -d -p 5672:5672 -p 15672:15672 pitrho/rabbitmq

Now you should be able to connect using a RabbitMQ client.

Also, the web interface is also exposed at port 15672.

### Ports exposed

By default, ports 5672 and 15672 are exposed from the container.

### Override default user and password

To override the default user and password, simply pass environment variables
RABBITMQ_USER and RABBITMQ_PASSWORD

	docker run -d -e RABBITMQ_USER=new_user -e RABBITMQ_PASSWORD=new_password pitrho/rabbitmq

### Override the entire rabbitmq configuration file

To override the configuration file, simply mount the new file to /etc/rabbitmq/rabbitmq.config

		docker run -d -v /host/rabbitmq.config:/etc/rabbitmq/rabbitmq.config

## License

MIT. See the LICENSE file.

## Contributors

* [Kyle Jensen](https://github.com/kljensen)
* [Gilman Callsen](https://github.com/callseng)
* [Alejandro Mesa](https://github.com/alejom99)
