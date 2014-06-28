#FROM ubuntu:latest

FROM jarosser06/ubuntu-ruby-2.1.0

# https://docs.docker.com/examples/mongodb/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get install -y -q mongodb-org
RUN mkdir -p /data/db
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT usr/bin/mongod

#$ sudo docker build --tag my/repo .

## Basic way
## Usage: sudo docker run --name <name for container> -d <user-name>/<repository>
#$ sudo docker run --name mongo_instance_001 -d my/repo
#
## Dockerized MongoDB, lean and mean!
## Usage: sudo docker run --name <name for container> -d <user-name>/<repository> --noprealloc --smallfiles
#$ sudo docker run --name mongo_instance_001 -d my/repo --noprealloc --smallfiles
