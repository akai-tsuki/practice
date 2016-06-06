#!/bin/sh
IMAGE_NAME=myansible

# ----------------------------------------------------------

# function docker_build() {
docker_build() {
  echo "We run docker build for ${IMAGE_NAME} image."
  echo ""
  echo "# docker build -t ${IMAGE_NAME} ."
  docker build -t ${IMAGE_NAME} .
}

docker images |grep -e REPOSITORY -e $IMAGE_NAME
RET=$?

# echo $RET

if [ "0" = "$RET" ] ; then
  echo "Already \"${IMAGE_NAME}\" image has been built."
  echo ""
  echo "----------"
  echo "# docker ps -a |grep ${IMAGE_NAME}"
  docker ps -a |grep ${IMAGE_NAME}
  RET=$?
  echo ""
  if [ "1" = "$RET" ] ; then
    echo "There is no container of ${IMAGE_NAME} image."
    read -p 'Do you delete and re-build image? [Y/n]' ans
    case $ans in
      '' | [Yy]* )
        echo "You select Yes."
        echo ""
        echo "# docker rmi ${IMAGE_NAME}"
        docker rmi ${IMAGE_NAME}
        echo "-----"
        docker_build
        ;;
      [Nn]* )
        echo "You select No."
        echo ""
        exit
        ;;
      * )
        echo "Please answer Y(Yes) or N(No)."
        echo ""
        exit
    esac
  else
    echo "There are some container of ${IMAGE_NAME} image."
    echo "Please check \"docker ps -a\", "
    echo "and delete the container of ${IMAGE_NAME} image before delete image."
    echo ""
  fi
else
  echo "There is no ${IMAGE_NAME} image."
  echo ""
  echo "-----"
  docker_build
fi

