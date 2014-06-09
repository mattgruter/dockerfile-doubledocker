FROM ubuntu

MAINTAINER Matthias Grüter <matthias@grueter.name>

RUN apt-get update
RUN apt-get install -y curl 
RUN curl -s https://get.docker.io/ubuntu/ | sh
RUN echo 'DOCKER_OPTS="-H :4243 -H unix:///var/run/docker.sock"' >> /etc/default/docker

VOLUME /var/lib/docker
EXPOSE 4243

CMD /etc/init.d/docker start && while true; do sleep 1; done

