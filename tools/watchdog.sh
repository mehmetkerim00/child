#!/usr/bin/env bash
# Внешний сторож: следит за тем, что сервер жив.
#
# Сервер не может сообщить о собственном падении — об этом должен
# сказать кто-то снаружи. Поэтому этот скрипт ставится НЕ на сервер, а
# на другую машину (домашний компьютер, дешёвый VPS, телефон с Termux) и
# запускается по расписанию:
#
#   */5 * * * * /path/to/watchdog.sh https://api.example.tm
#
# Подряд WATCHDOG_FAILURES неудачных проверок — тревога. Одна неудачная
# не считается: связь в Ашхабаде рвётся сама по себе, и будить человека
# из-за каждого обрыва — верный способ научить его не реагировать.
#
# Как поднимается тревога, задаётся переменной WATCHDOG_ALERT — командой,
# которой передаётся текст. Например:
#   WATCHDOG_ALERT='curl -s -X POST https://sms-provider/send -d msg='
# Пока SMS-провайдер не выбран (MVP_PLAN §9), по умолчанию скрипт просто
# печатает тревогу и пишет её в файл.
set -uo pipefail

URL=${1:-${WATCHDOG_URL:-http://localhost:8180/health}}
STATE=${WATCHDOG_STATE:-$HOME/.child-watchdog}
FAILURES=${WATCHDOG_FAILURES:-3}
TIMEOUT=${WATCHDOG_TIMEOUT:-15}
LOG=${WATCHDOG_LOG:-$STATE/watchdog.log}

mkdir -p "$STATE"
count_file="$STATE/failures"
[ -f "$count_file" ] || echo 0 > "$count_file"
count=$(cat "$count_file")

now=$(date '+%Y-%m-%d %H:%M:%S')

alert() {
  local message="$1"
  echo "$now ТРЕВОГА: $message" >> "$LOG"
  if [ -n "${WATCHDOG_ALERT:-}" ]; then
    # shellcheck disable=SC2086
    eval ${WATCHDOG_ALERT}"'Child: $message'" || true
  else
    echo "ТРЕВОГА: $message" >&2
  fi
}

body=$(curl -fsS --max-time "$TIMEOUT" "$URL" 2>/dev/null)
status=$?

if [ $status -eq 0 ] && printf '%s' "$body" | grep -q '"status":"ok"'; then
  if [ "$count" -ge "$FAILURES" ]; then
    alert "сервер снова отвечает ($URL)"
  fi
  echo 0 > "$count_file"
  echo "$now ok" >> "$LOG"
  exit 0
fi

count=$((count + 1))
echo "$count" > "$count_file"
echo "$now недоступен ($status)" >> "$LOG"

if [ "$count" -eq "$FAILURES" ]; then
  alert "сервер не отвечает $FAILURES проверки подряд ($URL). Родители не получают уведомлений."
fi

exit 1
