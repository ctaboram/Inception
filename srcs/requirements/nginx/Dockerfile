FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443
COPY  conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=Andalucia/L=Malaga/O=42/OU=42/CN=ctaboada.42.fr/UID=ctaboada"

CMD ["nginx", "-g", "daemon off;"]