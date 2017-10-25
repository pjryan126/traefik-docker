FROM traefik:1.3.5
MAINTAINER Patrick Ryan <pjryan126@gmail.com>

ADD traefik.toml .
ADD acme.json .