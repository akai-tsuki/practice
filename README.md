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

