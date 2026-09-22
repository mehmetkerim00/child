# Подключение Firebase (FCM) — 5 минут вашего времени

Сейчас push-уведомления уходят в заглушку: сервер печатает их в консоль.
Каскад при этом работает полностью — SMS уходят по правилам, ничего не
теряется. Чтобы включить настоящие push, нужен проект Firebase.

Firebase бесплатен для нашего объёма: push (FCM) не тарифицируется.

## Что делаете вы (5 минут)

1. Откройте https://console.firebase.google.com и войдите под своим
   Google-аккаунтом.
2. **Add project** → имя `child` → Continue.
3. Google Analytics: **выключите** (нам не нужна, меньше согласий и данных).
   → Create project → ждём минуту → Continue.
4. В терминале на этой машине выполните две команды:

   ```bash
   npm install -g firebase-tools    # если ещё не установлен
   firebase login
   ```

   Откроется браузер — подтвердите вход тем же аккаунтом.
5. Скажите мне: «Firebase готов, проект называется child».

Всё. Дальше я делаю сам.

## Что делаю я после вашего входа

```bash
dart pub global activate flutterfire_cli
cd apps/parent  && flutterfire configure --project=child \
    --platforms=android --out=lib/firebase_options.dart
cd ../driver    && flutterfire configure --project=child \
    --platforms=android --out=lib/firebase_options.dart
```

Эти команды создают проекты Android в Firebase, скачивают
`google-services.json` в `android/app/` и генерируют `firebase_options.dart`.
Дальше я:

- добавлю `firebase_core` и `firebase_messaging` в оба приложения;
- при входе приложение будет отправлять на сервер токен устройства
  (новая таблица `device_token`: телефон, токен, платформа, дата);
- заменю заглушку `ConsolePushGateway` на `FcmPushGateway`, которая шлёт
  push через FCM HTTP v1 API;
- при получении push приложение вызовет `ackNotification` — это отключает
  SMS-дубль для некритичных событий;
- серверный ключ (service account JSON) положу в
  `server/config/firebase_service_account_key.json` — он уже в `.gitignore`
  и в репозиторий не попадёт.

## Что понадобится от вас ещё раз (1 минута)

Для отправки push с сервера нужен служебный ключ:

1. Firebase Console → шестерёнка → **Project settings** → вкладка
   **Service accounts** → **Generate new private key** → скачается JSON.
2. Положите файл в `~/Desktop/child/server/config/firebase_service_account_key.json`
   и скажите мне.

Ключ секретный: он даёт право слать push от имени проекта. В репозиторий
он не попадает, на сервере задаётся переменной окружения.

## Как проверим, что работает

1. Соберём APK через CI, поставим на телефон.
2. Водитель нажимает «Выехал» — на телефоне родителя приходит push.
3. В логе сервера строка уведомления получает статус `acked` — значит
   приложение подтвердило доставку и SMS по этому событию не уйдёт.
4. Выключим интернет на телефоне родителя и повторим: push не дойдёт,
   через 90 секунд придёт SMS (в dev-режиме — в консоль сервера).

## Важно про надёжность

Push остаётся вспомогательным каналом. Правило проекта не меняется:
**ни одно критическое событие не полагается только на push**. Пуши в
Туркменистане теряются, поэтому «Забрал», «Передал», отмены и замена
водителя всегда дублируются SMS, независимо от того, дошёл push или нет.
