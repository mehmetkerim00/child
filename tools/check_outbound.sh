#!/usr/bin/env bash
# Проверка исходящей связи с боевого сервера.
#
# Запускать НА СЕРВЕРЕ после установки. Отвечает на один вопрос: до кого
# сервер вообще дотянется из туркменского дата-центра.
#
# Это не формальность. Если из ДЦ закрыт Google, push молчит — и молчит
# незаметно: отправка «успешна» до первого таймаута. Сервис тогда
# переходит на план Б (уведомления в открытое приложение плюс SMS), и
# знать об этом нужно до пилота, а не в первое утро.
#
#   ./tools/check_outbound.sh
#   SMS_HOST=sms.provider.tm ./tools/check_outbound.sh
set -uo pipefail

TIMEOUT=${TIMEOUT:-8}
SMS_HOST=${SMS_HOST:-}

ok=0
warn=0
fail=0

check() { # имя хост порт важность
  local name=$1 host=$2 port=$3 level=$4
  local start end ms
  start=$(date +%s)

  if nc -z -w "$TIMEOUT" "$host" "$port" 2>/dev/null; then
    end=$(date +%s); ms=$(( (end - start) * 1000 ))
    printf '  ✓ %-28s %s:%s\n' "$name" "$host" "$port"
    ok=$((ok + 1))
    return 0
  fi

  if [ "$level" = "critical" ]; then
    printf '  ✗ %-28s %s:%s — НЕДОСТУПЕН\n' "$name" "$host" "$port"
    fail=$((fail + 1))
  else
    printf '  ! %-28s %s:%s — недоступен\n' "$name" "$host" "$port"
    warn=$((warn + 1))
  fi
  return 1
}

echo "Исходящая связь с сервера ($(hostname)):"
echo

echo "Обязательное:"
check "DNS" 8.8.8.8 53 warning || check "DNS (провайдер)" 1.1.1.1 53 warning
check "обновления пакетов" deb.debian.org 443 warning

echo
echo "Push через Firebase:"
fcm_ok=0
check "FCM" fcm.googleapis.com 443 warning && fcm_ok=1
check "вход Google (OAuth)" oauth2.googleapis.com 443 warning || true

echo
echo "SMS-шлюз:"
if [ -n "$SMS_HOST" ]; then
  check "провайдер SMS" "$SMS_HOST" 443 critical
else
  echo "  — SMS_HOST не задан: провайдер ещё не выбран (MVP_PLAN §9)."
  echo "    Когда появится, запустите: SMS_HOST=sms.provider.tm $0"
  warn=$((warn + 1))
fi

echo
echo "Итог: доступно $ok, предупреждений $warn, недоступно $fail"
echo

if [ "$fcm_ok" -eq 0 ]; then
  cat <<'PLANB'
FCM с этого сервера недоступен.

Это не поломка — сервис это умеет. Он сам перейдёт на план Б:
  • уведомления идут в приложение по WebSocket, пока оно открыто;
  • всё важное дублируется SMS, как и раньше;
  • диспетчер получает задачу «FCM недоступен» раз в сутки.

Что из этого следует для пилота:
  • расход SMS вырастет — заложите это в бюджет;
  • родитель с закрытым приложением узнаёт о событиях только из SMS;
  • проверку стоит повторить: блокировки меняются.

Ничего включать руками не нужно: сервер проверяет FCM сам каждые
несколько минут и вернётся на push, как только тот заработает.
PLANB
fi

[ "$fail" -gt 0 ] && exit 1
exit 0
