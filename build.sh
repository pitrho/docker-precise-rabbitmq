#!/bin/bash

IMAGE_TAG="pitrho/rabbitmq"

# Custom die function.
#
die() { echo >&2 -e "\nRUN ERROR: $@\n"; exit 1; }

# Parse the command line flags.
#
while getopts "t:" opt; do
  case $opt in
    t)
      IMAGE_TAG=${OPTARG}
      ;;

    \?)
      die "Invalid option: -$OPTARG"
      ;;
  esac
done

# Crete the build directory
rm -rf build
mkdir build

cp run.sh build/
cp rabbitmq.config build/
cp Dockerfile build/

docker build -t="${IMAGE_TAG}" build/

rm -rf build
