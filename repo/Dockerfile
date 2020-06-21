
FROM centos:centos7

RUN yum update -y && yum install httpd -y
RUN rm /etc/yum.repos.d/*.repo
RUN mkdir -p /my_repo/packages

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY my_repo.repo /etc/yum.repo.d/my_repo.repo
COPY index.html /my_repo

VOLUME ["/my_repo/packages"]

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apachectl", "-DFOREGROUND" ]

