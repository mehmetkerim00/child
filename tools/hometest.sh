#!/usr/bin/env bash
# Домашний тест: сервер на этом ноутбуке, телефоны в том же Wi-Fi.
#
# Собирает отдельные APK, которым разрешён открытый http к локальному
# адресу. Обычная сборка так не умеет и не должна: в запросах едут
# адреса детей и время, когда их забирают.
#
# Домашние APK ставятся рядом с обычными (имя пакета с суффиксом
# .hometest) и ничего не затирают.
#
#   ./tools/hometest.sh            # определит адрес сам
#   ./tools/hometest.sh 192.168.1.5
set -euo pipefail
cd "$(dirname "$0")/.."

PORT=${PORT:-8180}
IP=${1:-}

if [ -z "$IP" ]; then
  # Адрес ноутбука в домашней сети. en0 — Wi-Fi на маке.
  IP=$(ipconfig getifaddr en0 2>/dev/null || true)
  [ -z "$IP" ] && IP=$(ipconfig getifaddr en1 2>/dev/null || true)
fi

if [ -z "$IP" ]; then
  echo "Не удалось определить адрес в Wi-Fi." >&2
  echo "Посмотрите его в «Системные настройки → Wi-Fi → Подробнее»" >&2
  echo "и передайте первым аргументом: ./tools/hometest.sh 192.168.1.5" >&2
  exit 1
fi

case "$IP" in
  192.168.*|10.*|172.1[6-9].*|172.2[0-9].*|172.3[01].*) ;;
  *)
    echo "Адрес $IP не похож на домашнюю сеть." >&2
    echo "Домашняя сборка рассчитана на локальный Wi-Fi." >&2
    exit 1
    ;;
esac

URL="http://$IP:$PORT/"
echo "Сервер для телефонов: $URL"
echo

for app in parent driver; do
  echo "--- $app"
  (cd "apps/$app" && flutter build apk --release --flavor hometest \
    --dart-define=FLAVOR=dev --dart-define="SERVER_URL=$URL")
done

echo
echo "Готовые APK (поставьте на телефоны):"
ls -la apps/*/build/app/outputs/flutter-apk/app-hometest-release.apk

cat <<INSTRUCTIONS

Что дальше — пять шагов:

1. Запустите сервер:        ./tools/dev_up.sh
2. Заведите себе доступ:    ./tools/add_account.sh dispatcher "+99365000001" "Диспетчер"
3. Телефоны — в тот же Wi-Fi, что и ноутбук (не мобильный интернет).
4. Перекиньте оба APK на телефоны и установите
   (Android спросит разрешение на установку из этого источника — разрешите):
     родителю  — apps/parent/build/app/outputs/flutter-apk/app-hometest-release.apk
     водителю  — apps/driver/build/app/outputs/flutter-apk/app-hometest-release.apk
5. Входите по номеру; код придёт не в SMS, а напечатается в окне,
   где запущен сервер.

Если приложение пишет «нет связи с сервером» — проверьте, что ноутбук
не ушёл в сон и что Wi-Fi не «гостевой» (в гостевых сетях телефоны не
видят друг друга).
INSTRUCTIONS
