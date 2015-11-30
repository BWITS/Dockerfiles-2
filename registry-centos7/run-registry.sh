#!/bin/bash

export DOCKER_REGISTRY_CONFIG=/etc/docker-registry.yml

source /etc/sysconfig/docker-registry
export SETTINGS_FLAVOR

cd /usr/lib/python2.7/site-packages/docker-registry

/sbin/sshd -D &
#/sbin/nginx -c /etc/nginx/nginx.conf &

exec /usr/bin/gunicorn --access-logfile /var/log/docker-registry/access.log --error-logfile /var/log/docker-registry/server.log --debug --max-requests 100 --graceful-timeout 3600 -t 3600 -k gevent -b 0.0.0.0:5000 -w 1 docker_registry.wsgi:application
