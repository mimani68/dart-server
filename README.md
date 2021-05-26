# How develop dart app in Docker ecosystem

alias dt="docker run -d --name dart-runtime -it -p 3000:3000 -w /app -v ${PWD}:/app google/dart:2.13.1"
dt
alias dta="docker exec -it dart-runtime"
dta dart pub get
dta dart compile exe src/server.dart -o dist/server

# Run docker-compose

* docker-compose -p dart up
