#!/usr/bin/env bash
# Панель диспетчера в браузере.
#
# Приложение диспетчера — веб: отдельного APK у него нет, он открывается
# на ноутбуке. Этот скрипт собирает панель и отдаёт её тем же сервером,
# что и всё остальное, — по адресу /app.
#
#   ./tools/dispatcher_web.sh                   # для домашнего теста
#   ./tools/dispatcher_web.sh https://api.sagaman.tm/   # для боевого
#
# После сборки панель живёт по адресу, который напечатает скрипт, и
# открывается с любого устройства в той же сети — хоть с планшета.
set -euo pipefail
cd "$(dirname "$0")/.."

SERVER_URL=${1:-}

if [ -z "$SERVER_URL" ]; then
  IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || true)
  [ -z "$IP" ] && IP=localhost
  SERVER_URL="http://$IP:8180/"
fi

echo "Панель будет обращаться к серверу: $SERVER_URL"
echo "Собираю…"
echo

(cd apps/dispatcher && flutter build web \
  --base-href /app/ \
  --output ../../server/web/app \
  --dart-define=FLAVOR=dev \
  --dart-define="SERVER_URL=$SERVER_URL")

WEB_HOST=$(printf '%s' "$SERVER_URL" | sed -E 's#^https?://##; s#:[0-9]+/?$##; s#/$##')

cat <<INFO

Готово. Панель диспетчера:

    http://$WEB_HOST:8182/app

Сервер должен быть запущен (./tools/dev_up.sh). Адрес открывается и с
ноутбука, и с телефона в той же сети.

Вход — по номеру диспетчера; код печатается в окне сервера.
INFO
