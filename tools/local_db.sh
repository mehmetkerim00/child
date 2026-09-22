#!/usr/bin/env bash
# Локальный PostgreSQL без Docker — запасной путь, если Docker Hub недоступен.
# Поднимает два кластера с теми же портами и паролями, что docker-compose.yaml:
#   8090 — база разработки (child), 9090 — база тестов (child_test).
#
# Использование: tools/local_db.sh start|stop|status
set -euo pipefail

PG_BIN=${PG_BIN:-/opt/homebrew/opt/postgresql@16/bin}
DEV_DIR="$HOME/.child-dev-db"
TEST_DIR="$HOME/.child-test-db"
DEV_PASSWORD='child_dev_password'
TEST_PASSWORD='child_test_password'

export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
export PATH="$PG_BIN:$PATH"

init_cluster() { # dir password port db
  local dir=$1 password=$2 port=$3 db=$4
  if [ ! -d "$dir" ]; then
    local pwfile; pwfile=$(mktemp)
    printf '%s' "$password" > "$pwfile"
    initdb -D "$dir" -U postgres --auth=scram-sha-256 --pwfile="$pwfile" -E UTF8 --locale=C > /dev/null
    rm -f "$pwfile"
  fi
  pg_ctl -D "$dir" -o "-p $port" -l "$dir/server.log" start > /dev/null 2>&1 || true
  sleep 2
  PGPASSWORD="$password" psql -h localhost -p "$port" -U postgres -tAc \
    "select 1 from pg_database where datname='$db'" | grep -q 1 ||
    PGPASSWORD="$password" psql -h localhost -p "$port" -U postgres -c "create database $db;" > /dev/null
}

case "${1:-start}" in
  start)
    init_cluster "$DEV_DIR" "$DEV_PASSWORD" 8090 child
    init_cluster "$TEST_DIR" "$TEST_PASSWORD" 9090 child_test
    echo "PostgreSQL: разработка — localhost:8090/child, тесты — localhost:9090/child_test"
    ;;
  stop)
    pg_ctl -D "$DEV_DIR" stop > /dev/null 2>&1 || true
    pg_ctl -D "$TEST_DIR" stop > /dev/null 2>&1 || true
    echo "остановлено"
    ;;
  status)
    pg_ctl -D "$DEV_DIR" status || true
    pg_ctl -D "$TEST_DIR" status || true
    ;;
  *) echo "использование: $0 start|stop|status"; exit 1 ;;
esac
