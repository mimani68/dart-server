FROM google/dart:2.13

# cache deps
WORKDIR /app
COPY ./src /app

WORKDIR /app
RUN dart pub get

# As long as pubspecs haven't changed, all deps should be cached and only
# new image layers from here on need to get rebuild for modified sources.
COPY . ../..
RUN dart pub get --offline

RUN dart pub run build_runner build --delete-conflicting-outputs
RUN dart compile exe bin/server.dart -o bin/server


FROM subfuzion/dart:slim
COPY --from=0 /app/server /app/server
EXPOSE 8080
ENTRYPOINT ["/app/server"]

