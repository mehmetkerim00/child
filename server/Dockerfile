# Сборка из корня монорепо:
#   docker build -f server/Dockerfile .

FROM dart:3.10 AS build

# Минимальный workspace только с сервером, версии — из общего pubspec.lock.
WORKDIR /app
COPY pubspec.lock .
COPY server server
RUN printf '%s\n' \
  'name: _' \
  'environment:' \
  '  sdk: ^3.10.0' \
  'workspace:' \
  '  - server' \
  > pubspec.yaml
RUN dart pub get

WORKDIR /app/server
RUN dart compile exe bin/main.dart -o bin/server
RUN mkdir -p config web migrations

FROM alpine:latest
WORKDIR /app

ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /app/server/bin/server server
COPY --from=build /app/server/config/ config/
COPY --from=build /app/server/web/ web/
COPY --from=build /app/server/migrations/ migrations/
COPY --from=build /app/server/lib/src/generated/protocol.yaml lib/src/generated/protocol.yaml

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
