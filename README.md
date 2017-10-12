# Apache on Alpine Linux 3.6
This is a micro docker images based on Alpine Linux 3.6 and Apache 2.4.

To access site contents from outside the container you should map /var/www/localhost/htdocs.

## Static folder
The image exposes a volume at `/var/www/localhost`. The structure is:

| Directory                  | Function             |
| -------------------------- | -------------------- |
| /var/www/localhost/htdocs  | web root             |
| /var/www/localhost/cgi-bin | cgi bin folder       |
| /var/www/localhost/logs    | apache log directory | 

## Usage

To use this start the container on port 8080 with:
```
docker run -d --name apache -p 8080:80 -v /path/to/localhost:/var/www/localhost kalicki2k/alpine-apache
```