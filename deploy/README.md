# Боевой запуск Sag-Aman

Разворачивается на одной машине туркменского хостинга: сервер, база и
Redis в docker-сети, снаружи — прокси с сертификатом.

Пока хостинг не куплен, этот каталог — инструкция и проверенные файлы,
а не работающий сервер.

## Что нужно до установки

| Что | Зачем |
|---|---|
| Машина: 2 CPU, 4 ГБ RAM, 40 ГБ диска | сервер, база и Redis на одном хосте |
| Домен `sagaman.tm` с записями `api`, `app` | адрес зашит в APK у семей, менять его нельзя |
| Сертификат (Let's Encrypt или от хостинга) | без HTTPS приложение не пойдёт на сервер |
| Docker и docker compose | всё запускается ими |

Домен обязателен. Приложение собрано на `https://api.sagaman.tm/`, и
переезд на другой хостинг должен быть сменой записи DNS, а не новой
версией приложения у каждой семьи.

## Установка

```bash
git clone https://github.com/mehmetkerim00/child.git sagaman
cd sagaman/deploy

cp .env.example .env
nano .env                       # пароли: openssl rand -base64 32

docker compose -f docker-compose.prod.yaml up -d --build
docker compose -f docker-compose.prod.yaml logs -f server
```

Сервер слушает только localhost (8080 API, 8082 веб). Наружу его
выпускает прокси — пример для nginx:

```nginx
server {
    listen 443 ssl http2;
    server_name api.sagaman.tm;
    ssl_certificate     /etc/letsencrypt/live/sagaman.tm/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/sagaman.tm/privkey.pem;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_http_version 1.1;
        # WebSocket: по нему идут план Б и карта поездки.
        proxy_set_header Upgrade    $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host       $host;
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_read_timeout 3600s;
    }
}

server {
    listen 443 ssl http2;
    server_name app.sagaman.tm;   # кабинет учреждения и /health
    ssl_certificate     /etc/letsencrypt/live/sagaman.tm/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/sagaman.tm/privkey.pem;
    location / { proxy_pass http://127.0.0.1:8082; }
}
```

`insights` (8081) наружу не выпускать никогда: это служебный доступ к
внутренностям сервера.

## Чек-лист после установки

Проходить сверху вниз, на самом сервере.

- [ ] `curl -s localhost:8082/health` → `{"status":"ok",…}`
- [ ] `curl -s https://app.sagaman.tm/health` → то же снаружи
- [ ] **Исходящая связь**: `./tools/check_outbound.sh`
      — доступны ли с сервера `fcm.googleapis.com` и SMS-шлюз.
      Если провайдер SMS уже выбран:
      `SMS_HOST=sms.provider.tm ./tools/check_outbound.sh`
- [ ] Миграции применились: в логах `Applied database migrations`
- [ ] Служебные аккаунты заведены:
      `./tools/add_account.sh dispatcher "+993…" "Имя"`
      `./tools/add_account.sh owner "+993…" "Имя"`
- [ ] Вход в приложении диспетчера проходит, код виден в логах сервера
- [ ] Бэкап снимается и восстанавливается:
      `tools/backup_db.sh && tools/restore_check.sh <файл>`
- [ ] Бэкап по расписанию: `0 3 * * *` в cron
- [ ] Внешний сторож поднят **на другой машине**: `tools/watchdog.sh`
- [ ] Нагрузочная проверка в нерабочее время:
      `dart tools/load_test.dart --drivers 50 --rides 1`
- [ ] Секреты: `.env` не в git, права `chmod 600 .env`

## Если FCM из дата-центра недоступен

Это ожидаемый сценарий: сервисы Google из Туркменистана могут быть
закрыты. Сервис это умеет и **включает план Б сам**, ничего настраивать
не нужно.

**Как он это понимает.** Сервер проверяет связь с `fcm.googleapis.com`
(обычный TCP-коннект, без запроса) и кэширует ответ: пока всё хорошо —
раз в десять минут, когда недоступен — раз в две. Быстрее возвращаться
к push важно: каждый час на плане Б стоит денег за SMS.

**Что меняется.**

| | Обычный режим | План Б |
|---|---|---|
| Приложение открыто | push | уведомление по WebSocket, сразу |
| Приложение закрыто | push | **ничего** — только SMS |
| Критичные события | SMS сразу | SMS сразу, как и было |
| Диспетчер | — | задача «FCM недоступен», раз в сутки |

**Что из этого следует.** План Б слабее push: закрытое приложение
уведомления не получит. Поэтому SMS в нём — не дубль, а основной канал,
и расход SMS вырастет. Это нужно заложить в бюджет пилота.

Вернуть push обратно не требует ничего: как только FCM снова отвечает,
сервер сам переключается.

Проверить, в каком режиме сервис сейчас: эндпоинт `profile.pushTransport`
или `./tools/check_outbound.sh` на сервере.

## Обновление версии

```bash
cd sagaman && git pull
cd deploy
docker compose -f docker-compose.prod.yaml up -d --build server
```

Перед обновлением — бэкап (`tools/backup_db.sh`). Откат и правила
совместимости миграций — `docs/release-rollback.md`.

## Бэкапы

Полностью — `docs/backup.md`. Коротко: `tools/backup_db.sh` снимает
шифрованный дамп, `tools/restore_check.sh` проверяет, что он
восстанавливается. Пароль от бэкапов хранится **отдельно** от бэкапов.

```bash
0 3 * * * cd /path/sagaman && BACKUP_PASSWORD_FILE=/etc/sagaman/backup.pass tools/backup_db.sh
```

## Мониторинг

`docs/monitoring.md`. Главное: внешний сторож `tools/watchdog.sh`
ставится **не на этот сервер** — упавший сервер не может сообщить о
себе сам.
