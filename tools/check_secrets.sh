#!/usr/bin/env bash
# Поиск секретов перед публикацией.
#
# Репозиторий с кодом публичный. Пароли разработки в нём лежат нарочно —
# они локальные и ни к чему не подходят снаружи. А вот боевой пароль,
# ключ подписи или токен провайдера утекут навсегда: переписать историю
# после публикации уже поздно.
#
# Запускается в CI и вручную: tools/check_secrets.sh
set -uo pipefail
cd "$(dirname "$0")/.."

found=0

report() {
  found=1
  echo "НАЙДЕНО: $1"
  echo "$2" | sed 's/^/    /'
}

# Файлы, которым в репозитории не место ни при каких условиях.
forbidden=$(git ls-files | grep -E '\.(keystore|jks|p12|pem|key)$|key\.properties$|google-services\.json$|passwords\.yaml$' || true)
if [ -n "$forbidden" ]; then
  report "файлы с ключами или паролями" "$forbidden"
fi

# Боевые пароли Serverpod задаются переменными окружения, а не в файлах.
prod=$(git grep -nE 'SERVERPOD_PASSWORD_[A-Z]+\s*[:=]\s*["'"'"'][^"'"'"']+' -- '*.yaml' '*.dart' '*.sh' 2>/dev/null || true)
if [ -n "$prod" ]; then
  report "боевой пароль записан в файл" "$prod"
fi

# Типовые ключи провайдеров.
keys=$(git grep -nE '(AIza[0-9A-Za-z_-]{30,}|sk_live_[0-9A-Za-z]{10,}|ghp_[0-9A-Za-z]{30,}|-----BEGIN [A-Z ]*PRIVATE KEY-----)' \
  -- . ':(exclude)tools/check_secrets.sh' 2>/dev/null || true)
if [ -n "$keys" ]; then
  report "похоже на ключ доступа" "$keys"
fi

# DSN Sentry содержит ключ проекта — он берётся из окружения.
dsn=$(git grep -nE 'https://[0-9a-f]{20,}@[a-z0-9.-]+/[0-9]+' -- . ':(exclude)tools/check_secrets.sh' 2>/dev/null || true)
if [ -n "$dsn" ]; then
  report "DSN с ключом внутри" "$dsn"
fi

# Бизнес-документы живут в приватном child-docs.
docs=$(git ls-files | grep -E '^(MVP_PLAN|RESEARCH|V1_ROADMAP|PROGRESS)\.md$' || true)
if [ -n "$docs" ]; then
  report "бизнес-документы в публичном репозитории" "$docs"
fi

if [ "$found" -ne 0 ]; then
  echo
  echo "Публиковать нельзя. Уберите найденные файлы и перепишите историю, если они уже в коммитах." >&2
  exit 1
fi

echo "Секретов не найдено."
