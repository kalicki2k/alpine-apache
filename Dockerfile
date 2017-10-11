FROM kalicki2k/alpine-base

MAINTAINER Sebastian Kalicki <sebastian@kalicki.email>

COPY Dockerfiles/. /

RUN apk update && apk upgrade && \
    apk add apache2 && \
    chmod +x /run.sh && \
    rm -rf /var/cache/apk/*

WORKDIR /var/www/localhost/htdocs

EXPOSE 80 443

ENTRYPOINT ["/run.sh"]
