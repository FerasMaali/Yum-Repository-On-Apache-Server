
FROM centos:centos7

RUN rm /etc/yum.repos.d/*.repo
RUN yum-config-manager --add-repo http://172.17.0.1:8888/my_repo.repo
RUN yum repolist
# RUN yum install httpd -y

ENTRYPOINT [ "/bin/bash", "-c" ]
