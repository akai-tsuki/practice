#!/bin/sh
IMAGE=myansible
CONTAINER=ansible-c
LINK_CONTAINER=tomcat-c

# docker run -it -d --name $CONTAINER -p 20022:22 $IMAGE
docker run -it -d --name $CONTAINER --link ${LINK_CONTAINER} -p 20022:22 $IMAGE
