FROM traefik:latest
MAINTAINER Patrick Ryan <pjryan126@gmail.com>

ADD traefik.toml .
ADD acme.json .
