# child

Сервис регулярных детских перевозок: приложения родителя и водителя,
веб-панель диспетчера и бэкенд на Dart.

Семья подписывается на маршруты «дом ↔ сад/школа/секция» с постоянным
водителем. Каждый этап поездки подтверждает взрослый, а о критических
событиях родитель узнаёт даже без интернета — через SMS.

## Стек

| Слой | Технологии |
|---|---|
| Приложения | Flutter 3.38, Dart 3.10, Android-first |
| Монорепо | Dart pub workspace |
| State / навигация | Riverpod 2, go_router |
| Бэкенд | Serverpod 3.4 + PostgreSQL 16 |
| Карты (S4) | flutter_map + OSM |
| Офлайн-очередь (S3) | drift (SQLite) |
| Локализация | intl + ARB: русский и туркменский |

## Структура

| Папка | Назначение |
|---|---|
| `apps/parent` | Приложение родителя (Android) |
| `apps/driver` | Приложение водителя (Android, offline-first) |
| `apps/dispatcher` | Панель диспетчера (Flutter Web) |
| `packages/core_domain` | Бизнес-логика, чистый Dart |
| `packages/core_data` | Клиент API, репозитории, офлайн-очередь |
| `packages/core_ui` | Дизайн-система: токены, тема, виджеты |
| `packages/core_l10n` | Строки ru/tk |
| `packages/core_auth` | Общий экран входа по телефону |
| `packages/child_client` | Клиент, генерируемый Serverpod (не править руками) |
| `server` | Бэкенд: Serverpod + PostgreSQL |
| `tools` | Скрипты разработки |

## Быстрый старт

```bash
dart pub global activate serverpod_cli         # один раз
flutter pub get                                # зависимости всего монорепо
./tools/dev_up.sh                              # PostgreSQL + сервер на :8180

# приложения (в отдельных вкладках терминала)
cd apps/parent     && flutter run
cd apps/driver     && flutter run
cd apps/dispatcher && flutter run -d chrome
```

Порты разработки: API — 8180, Insights — 8181, веб-сервер — 8182,
PostgreSQL — 8090 (база тестов — 9090).

База поднимается в Docker; если Docker недоступен, `dev_up.sh` запустит
локальный PostgreSQL (`tools/local_db.sh`) с теми же портами.

Пароли для разработки лежат в `server/config/passwords.example.yaml` и
нарочно простые: база слушает только localhost. Секреты staging и production
задаются на сервере переменными `SERVERPOD_PASSWORD_*` и в репозиторий
не попадают.

## Проверки

```bash
./tools/check.sh analyze   # анализ всего кода
./tools/check.sh test      # тесты пакетов и приложений
./tools/check.sh server    # тесты сервера (нужна тестовая база на :9090)
./tools/check.sh generate  # код Serverpod, строки локализации, drift
./tools/check.sh all       # форматирование + анализ + тесты
```

Связывает пакеты Dart pub workspace: `flutter pub get` в корне ставит
зависимости всему монорепо.

Приёмка перед релизом — `./tools/rehearsal.sh`: поиск секретов, анализ,
все тесты, прогон полного школьного дня и подписанные релизные APK.

CI на каждый коммит: поиск секретов, анализ, тесты, тесты сервера на
PostgreSQL и сборка debug-APK обоих мобильных приложений (артефакт
`apk-debug`).

## Эксплуатация

```bash
./tools/add_account.sh owner "+99365002222" "Владелец"  # служебный аккаунт
./tools/check_secrets.sh                                # перед публикацией
dart tools/load_test.dart --rides 200 --events 1000     # нагрузка
tools/backup_db.sh                                      # шифрованный бэкап
tools/restore_check.sh <файл>                           # проверка восстановления
tools/watchdog.sh https://api.example.tm                # с ДРУГОЙ машины
```

- Мониторинг и тревоги: [docs/monitoring.md](docs/monitoring.md)
- Бэкапы и восстановление: [docs/backup.md](docs/backup.md)
- Откат релиза: [docs/release-rollback.md](docs/release-rollback.md)
- Бэкап ключа подписи: [docs/keystore-backup.md](docs/keystore-backup.md)

## Документация

- Правила работы с кодом: [CLAUDE.md](CLAUDE.md)
- Спецификация MVP, исследование рынка, состояние работ и отчёты по спринтам —
  в приватном репозитории `child-docs`.
