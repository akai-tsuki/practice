#!/bin/sh
IMAGE=myansible
CONTAINER=ansible-c

docker run -it -d --name $CONTAINER -p 20022:22 $IMAGE
