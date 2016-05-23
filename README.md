# practice

## tomcat container

### Install

    $ git clone https://github.com/akai-tsuki/practice.git
    $ cd practice/tomcat_container
    $ docker build -t mytomcat .

### Run

    $ docker run -it -d --name tomcat-c -p 8888:8080 -p 2222:22 mytomcat
    
      or
    
    $ sh init.sh

### Re-Run (for example)
    
    $ docker ps -a
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
    f8206f237893        mytomcat            "bash"                   2 days ago          Exited (137) 22 hours ago                       tomcat-c
    $    
    
    $ docker start -i tomcat-c
    [root@f8206f237893 tomcat]#
    

## ansible container

### Install

    $ git clone https://github.com/akai-tsuki/practice.git
    $ cd practice/ansible_container
    $ docker build -t myansible .

### Run

    $ sh init.sh

## connect by ssh

> ${CONTAINER} is container name (sshd)

generate ssh key

    $ ssh-keygen -t rsa -f root_ssh_rsa_key -N ""

copy ssh key

    $ mv root_ssh_rsa_key.pub authorized_keys
    $ docker cp authorized_keys ${CONTAINER}:/root/.ssh/authorized_keys
    $ docker exec ${CONTAINER} chmod 400 /root/.ssh/authorized_keys

run sshd

    $ docker exec -d ${CONTAINER} /usr/sbin/sshd -D

get ip address

    $ CON_IP=`docker inspect --format="{{ .NetworkSettings.IPAddress }}" ${CONTAINER}`
    # -> ip address

connect by ssh from local to ${CONTAINER}

    $ chmod 600 ~/.ssh/root_ssh_rsa_key  # for previous file
    $ cp -fp root_ssh_rsa_key ~/.ssh/root_ssh_rsa_key
    $ chmod 400 ~/.ssh/root_ssh_rsa_key
    $ ssh root@${CON_IP} -i ~/.ssh/root_ssh_rsa_key

connect by ssh from ${SSH_CLIENT} to ${CONTAINER}

> ${SSH_CLIENT} is container name (ssh client)  
> ${IMAGE} is docker image installed "openssh-clients"
 
    $ docker run -it -d --link ${CONTAINER} --name ${SSH_CLIENT} $IMAGE
    $ docker cp root_ssh_rsa_key ${SSH_CLIENT}:/root/.ssh
    $ docker exec ${SSH_CLIENT} chmod 400 /root/.ssh/root_ssh_rsa_key
    $ docker exec -it ${SSH_CLIENT} bash
    [root@668e67c8ab0a /]# ssh ${CONTAINER} -i ~/.ssh/root_ssh_rsa_key
    
