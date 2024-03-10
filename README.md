# README

###########################
This Api is developed to generate order_details report in sync or async way.
We can keep some condition to download file in sync or async.
Currently it is exporting in async.
I am using sidekiq for async export.
User will get a message that "Asynchronous Export Initiated"
Once export is ready, user will get a mail notification with a link to downlod report.
############################

pre-requisite
Create a docker image : docker build -t data-service-api .
create a container using docker image 
run bundle install 
run rake db:migrate 
run rake db:seed
make sure redis is installed and running on host 'redis://redis:6379/0'\
start a sidekiq process 
Start rails server
Now we are good to go with the API
