#!/usr/bin/env bash
# Ежедневный шифрованный бэкап базы.
#
# В базе — адреса детей, время, когда их забирают, и телефоны родителей.
# Такой дамп нельзя класть в облако как есть, поэтому он шифруется
# паролем до того, как куда-то уедет.
#
#   BACKUP_PASSWORD='…' tools/backup_db.sh [каталог]
#
# По расписанию (на сервере):
#   0 3 * * * BACKUP_PASSWORD_FILE=/etc/child/backup.pass /path/backup_db.sh
#
# Восстановление и проверка — tools/restore_check.sh, docs/backup.md.
set -euo pipefail
cd "$(dirname "$0")/.."

OUT_DIR=${1:-${BACKUP_DIR:-$HOME/child-backups}}
KEEP_DAYS=${BACKUP_KEEP_DAYS:-30}

DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-8090}
DB_USER=${DB_USER:-postgres}
DB_NAME=${DB_NAME:-child}
DB_PASSWORD=${DB_PASSWORD:-child_dev_password}

if [ -n "${BACKUP_PASSWORD_FILE:-}" ]; then
  BACKUP_PASSWORD=$(cat "$BACKUP_PASSWORD_FILE")
fi
if [ -z "${BACKUP_PASSWORD:-}" ]; then
  echo "Нужен BACKUP_PASSWORD или BACKUP_PASSWORD_FILE." >&2
  echo "Незашифрованный дамп с данными детей делать нельзя." >&2
  exit 1
fi

mkdir -p "$OUT_DIR"
stamp=$(date '+%Y%m%d-%H%M%S')
file="$OUT_DIR/child-$stamp.sql.gz.enc"

# Дамп сразу сжимается и шифруется: открытый файл не появляется на диске
# даже на секунду.
PGPASSWORD="$DB_PASSWORD" pg_dump \
  -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
  --no-owner --no-privileges \
  | gzip -9 \
  | openssl enc -aes-256-cbc -pbkdf2 -iter 200000 -salt \
      -pass pass:"$BACKUP_PASSWORD" \
  > "$file"

size=$(wc -c < "$file" | tr -d ' ')
if [ "$size" -lt 1024 ]; then
  echo "Бэкап подозрительно мал ($size байт) — проверьте подключение." >&2
  exit 1
fi

# Старые удаляем, но только если новый получился.
find "$OUT_DIR" -name 'child-*.sql.gz.enc' -type f -mtime "+$KEEP_DAYS" -delete

echo "$file ($size байт)"
echo "Проверьте восстановление: tools/restore_check.sh \"$file\""
