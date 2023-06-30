<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

## Job Recommender Server

To get project up and running

### Requirements

- Xampp
- Composer

### Set up

Run in root directory
> composer install

Create .env file with
> cp .env.example .env

Generate a key with:
>php artisan key:generate

Serve application with:
>php artisan serve

create `jobrecommenda` database in phpMyAdmin and import `jobrecommenda.sql`

update the .env with the database name for `DB_DATABASE`

Run migrations
>php artisan migrate

Set JWT Secret with:
>`php artisan jwt:secret`

### API

Run Query providing a body of raw type JSON e.g

```json
{
    "email": "test@test.com",
    "password": "testpass"
}
```

Logging in to an existing user:
> <http://127.0.0.1:8000/api/v1/login>

Or creating a new one with:
> <http://127.0.0.1:8000/api/v1/register>

Both commands should produce an authorization bearer token to use when querying the api e.g:

```json
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YxL2xvZ2luIiwiaWF0IjoxNjg3Mzc5MjU1LCJleHAiOjE2ODczODI4NTUsIm5iZiI6MTY4NzM3OTI1NSwianRpIjoiVDRHQnVaR3c4c21FTmoyVyIsInN1YiI6IjY0IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WkgtbLSpF-mKBISHzoFI-tvVj6BZxJaieGkN1zxko_8",
    "token_type": "bearer",
    "expires_in": 86400
}
```

To query list of jobs:
> <http://127.0.0.1:8000/api/v1/jobs>

Passing the Authorization Bearer access token in header.

### API Documentation

The file `thunder-collection_jobRecommendation.json` contains api samples.
Import it into thunder client VS code extension to view samples.
