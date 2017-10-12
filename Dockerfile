FROM kalicki2k/alpine-base

MAINTAINER Sebastian Kalicki (https://github.com/kalicki2k)

COPY Dockerfiles/. /

RUN apk update && apk upgrade && \
    apk add apache2 && \
    mkdir /run/apache2/ && \
    mkdir /var/www/localhost/logs && \
    chmod +x /run.sh && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www/localhost

EXPOSE 80 443

ENTRYPOINT ["/run.sh"]
