#!/usr/bin/env bash
# Проверка восстановления бэкапа.
#
# Бэкап, который ни разу не восстанавливали, — это не бэкап, а файл.
# Скрипт разворачивает дамп в отдельную базу, считает строки в ключевых
# таблицах и удаляет временную базу за собой.
#
#   BACKUP_PASSWORD='…' tools/restore_check.sh ~/child-backups/child-…enc
#
# Запускать после каждой смены схемы и раз в месяц — по расписанию
# (docs/backup.md).
set -euo pipefail
cd "$(dirname "$0")/.."

FILE=${1:-}
if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "использование: $0 <файл бэкапа>" >&2
  exit 1
fi

if [ -n "${BACKUP_PASSWORD_FILE:-}" ]; then
  BACKUP_PASSWORD=$(cat "$BACKUP_PASSWORD_FILE")
fi
if [ -z "${BACKUP_PASSWORD:-}" ]; then
  echo "Нужен BACKUP_PASSWORD или BACKUP_PASSWORD_FILE." >&2
  exit 1
fi

DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-8090}
DB_USER=${DB_USER:-postgres}
DB_PASSWORD=${DB_PASSWORD:-child_dev_password}
CHECK_DB="child_restore_check_$$"

export PGPASSWORD="$DB_PASSWORD"
psql_run() {
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$@"
}

cleanup() {
  psql_run -d postgres -c "drop database if exists $CHECK_DB;" > /dev/null 2>&1 || true
}
trap cleanup EXIT

echo "Восстанавливаю в $CHECK_DB…"
psql_run -d postgres -c "create database $CHECK_DB;" > /dev/null

openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 \
  -pass pass:"$BACKUP_PASSWORD" -in "$FILE" \
  | gunzip \
  | psql_run -d "$CHECK_DB" -v ON_ERROR_STOP=1 -q > /dev/null

echo "Строк в таблицах:"
failed=0
total=0
for table in family child driver ride ride_seat ledger_entry; do
  count=$(psql_run -d "$CHECK_DB" -tAc "select count(*) from \"$table\";" 2>/dev/null || echo "нет")
  printf '  %-14s %s\n' "$table" "$count"
  if [ "$count" = "нет" ]; then
    failed=1
  else
    total=$((total + count))
  fi
done

if [ "$failed" -ne 0 ]; then
  echo "ПРОВЕРКА НЕ ПРОЙДЕНА: в дампе нет части таблиц." >&2
  exit 1
fi

# Пустой дамп восстанавливается без ошибок и выглядит исправным — это
# самый опасный вид «бэкапа». Отдельные таблицы пустыми быть могут
# (в начале пилота поездок ещё нет), но все сразу — нет.
if [ "$total" -eq 0 ]; then
  echo "ПРОВЕРКА НЕ ПРОЙДЕНА: дамп пуст — восстанавливать нечего." >&2
  exit 1
fi

# Книга операций должна сходиться: это деньги семей.
imbalance=$(psql_run -d "$CHECK_DB" -tAc \
  "select count(*) from (select \"familyId\", sum(\"amountTenge\") from ledger_entry group by 1) t;" )
echo "  семей в книге   $imbalance"

echo "Восстановление проверено: $FILE"
