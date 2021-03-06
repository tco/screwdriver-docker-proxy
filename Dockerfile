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
    apt-get install -y nginx curl && \
    mkdir -p /usr/local/screwdriver/

ADD configuration/nginx.conf /etc/nginx/
ADD scripts/runner.sh /usr/local/screwdriver/

EXPOSE 80

CMD ["/usr/local/screwdriver/runner.sh"]
