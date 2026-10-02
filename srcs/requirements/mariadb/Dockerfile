FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh

CMD [ "/mariadb.sh" ]