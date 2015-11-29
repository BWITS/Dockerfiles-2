#Dockerfile for registry in centos7
FROM centos:7
MAINTAINER aven92

RUN yum update -y -q; yum clean all
RUN yum install -y -q epel-release; yum clean all
RUN yum install -y -q docker-registry; yum clean all
RUN sed -ri 's#STORAGE_PATH:/var/lib/docker-registry#STORAGE_PATH:/data/docker-registry#g' /etc/docker-registry.yml

# sshd
RUN yum install -y -q openssh-server passwd; yum clean all
RUN echo 'password' | passwd root --stdin
RUN ssh-keygen -A

## authentication
#RUN yum install -y -q nginx httpd-tools; yum clean all
#RUN htpasswd -b -c /etc/nginx/docker-registry.htpasswd root password
#ADD docker-registry.conf /etc/nginx/conf.d/docker-registry.conf

ADD run-registry.sh /opt/registry/run-registry.sh
RUN chmod -v 755 /opt/registry/run-registry.sh
RUN mkdir -p /var/log/docker-registry

CMD ["/opt/registry/run-registry.sh"]

EXPOSE 5000 22
