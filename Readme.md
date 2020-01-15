# Maintenance

A super simple web server that can host a static site of your choosing.

Useful for hosting a 'down for maintenance' style page, as you can simply configure your load balancer / reverse proxy to redirect to this web server while you work on another.

Works well with a Docker / docker-compose / traefik stack.


## Usage

The recommended way to run this is via Docker.

### Docker
Included is a Dockerfile, to build with:

```
docker build path-to-this-repo/ -t maintenance:latest
```

Alternatively, a pre-built container is available:
```
docker pull vynology/maintenance-page:latest
```

### Docker Compose

The only notable part this requires is a way to 

An example `docker-compose.yml` which binds to port 3000 of the host:

```
version: '3'

services:
  maintenance-page:
    image: vynology/maintenance-page
    container_name: maintenance-page
    restart: unless-stopped
    ports: 
      - 3000:3000
    volumes:
      - ${USERDIR}/path/to/your/static/site:/static 
```

For traefik, some useful labels:

```
    labels:
      - "traefik.enable=true"
      - "traefik.port=3000"
      - "traefik.backend=maintenance-page"
      - "traefik.frontend.rule=Host:maintenance.${DOMAINNAME}"  
      - "traefik.docker.network=default"  
      - "traefik.frontend.headers.SSLRedirect=true"
      - "traefik.frontend.headers.SSLHost=${DOMAINNAME}"
```