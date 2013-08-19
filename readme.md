a ruby client for Docker API


supports the new Docker api via unix socket


this script can be run as root or with sudo

find usage in usage.rb



work in progress
implementing a ruby server in sinatra to access the docker api remotely

you can implement a backend to store the key validation, use any custom header


gem install rack-api-key

ruby server.rb 

http://localhost:4567/api/hello


curl --header "X_CUSTOM_API_HEADER: key" http://localhost:4567/api/hello


Senthil Nayagam

senthil (at) railsfactory dot com