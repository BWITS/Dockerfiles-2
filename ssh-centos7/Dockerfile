# Dockerfile for ssh
FROM centos:7
MAINTAINER aven92

RUN yum -y -q update; yum clean all
RUN yum -y -q install openssh-server passwd; yum clean all
RUN echo 'zhaopin@123' | passwd root --stdin
RUN mkdir /var/run/sshd
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22
