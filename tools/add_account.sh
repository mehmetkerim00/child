#!/usr/bin/env bash
# Завести служебный аккаунт: диспетчера или владельца.
#
# Приложение само аккаунты не создаёт: незнакомый номер получает отказ —
# так в систему не войдёт посторонний. Первого диспетчера и владельца
# заводят этой командой.
#
#   tools/add_account.sh dispatcher "+99365001111" "Мерджен"
#   tools/add_account.sh owner      "+99365002222" "Владелец"
#
# После этого вход обычный: номер → код из SMS (в dev-режиме код печатается
# в консоль сервера).
set -euo pipefail
cd "$(dirname "$0")/.."

role=${1:-}
phone=${2:-}
name=${3:-}

if [ -z "$role" ] || [ -z "$phone" ] || [ -z "$name" ]; then
  echo "использование: $0 dispatcher|owner <телефон> <имя>" >&2
  exit 1
fi

case "$role" in
  dispatcher) table=dispatcher_account ;;
  owner) table=owner_account ;;
  *) echo "роль: dispatcher или owner" >&2; exit 1 ;;
esac

# Номер приводим к тому же виду, что и сервер: +993XXXXXXXX.
digits=$(printf '%s' "$phone" | tr -cd '0-9')
case "$digits" in
  993*) normalized="+$digits" ;;
  8????????) normalized="+993${digits:1}" ;;
  ????????) normalized="+993$digits" ;;
  *) normalized="+$digits" ;;
esac

PGPASSWORD="${DB_PASSWORD:-child_dev_password}" psql \
  -h "${DB_HOST:-localhost}" -p "${DB_PORT:-8090}" \
  -U "${DB_USER:-postgres}" -d "${DB_NAME:-child}" \
  -v ON_ERROR_STOP=1 -c \
  "insert into $table (phone, name, \"active\", \"createdAt\")
   values ('$normalized', '$name', true, now())
   on conflict (phone) do update set name = excluded.name, \"active\" = true;"

echo "$role: $normalized — $name"
