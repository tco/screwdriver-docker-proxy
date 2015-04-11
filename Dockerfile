FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y nginx curl

RUN curl -o /etc/nginx/nginx.conf -L https://raw.githubusercontent.com/tco/screwdriver-docker-proxy/master/configuration/nginx.conf

EXPOSE 80 443

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
