#!/bin/sh
IMAGE=myansible
CONTAINER=ansible-c
LINK_CONTAINER=tomcat-c

docker ps |grep $LINK_CONTAINER
RET=$?

if [ "1" = $RET ]; then
  echo "[WARN] There is no container \"${LINK_CONTAINER}\""
  docker run -it -d --name $CONTAINER -p 20022:22 $IMAGE
else
  docker run -it -d --name $CONTAINER --link ${LINK_CONTAINER} -p 20022:22 $IMAGE
fi
