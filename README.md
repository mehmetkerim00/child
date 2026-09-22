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
| Монорепо | Dart pub workspace + melos 8 |
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
dart pub global activate melos serverpod_cli   # один раз
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
melos run analyze        # анализ всех пакетов
melos run test           # тесты пакетов и приложений
melos run test:server    # тесты сервера (нужна тестовая база на :9090)
melos run generate:server # код Serverpod после правки моделей и эндпоинтов
```

CI на каждый коммит: анализ, тесты, тесты сервера на PostgreSQL и сборка
debug-APK обоих мобильных приложений (артефакт `apk-debug`).

## Документация

- Правила работы с кодом: [CLAUDE.md](CLAUDE.md)
- Спецификация MVP, исследование рынка, состояние работ и отчёты по спринтам —
  в приватном репозитории `child-docs`.
