# rails6-api-example
An example of Rails 6 application(API-only) on Docker.

## Environment
- Docker version 19.03.12, build 48a66213fe
- docker-compose version 1.26.2, build eefe0d31

## Stack
- Ruby 2.7.1
- Rails 6.0.3.3
- MySQL 8.0.21 

## Getting Started
```
$ git clone git@github.com:yasuhikomachino/rails6-api-example.git
$ cd rails6-api-example
$ cp ./src/.env.example ./src/.env 
$ docker-compose build 
$ docker-compose run --rm app bundle install
$ docker-compose up -d
$ docker-compose exec app bundle exec rails db:create
$ docker-compose exec app bundle exec rails db:migrate
$ docker-compose exec app bundle exec rails db:seed
```

## API 
### GET /posts
```
$ curl --location --request GET 'http://localhost:3000/api/v1/posts'
```

### GET /posts/:id
```
$ curl --location --request GET 'http://localhost:3000/api/v1/posts/1'
```

### POST /posts
```
$ curl --location --request POST 'http://localhost:3000/api/v1/posts/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "awesome title"
}'
```

### PUT /posts/:id
```
$ curl --location --request PUT 'http://localhost:3000/api/v1/posts/1' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "great title"
}'
```

### DELETE /posts/:id
```
$ curl --location --request DELETE 'http://localhost:3000/api/v1/posts/1'
```