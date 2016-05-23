#!/bin/sh

SSH_KEY_PATH=../tomcat_container/root_ssh_rsa_key

CONTAINER=tomcat-c
SSH_CLIENT=ansible-c

### precondition
# docker run -it -d --link ${CONTAINER} --name ${SSH_CLIENT} $IMAGE

docker ps | grep ${CONTAINER}
res=$?
if [ "$res" -eq 0 ] ; then
  echo "copy ssh key."
else
  echo "Exit !!"
  exit
fi 

docker cp ${SSH_KEY_PATH} ${SSH_CLIENT}:/root/.ssh
docker exec ${SSH_CLIENT} chmod 400 /root/.ssh/root_ssh_rsa_key

echo "# ssh ${CONTAINER} -i ~/.ssh/root_ssh_rsa_key"
docker exec -it ${SSH_CLIENT} bash


