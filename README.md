# Geolocation API

This is a simple API written in Ruby on Rails that allows to create, delete and get geolocation records.
Runs on SQLite database.

## How to run it?

### Locally
1. Create database: `bundle exec rake db:create`
2. Run migrations: `bundle exec rake db:migrate`
3. Run server locally: `bundle exec rails s`

### In Docker
1. Build docker image: `docker build -t your_tag .`
2. Run the image: `docker run -p 3000:3000 your_tag`

## How to use it?

### Create records
```
curl --location --request POST '127.0.0.1:3000/api/geolocations' \
--header 'Content-Type: application/json' \
--data-raw '{
	"geolocation": {
		"ip": "109.173.208.37",
		"ip_type": "ipv4",
		"country": "Poland",
		"city": "Poznań",
		"latitude": 52.41360092163086,
		"longitude": 16.837390899658203
	}
}'
```

### Get records
```
curl --location --request GET '127.0.0.1:3000/api/geolocations'
```

### Show record for the IP provided
```
curl --location --request GET '127.0.0.1:3000/api/geolocations/109.173.208.37'
```

### Delete record for the IP provided
```
curl --location --request DELETE '127.0.0.1:3000/api/geolocations/109.173.208.37'
```