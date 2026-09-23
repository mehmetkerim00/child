#!/usr/bin/env bash
# Приёмка перед релизом: прогон полного школьного дня и все проверки.
#
# Нагрузочный тест сюда не входит: ему нужен поднятый сервер.
# Запускать отдельно перед релизом — dart tools/load_test.dart
# (docs/monitoring.md).
#
# Сценарий прогона — server/test/integration/full_day_test.dart:
# утро (дом → школа с передачей по коду учреждения), обратный путь
# (школа → дом с подписью родителя), деньги (пополнение и два списания),
# сорванная поездка на завтра и эскалация диспетчеру.
#
# Запуск: ./tools/rehearsal.sh
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> 1/5 Секреты"
./tools/check_secrets.sh

echo
echo "==> 2/5 Форматирование и анализ"
./tools/check.sh format
./tools/check.sh analyze

echo
echo "==> 3/5 Тесты приложений и пакетов"
./tools/check.sh test

echo
echo "==> 4/5 Прогон полного дня и остальные тесты сервера"
(cd server && dart test)

echo
echo "==> 5/5 Релизные APK (подписанные, по одному на архитектуру)"
if [ -f "$HOME/child-keys/key.properties" ]; then
  for app in parent driver; do
    echo "--- $app"
    (cd "apps/$app" && flutter build apk --release --split-per-abi --dart-define=FLAVOR=prod)
  done
  echo
  echo "Готовые APK:"
  ls -la apps/*/build/app/outputs/flutter-apk/app-*-release.apk 2>/dev/null || true
else
  echo "Ключа подписи нет (~/child-keys/key.properties) — релизные APK пропущены."
  echo "См. docs/keystore-backup.md"
fi

echo
echo "Приёмка пройдена."
