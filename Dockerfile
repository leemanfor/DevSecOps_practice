From centos:7.8.2003

Maintainer Kevin Harnden leemanfor1@gmail.com

# Run this container manually by:
# Docker run \
# -p 80:2100 -p 443:2200 -it \
# apache:1.0 /bin/bash

RUN yum install -y redhad-lsb-core net-tools.x86_64 httpd mod_ssl openssh
COPY entrypoint.sh /
COPY index.html /var/www/devsecops_practical/
COPY files/apache.crt /etc/pki/tls/certs/
COPY files/apache.key /etc/pki/tls/private/
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY ssl.conf /etc/httpd/conf.d/ssl.conf
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443
