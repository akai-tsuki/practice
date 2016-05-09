FROM centos

# for Japan
RUN echo "include_only=.jp" >>  /etc/yum/pluginconf.d/fastestmirror.conf

# ssh (create ssh_host_rsa_key for sshd daemon)
# ansible
RUN set -x \
        && yum -y install openssh-server epel-release \
        && sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key \
        && echo 'root:ansible' | chpasswd \
        && mkdir -p ~root/.ssh/ \
        && yum --enablerepo=epel-testing install -y ansible

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
