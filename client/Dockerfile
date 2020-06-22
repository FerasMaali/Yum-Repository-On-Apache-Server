
FROM centos:centos7

RUN rm /etc/yum.repos.d/*.repo
RUN yum-config-manager --add-repo http://172.17.0.1:8888/my_repo.repo
RUN yum repolist

COPY test_script /root/test_script

RUN chmod +x /root/test_script

ENTRYPOINT [ "/root/test_script" ]
