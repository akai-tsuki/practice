#!/bin/sh
CONTAINER=tomcat-c

ssh-keygen -t rsa -f root_ssh_rsa_key -N ""
mv root_ssh_rsa_key.pub authorized_keys
docker cp authorized_keys ${CONTAINER}:/root/.ssh/authorized_keys
docker exec ${CONTAINER} chmod 400 /root/.ssh/authorized_keys
docker exec -d ${CONTAINER} /usr/sbin/sshd -D

### ssh exsample
#
# CON_IP=`docker inspect --format="{{ .NetworkSettings.IPAddress }}" ${CONTAINER}`
#   -->> show ip address
# 
# chmod 600 ~/.ssh/root_ssh_rsa_key
# cp -fp root_ssh_rsa_key ~/.ssh/root_ssh_rsa_key
# chmod 400 ~/.ssh/root_ssh_rsa_key
# ssh root@${CON_IP} -i ~/.ssh/root_ssh_rsa_key
#
