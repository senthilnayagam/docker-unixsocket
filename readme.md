#docker-unixsocket

A ruby client for Docker API

##Overview

docker-unixsocket client supports the new Docker api via unix socket. The client should be run as root. For more details on the usage, refer ```usage.rb```

##Installing

```gem install rack-api-key```

##Running

```ruby server.rb```

Access the application at ```http://localhost:4567/api/hello```

##Usage
curl --header "X_CUSTOM_API_HEADER: key" http://localhost:4567/api/hello

##Author
Senthil Nayagam
senthil (at) railsfactory dot com