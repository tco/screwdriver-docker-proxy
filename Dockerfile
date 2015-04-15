FROM ubuntu:trusty

MAINTAINER Antti Rintala <antti@rintala.it>

# An image can't have more than 127 layers regardless of the storage driver.
# This limitation is set globally to encourage optimization of the overall
# size of images.

# It's important to note that each RUN statement will generate a new image,
# with the parent of that image being the image generated by the Dockerfile
# statement above it. For this reason we collapse the RUN statements into one
# multiline statement.

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get -y update && \
    apt-get install -y nginx && \
    mkdir -p /etc/nginx/ssl/ && \
    echo $REGISTRY_USERS > /etc/nginx/.registry-users

ADD configuration/nginx.conf /etc/nginx/


EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
