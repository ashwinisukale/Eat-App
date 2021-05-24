# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    - ruby 2.7.2

* Rails version
    - Rails 6.1.3.2
* System dependencies
    - Install postgres on ubuntu
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04

* Database creation
  - rails db:create db:migrate db:seed

* How to run the test suite
    - rspec spec
  
* How to Run code
    - bundle install
    - rails s
* Code coverage
    - Open `eat-app/coverage/index.html`
    
* How to check Rubocop
    - rubocop

# Sample Postman request data

## Login
* Request url -> POST  localhost:3000/auth/login
* Request Headers -> Content-Type -> application/json
* Request Body ->
```
    {
      "email": "admin@gmail.com",
      "password": "123456"
    }
```

## Restaurant
* Request url -> POST  localhost:3000/api/v1/restaurants
* Request Headers -> Content-Type -> application/json, Authorization -> eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2
* Request Body ->
```
{
    "restaurant": {
            "name": "Abudabi",
            "email": "abu@gmail.com",
            "cuisines":"Non-veg",
            "phone": "7878787",
            "location": "Abu",
            "open_hours": "Mon-Fri"
        }
}
```

## Guest
* Request url -> POST  localhost:3000/api/v1/restaurants/1/guests
* Request Headers -> Content-Type -> application/json, Authorization -> eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2
* Request Body ->
```
{
    "guest": {
            "first_name": "Shahaji",
            "last_name": "Bhosale",
            "email": "bhosale@gmail.com",
            "phone": "7777777",
            "password": "123456",
            "password_confirmation": "123456"
        }
}
```

## Reservation
* Request url -> POST  localhost:3000/api/v1/restaurants/1/reservations
* Request Headers -> Content-Type -> application/json, Authorization -> eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2
* Request Body ->
```
{
	"reservation": {
		"start_time": "2021-05-23 22:10:46.701932368 +0530",
		"covers": 64,
		"status": "pending",
		"notes": "I will be 2343 min late"
	}
}
```
# Eat-App
