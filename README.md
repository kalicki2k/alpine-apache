# Apache on Alpine Linux 3.6
This is a micro docker images based on Alpine Linux 3.6 and Apache 2.4.

To access site contents from outside the container you should map /var/www/localhost/htdocs.

## Static folders
The image exposes a volume at `/var/www/localhost`. The structure is:

| Directory                  | Description          |
| -------------------------- | -------------------- |
| /var/www/localhost/htdocs  | web root             |
| /var/www/localhost/cgi-bin | cgi bin folder       |
| /var/www/localhost/logs    | apache log directory | 

## Environment variables
Various env vars can be set at runtime via your docker command or docker-compose environment section.

| Name                | Description                 |
| ------------------- | --------------------------- |
| APACHE_SERVER_NAME  | Server name that the server uses to identify itself. |
| APACHE_RUN_USER     | User name to run httpd as.                           |
| APACHE_RUN_USER_ID  | User ID to run httpd as.                             |
| APACHE_RUN_GROUP    | Group name to run httpd as.                          |
| APACHE_RUN_GROUP_ID | Group ID to run httpd as.                            |

## Usage

To use this start the container on port 8080 with:
```
docker run -d --name apache -p 8080:80 -v /path/to/localhost:/var/www/localhost kalicki2k/alpine-apache
```

Or with environments:

```
docker run -d --name apache -p 8080:80 -e APACHE_RUN_USER=web1 -e APACHE_RUN_GROUP=web -e APACHE_SERVER_NAME=localhost kalicki2k/alpine-apache
```