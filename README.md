# Docker: Gallrey3
Dockerfile for Gallery3 with mSMTP client, PHP7.3.

docker-compose file includes:
 - PHP7.3/Apache
 - Traefik support
 - MariaDB
 - Backup
 - Docker Swarm support
 - Traefik v2 support

## Important
This setup assumes your reverse proxy (Traefik/Nginx) works with https, port 443.

## Setup:
1. clone the repo
2. create `.env` file from `.env.example`
3. create `msmtp/msmtprc` from `msmtp/msmtprc.example`
4. Place Gallery3 in html folder
5. create `msmtp/msmtprc` from `msmtp/msmtprc.example`
6. copy one of the docker-compose (dev/traefik) templates to `docker-compose.yml`

- to create a docker-compose.prod.yml file for docker swarm run:

```
docker-compose config > docker-compose.prod.yml
``` 

## Network settings:
The stack is divided into two networks, backend and frontend.

the idea behind splitting the stack into two networks
is to block the access of the reverse proxy to the backend containers.

both networks are unique and will be named with stack-name_network-name such as:

- docker-gallery3_backend
- docker-gallery3_frontend

after running docker-compose up you need to connect your reverse proxy to your new frontend network:
 you can do that manually using:
 
```
docker network connect docker-gallery3_frontend PROXY_CONTAINER_NAME
```

if you are using my Traefik setup there is a 'connect.sh' script included
that will connect all your frontend networks to your Traefik container.

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net
