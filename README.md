
# How developt dart app

* alias dt="docker run --rm --name dart -it -p 80:80 -w /app -v ${PWD}:/app google/dart:2.13.1"
* dart pub get
* dart pub run build_runner build --delete-conflicting-outputs
* dart compile exe bin/server.dart -o bin/server

* docker-compose -p dart up
