# Weather central

The application has 2 tables. Location table and the Air Pollution data table. The air pollution table take location_id
as a foreign key. 

To start please have docker installed . I used docker to run both my sql server and redis for sidekiq

To run redis use the following command : docker run -d --name redis-stack-server -p 6379:6379 redis/redis-stack-server:latest
for Postgres Sql : docker run -d --name redis-stack-server -p 6379:6379 redis/redis-stack-server:latest.

Please run rails db:migration and rails db:seed to setup the database.


Some of the things i was able to do this in project are

* Was able to schedule the job via sidekiq cron scheduler . To kick off job please start worker from console
* Was able to covert the APi client to service object
* Able to hit the API and store the data into the database
* complete rspec using VCR for most of the classes
* create an importer class to be able to parse the data


The API key in OpenWeatherMapCall has to be updated with a working key for the api to work. The hardcoded key there is disabled.
