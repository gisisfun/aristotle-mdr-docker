# Dockerized Aristotle Metadata Registry

## Requirements
- Docker
- Docker Compose

## Development
- Clone project
- Create *.env* and *.env.secret* from the example files in the root folder and edit as appropriate
- Run `docker-compose up`
- Visit localhost:8000

## Production
- Follow the first 2 steps outlined above, then:
```sh
docker-compose -f docker-compose.prod.yml up --build -d
docker-compose -f docker-compose.prod.yml run web python3 manage.py migrate
docker-compose -f docker-compose.prod.yml run web python3 manage.py collectstatic
docker-compose -f docker-compose.prod.yml run web python3 manage.py createcachetable
docker-compose -f docker-compose.prod.yml run web python3 manage.py createsuperuser
```
- Visit website

## TODO
- Configure emails
- Configure Celery
- Configure Reddis
- SSL/TLS with Let's Encrypt