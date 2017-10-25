# Flask-Docker

A Docker container for running Traefik as a reverse proxy service.

## Getting Started

These instructions will get Traefik up and running as a reverse proxy on your local
machine for development and testing purposes or in production on a live system.

### Prerequisites

What things you need to install the software and how to install them:

- <a href="https://docs.docker.com/engine/installation/">Docker</a>
- <a href="https://docs.docker.com/compose/install/">Docker-Compose</a>

### Installing

1. Download the repository.

    ```
    git clone https://github.com/pjryan126/traefik-docker.git
    cd traefik-docker
    ```


1. Create a network and run the container.

    ```
    docker network create web
    docker-compose up -d
    ```

2. Use docker-compose to add web services to the network as needed, e.g.:

    ```
    version: '2'

    services:
      server:
        restart: always
        build: ./server
        expose:
          - "5000"
        labels:
          - "traefik.enable=true"
          - "traefik.backend=server:5000"
          - "traefik.frontend.rule=Host:api.server.com"
        networks:
        - web
        - default
        command: /usr/local/bin/gunicorn -w 2 -b :5000 wsgi:app
      client:
        restart: always
        build: ./client
        expose:
          - "4200"
        labels:
          - "traefik.enable=true"
          - "traefik.backend=client:4200"
          - "traefik.frontend.rule=Host:client.com"
        networks:
          - web
          - default

    networks:
      web:
        external: true
    ```

## Built With

* [Traefik] (https://traefik.io/)
* [Docker] (https://www.docker.com/)

## For Further Reference
This repository was developed in part by following Traefik's 
<a href="https://docs.traefik.io/user-guide/docker-and-lets-encrypt/">User Guide</a> for exposing web services.

## Authors

* **Patrick Ryan**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
