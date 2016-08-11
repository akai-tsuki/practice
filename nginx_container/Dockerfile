FROM centos

RUN set -x \
    && echo '[nginx]' > /etc/yum.repos.d/nginx.repo \
    && echo 'name=nginx repo' >> /etc/yum.repos.d/nginx.repo \
    && echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/' >> /etc/yum.repos.d/nginx.repo \
    && echo 'gpgcheck=0' >> /etc/yum.repos.d/nginx.repo \
    && echo 'enabled=1' >> /etc/yum.repos.d/nginx.repo \
    && yum install -y nginx bind-utils \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]