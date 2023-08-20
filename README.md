# Ruby on Rails: "Where Am I" API 

## Project Specifications

**Read-Only Files**
- spec/*

**Environment**  

- Default Port: 8000

**Commands**
- run: 
```bash
bin/bundle exec rails server --binding 0.0.0.0 --port 8000
```
- install: 
```bash
bin/bundle install
```
- test: 
```bash
RAILS_ENV=test bin/bundle exec rspec
```
    
## Question description

In this challenge, you are developing a platform that provides information about a user's location and language.

You will need to add functionality to retrieve the user's IP address, their country (in ISO format), and their preferred language. The team has come up with a set of requirements for the query that you must implement.

User information is a JSON object, which contains following properties:

- ip: the IP address of the user
- country: the ISO code of the user's country, derived from the IP address
- language: the preferred language of the user


Example of a user information JSON object:
```
{
  ip: '157.240.203.35',
  country: 'US',
  language: 'en-US'
}
```

## Requirements:

The REST service should implement the following endpoint:

`GET /whereami `:

* returns response code 200
* returns the user's IP address
* returns the ISO code of the user's country based on the IP address. If a country is not detected by IP, it returns `null`.
* returns the preferred language of the user (see the `Accept-Language` request header). If the user has multiple preferred languages, the endpoint returns only the one that is used the most.


In order to fetch country code by the IP address, you should use the service https://jsonmock.hackerrank.com. For example, https://jsonmock.hackerrank.com/api/ip/172.217.20.46. Note that this is a mock service and might not contain specific IP address information.
