# Docker Precise RabbitMQ

This repository contains a Dockerfile and associated
scripts for building a [RabbmitMQ](http://www.rabbitmq.com/)
Docker image from an [Ubuntu 12.04 LTS](http://releases.ubuntu.com/precise/)
base image.

## Building the image

Clone the repository

	export IMGTAG="pitrho/precise-rabbitmq"
	git clone https://github.com/pitrho/docker-precise-rabbitmq.git
	cd docker-precise-rabbitmq
	docker build -t $IMGTAG .

Verify you have the image locally

	docker images | grep "$IMGTAG"

### Basic usage

Start the image using the default redis.conf included with this repo

	RID=$(docker run -d $IMGTAG)
	RIP=$(docker inspect -format='{{.NetworkSettings.IPAddress}}' $RID)

Now you should be able to connect to $RIP:5672 with a RabbitMQ client.

### Playing with the container

To get a shell prompt, override the Dockerfile's entrypoint as such

	docker run -t -i --entrypoint /bin/bash $IMGTAG

## License

MIT. See the LICENSE file.

## Contributors

* [Kyle Jensen](https://github.com/kljensen)
* [Gilman Callsen](https://github.com/callseng)