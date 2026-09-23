import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';

/// Ограничение частоты обращений.
///
/// Защищает от двух разных бед. Первая — чужой перебор: кто-то гоняет
/// коды входа на чужой номер, и человеку всю ночь приходят SMS за наш
/// счёт. Вторая — наша же ошибка: цикл в приложении, который шлёт
/// событие тысячу раз в минуту.
///
/// Окно хранится в базе, а не в памяти: иначе ограничение снимается
/// перезапуском сервера.
class RateLimiter {
  RateLimiter({this.clock = const Clock()});

  final Clock clock;

  /// Коды входа: 3 запроса за 10 минут на номер.
  ///
  /// Человеку хватает одного, второй — «не пришло, пришлите ещё раз».
  /// Третий — уже перебор.
  static const authLimit = 3;
  static const authWindow = Duration(minutes: 10);

  /// Обычные действия в приложении: 60 за минуту.
  ///
  /// Живой человек столько не нажмёт, а офлайн-очередь после связи
  /// отправляет накопленное пачкой — ей запас нужен.
  static const actionLimit = 60;
  static const actionWindow = Duration(minutes: 1);

  /// Старые отметки дольше суток не нужны никому.
  static const keepFor = Duration(days: 1);

  /// Разрешено ли обращение; сама попытка при этом засчитывается.
  ///
  /// Возвращает true, если лимит не исчерпан. Отметка пишется в любом
  /// случае: перебор, который «не считается», перебором быть перестаёт.
  Future<bool> allow(
    Session session, {
    required String bucket,
    required int limit,
    required Duration window,
  }) async {
    final now = clock.now();
    final since = now.subtract(window);

    final recent = await RateLimitHit.db.count(
      session,
      where: (row) => row.bucket.equals(bucket) & (row.at > since),
    );

    await RateLimitHit.db.insertRow(
      session,
      RateLimitHit(bucket: bucket, at: now),
    );

    return recent < limit;
  }

  /// Проверка для кодов входа.
  Future<bool> allowAuthCode(Session session, String phone) => allow(
    session,
    bucket: 'auth:$phone',
    limit: authLimit,
    window: authWindow,
  );

  /// Проверка для обычного действия пользователя.
  Future<bool> allowAction(
    Session session, {
    required String kind,
    required String subject,
  }) => allow(
    session,
    bucket: '$kind:$subject',
    limit: actionLimit,
    window: actionWindow,
  );

  /// Уборка старых отметок: таблица не должна расти бесконечно.
  Future<int> cleanup(Session session) {
    final before = clock.now().subtract(keepFor);
    return RateLimitHit.db
        .deleteWhere(session, where: (row) => row.at < before)
        .then((rows) => rows.length);
  }
}
