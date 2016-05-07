#!/bin/sh
IMAGE=mytomcat
CONTAINER=tomcat-c

docker run -it -d --name ${CONTAINER} -p 8888:8080 -p 2222:22 ${IMAGE} bash

ssh-keygen -t rsa -f root_ssh_rsa_key -N ""
mv root_ssh_rsa_key.pub authorized_keys
docker cp authorized_keys ${CONTAINER}:/root/.ssh/authorized_keys
docker exec ${CONTAINER} chmod 600 /root/.ssh/authorized_keys

### ssh exsample
# docker exec -d ${CONTAINER} /usr/sbin/sshd -D
# ssh root@172.17.0.2 -i root_ssh_rsa_key
