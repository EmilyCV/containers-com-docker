FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y mysql-server

ADD my.cnf /etc/mysql/conf.d/
RUN chmod /etc/mysql/conf.d/my.cnf
ADD run /usr/local/bin/
RUN chmod /usr/local/bin/run

VOLUME ["/var/lib/docker/volumes/mysql"]
EXPOSE 3001
CMD ["/usr/local/bin/run"]