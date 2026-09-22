# child — безопасные детские перевозки (Ашхабад)

Подписочные регулярные маршруты «дом ↔ сад/школа/секция» с постоянным
водителем-няней, протоколом передачи ребёнка «из рук в руки» и SMS-дублированием
каждого критического события.

- Спецификация: [MVP_PLAN.md](MVP_PLAN.md)
- Исследование рынка: [RESEARCH.md](RESEARCH.md)
- Текущее состояние работ: [PROGRESS.md](PROGRESS.md)
- Отчёты по спринтам: [reports/](reports/)

## Что внутри

| Папка | Назначение |
|---|---|
| `apps/parent` | Приложение родителя (Android) |
| `apps/driver` | Приложение водителя (Android, offline-first) |
| `apps/dispatcher` | Панель диспетчера (Flutter Web) |
| `packages/core_domain` | Бизнес-логика, чистый Dart |
| `packages/core_data` | Клиент API, репозитории, офлайн-очередь |
| `packages/core_ui` | Дизайн-система: токены, тема, виджеты |
| `packages/core_l10n` | Строки ru/tk |
| `packages/child_client` | Клиент, генерируемый Serverpod (не править руками) |
| `server` | Бэкенд: Serverpod + PostgreSQL |
| `tools` | Скрипты разработки |

## Быстрый старт

```bash
dart pub global activate melos          # один раз
flutter pub get                         # зависимости всего монорепо
./tools/dev_up.sh                       # PostgreSQL + сервер на :8180

# приложения (в отдельных вкладках терминала)
cd apps/parent     && flutter run
cd apps/driver     && flutter run
cd apps/dispatcher && flutter run -d chrome
```

Порты разработки: API — 8180, Insights — 8181, веб-сервер — 8182,
PostgreSQL — 8090 (база тестов — 9090).

Если Docker недоступен, `dev_up.sh` сам поднимет локальный PostgreSQL
(`tools/local_db.sh`) с теми же портами и паролями.

Проверки: `melos run analyze`, `melos run test`, `melos run test:server`
(последней нужна тестовая база на порту 9090).
