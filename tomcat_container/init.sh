#!/bin/sh
IMAGE=mytomcat
CONTAINER=tomcat-c

docker run -it -d --name ${CONTAINER} -p 8888:8080 -p 2222:22 ${IMAGE} bash
