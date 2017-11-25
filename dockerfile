FROM node:latest
MAINTAINER "Hector Aguirre"
COPY . /tmp
WORKDIR /tmp
RUN apt-get update && apt-get install -y nginx supervisor && rm -rf /var/lib/apt/lists/* && npm install
COPY site.conf /etc/nginx/sites-enabled/default
ADD supervisor.conf /etc/supervisor.conf
CMD ["/usr/bin/supervisord","-c","/etc/supervisor.conf"]
