FROM kalicki2k/alpine-base:3.7

MAINTAINER Sebastian Kalicki (https://github.com/kalicki2k)

COPY Dockerfiles /

RUN apk update && apk upgrade && \
    apk add apache2 apache2-ssl && \
    mkdir /run/apache2/ && \
    mkdir /var/www/localhost/logs && \
    chmod +x /run.sh && \
    rm -rf /var/www/localhost/htdocs/index.html && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www/localhost

EXPOSE 80 443

ENTRYPOINT ["/run.sh"]
