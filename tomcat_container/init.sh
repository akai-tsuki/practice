#!/bin/sh
IMAGE=mytomcat
CONTAINER=tomcat-c

docker run -it -d --name ${CONTAINER} -p 8888:8080 -p 2222:22 ${IMAGE} bash

ssh-keygen -t rsa -f root_ssh_rsa_key -N ""
mv root_ssh_rsa_key.pub authorized_keys
docker cp authorized_keys ${CONTAINER}:/root/.ssh/authorized_keys
docker exec ${CONTAINER} chmod 600 /root/.ssh/authorized_keys

### ssh exsample
#
# docker exec -d ${CONTAINER} /usr/sbin/sshd -D
#
# CON_IP=`docker inspect --format="{{ .NetworkSettings.IPAddress }}" ${CONTAINER}`
#   -->> show ip address
# 
# chmod 600 ~/.ssh/root_ssh_rsa_key
# cp -fp root_ssh_rsa_key ~/.ssh/root_ssh_rsa_key
# chmod 400 ~/.ssh/root_ssh_rsa_key
# ssh root@${CON_IP} -i ~/.ssh/root_ssh_rsa_key
#
