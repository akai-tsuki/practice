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

