dockerfiles-centos-registry
========================

CentOS7 dockerfile for docker registry

Get the version of Docker:

	# docker version

To build:

	# docker build --rm -t <yourname>/registry:v1 .

To run:

	# docker run -d -p 5000:5000 <yourname>/registry:v1

To use a separate data volume for /data/docker-registry (recommended, to
allow image update without losing registry contents):

Create a data volume container: (it doesn't matter what image you use
here, we'll never run this container again; it's just here to
reference the data volume)

	# docker run -itd --name=registry-data -v /data/docker-registry <yourname>/registry:v1

And now create the registry application container:

	# docker run -itd --name=registry -p 5000:5000 -p 33322:22 --volumes-from=registry-data <yourname>/registry:v1

Test it...

```
# docker tag <yourname>/registry:centos7 localhost:5000/<yourname>/registry:v1
# docker push localhost:5000/<yourname>/registry:v1
```
