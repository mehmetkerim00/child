#!/usr/bin/env bash
# Проверки монорепо. Заменяет melos: он конфликтует с генератором drift
# по версии cli_util, а pub workspace и так связывает пакеты.
#
#   ./tools/check.sh analyze   — статический анализ всего кода
#   ./tools/check.sh test      — тесты пакетов и приложений
#   ./tools/check.sh server    — тесты сервера (нужна база на :9090)
#   ./tools/check.sh format    — проверка форматирования
#   ./tools/check.sh generate  — код Serverpod и drift
#   ./tools/check.sh all       — всё, кроме генерации
set -euo pipefail
cd "$(dirname "$0")/.."

PACKAGES=(
  packages/core_domain
  packages/core_data
  packages/core_ui
  packages/core_l10n
  packages/core_auth
  apps/parent
  apps/driver
  apps/dispatcher
)

analyze() {
  echo "==> Анализ кода"
  flutter analyze apps packages
  (cd server && dart analyze lib bin test)
}

test_packages() {
  echo "==> Тесты пакетов и приложений"
  for pkg in "${PACKAGES[@]}"; do
    [ -d "$pkg/test" ] || continue
    echo "--- $pkg"
    (cd "$pkg" && flutter test)
  done
}

test_server() {
  echo "==> Тесты сервера"
  (cd server && dart test)
}

check_format() {
  echo "==> Форматирование"
  dart format --output=none --set-exit-if-changed \
    apps packages/core_* server/lib server/test
}

generate() {
  echo "==> Генерация кода Serverpod"
  (cd server && serverpod generate)
  echo "==> Генерация строк локализации"
  (cd packages/core_l10n && flutter gen-l10n)
  echo "==> Генерация drift (офлайн-очередь)"
  (cd packages/core_data && dart run build_runner build --delete-conflicting-outputs)
}

case "${1:-all}" in
  analyze) analyze ;;
  test) test_packages ;;
  server) test_server ;;
  format) check_format ;;
  generate) generate ;;
  all) check_format; analyze; test_packages ;;
  *) echo "использование: $0 analyze|test|server|format|generate|all"; exit 1 ;;
esac
