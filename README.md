# How develop dart app in Docker ecosystem

```bash
alias dt="docker run -d --name dart-runtime -it -w /app -v ${PWD}:/app google/dart:2.13.1"
dt
alias dta="docker exec -it dart-runtime"
dta dart pub get
dta dart compile exe src/server.dart -o dist/server
```

# Run docker-compose

```bash
docker-compose -p dart up
```
