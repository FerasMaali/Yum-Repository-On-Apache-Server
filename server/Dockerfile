
FROM centos:centos7

RUN yum update -y
RUN mkdir -p /my_repo/packages
RUN repotrack -p /my_repo/packages httpd

RUN yum install httpd createrepo -y
RUN rm /etc/yum.repos.d/*.repo
RUN createrepo /my_repo/packages

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY my_repo.repo /etc/yum.repo.d/my_repo.repo
COPY index.html /my_repo
COPY my_repo.repo /my_repo

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apachectl", "-DFOREGROUND" ]

