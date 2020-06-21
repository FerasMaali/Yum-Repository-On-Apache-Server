
FROM centos:centos7

RUN yum update -y && yum install httpd createrepo  yum-utils -y
RUN rm /etc/yum.repos.d/*.repo
RUN mkdir /my_repo
RUN createrepo /my_repo/

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY my_repo.repo /etc/yum.repo.d/my_repo.repo

VOLUME ["/my_repo"]
WORKDIR /my_repo

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apachectl", "-DFOREGROUND" ]

