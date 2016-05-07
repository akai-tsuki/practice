FROM centos

ENV OPEN_JDK java-1.8.0-openjdk.x86_64
ENV OPEN_JDK_DEVEL java-1.8.0-openjdk-devel.x86_64
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV MIRROR_SITE http://ftp.meisei-u.ac.jp/mirror/apache/dist
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.33

ENV TOMCAT_TGZ_URL $MIRROR_SITE/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

# for Japan
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf

# ssh (create ssh_host_rsa_key for sshd daemon)
RUN set -x \
        && yum -y install openssh-server \
        && sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key \
        && mkdir -p ~root/.ssh/

# java/tomcat
RUN set -x \
        \
        && yum install -y "$OPEN_JDK" "$OPEN_JDK_DEVEL" \
        && curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
        && tar -xvf tomcat.tar.gz --strip-components=1 \
        && rm -f bin/*.bat \
        && rm -f tomcat.tar.gz*
        
EXPOSE 22 8080
CMD ["/usr/sbin/sshd", "-D"]
# CMD ["catalina.sh", "run"]
