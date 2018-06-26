# Apache on Alpine Linux 3.6
This is a micro docker images based on Alpine Linux 3.6 and Apache 2.4.

To access site contents from outside the container you should map /var/www/localhost/htdocs.

## Static folders
The image exposes a volume at `/var/www/localhost`. The structure is:

| Directory                  | Description    |
| -------------------------- | -------------- |
| /var/www/localhost/htdocs  | web root       |
| /var/www/localhost/cgi-bin | cgi bin folder |
| /var/www/localhost/logs    | log folder     | 
| /var/www/localhost/error   | error pages    | 

## Environment variables
Various env vars can be set at runtime via your docker command or docker-compose environment section.

| Name                         | Description                                                     |
| ---------------------------- | --------------------------------------------------------------- |
| APACHE_SERVER_NAME           | Server name that the server uses to identify itself.            |
| APACHE_SERVER_MAIL           | Your address, where problems with the server should be e-mailed |
| APACHE_RUN_USER              | User name to run httpd as.                                      |
| APACHE_RUN_USER_ID           | User ID to run httpd as.                                        |
| APACHE_RUN_GROUP             | Group name to run httpd as.                                     |
| APACHE_RUN_GROUP_ID          | Group ID to run httpd as.                                       |
| APACHE_SSL_CERTIFICATE       | Server Certificate...                                           |
| APACHE_SSL_CERTIFICATE_KEY   | Server Private Key...                                           |
| APACHE_SSL_CERTIFICATE_CHAIN | Server Certificate Chain...                                     |

## Usage

To use this start the container on port 8080 with:
```
docker run -d --name apache -p 8080:80 -v /path/to/localhost:/var/www/localhost kalicki2k/alpine-apache
```

Or with environments:

```
docker run -d --name apache -p 8000:80 -p 8001:443  \
           -v /path/to/localhost:/var/www/localhost \
           -v /etc/letsencrypt:/etc/letsencrypt \
           -e APACHE_RUN_USER=web \
           -e APACHE_RUN_GROUP=web \
           -e APACHE_SERVER_NAME=kmedia.rocks \
           -e APACHE_SSL_CERTIFICATE=/etc/letsencrypt/live/kmedia.rocks/cert.pem  \
           -e APACHE_SSL_CERTIFICATE_KEY=/etc/letsencrypt/live/kmedia.rocks/privkey.pem \
           -e APACHE_SSL_CERTIFICATE_CHAIN=/etc/letsencrypt/live/kmedia.rocks/chain.pem kalicki2k/alpine-apache
```