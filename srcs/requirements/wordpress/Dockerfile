FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm php7.4-mysqli wget

EXPOSE 9000

COPY tools/wordpress.sh /wordpress.sh
RUN chmod +x /wordpress.sh

CMD [ "/wordpress.sh" ]