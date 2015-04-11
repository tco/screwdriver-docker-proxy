FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y nginx curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /etc/nginx/nginx.conf -L https://codeload.github.com/gabrielecirulli/2048/zip/master

EXPOSE 80 443

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
