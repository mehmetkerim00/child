#!/usr/bin/env bash
# Поднять бэкенд локально: PostgreSQL + сервер Serverpod с миграциями.
# База — в Docker; если Docker недоступен, используется локальный PostgreSQL
# (tools/local_db.sh) с теми же портами и паролями.
set -euo pipefail
cd "$(dirname "$0")/.."
[ -f server/config/passwords.yaml ] || cp server/config/passwords.example.yaml server/config/passwords.yaml

if docker compose -f server/docker-compose.yaml up -d postgres 2>/dev/null; then
  echo "PostgreSQL: Docker, localhost:8090"
else
  echo "Docker недоступен — запускаю локальный PostgreSQL"
  ./tools/local_db.sh start
fi

cd server
dart bin/main.dart --apply-migrations
