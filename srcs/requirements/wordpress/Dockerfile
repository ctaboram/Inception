FROM debian:bookworm

RUN apt-get update && apt-get install -y php8.2-fpm php8.2-mysqli wget

RUN mkdir -p /run/php
RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/wordpress.sh /wordpress.sh
RUN chmod +x /wordpress.sh

CMD [ "/wordpress.sh" ]