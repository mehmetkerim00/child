/// Строки страницы учреждения на трёх языках.
///
/// Живут на сервере, а не в core_l10n: страницу отдаёт веб-сервер,
/// приложения тут ни при чём. Набор маленький намеренно — воспитателю
/// нужны список детей и одна кнопка, а не интерфейс.
abstract final class WebTexts {
  /// Поддерживаемые языки в порядке переключателя.
  static const locales = ['ru', 'tk', 'en'];

  /// Как язык подписан в переключателе — на самом себе.
  static const localeNames = {
    'ru': 'Русский',
    'tk': 'Türkmen',
    'en': 'English',
  };

  static const _texts = <String, Map<String, String>>{
    'linkInvalid': {
      'ru': 'Ссылка недействительна',
      'tk': 'Salgy hereket etmeýär',
      'en': 'This link is no longer valid',
    },
    'linkInvalidHint': {
      'ru':
          'Эта ссылка больше не работает. Попросите диспетчера прислать '
          'новую.',
      'tk': 'Bu salgy indi işlemeýär. Dispetçerden täzesini soraň.',
      'en': 'This link no longer works. Ask the dispatcher to send a new one.',
    },
    'arrivals': {'ru': 'Привезут', 'tk': 'Getirerler', 'en': 'Arriving'},
    'departures': {'ru': 'Заберут', 'tk': 'Alyp giderler', 'en': 'Leaving'},
    'nobody': {
      'ru': 'Сегодня никого',
      'tk': 'Şu gün hiç kim ýok',
      'en': 'Nobody today',
    },
    'driver': {'ru': 'Водитель', 'tk': 'Sürüji', 'en': 'Driver'},
    'notRidingToday': {
      'ru': 'Сегодня не едет',
      'tk': 'Şu gün gitmeýär',
      'en': 'Not riding today',
    },
    'accepted': {'ru': 'Приняли', 'tk': 'Kabul edildi', 'en': 'Received'},
    'handedOverConfirm': {
      'ru': 'Водитель передал — подтвердите приём',
      'tk': 'Sürüji tabşyrdy — kabul edendigiňizi tassyklaň',
      'en': 'The driver handed the child over — please confirm',
    },
    'notArrivedYet': {
      'ru': 'Ещё не привезли',
      'tk': 'Heniz getirmediler',
      'en': 'Not arrived yet',
    },
    'yourName': {'ru': 'Ваше имя', 'tk': 'Adyňyz', 'en': 'Your name'},
    'accept': {'ru': 'Принял(а)', 'tk': 'Kabul etdim', 'en': 'I received'},
    'footer': {
      'ru': 'Child — безопасные детские перевозки',
      'tk': 'Child — çagalary howpsuz gatnatmak',
      'en': 'Child — safe rides for children',
    },
  };

  /// Строка на нужном языке; незнакомый язык — русский.
  static String t(String key, String locale) {
    final byLocale = _texts[key];
    if (byLocale == null) return key;
    return byLocale[locale] ?? byLocale['ru']!;
  }

  /// Выбирает язык страницы.
  ///
  /// Сначала явный выбор в ссылке (`?lang=`), потом язык браузера из
  /// заголовка Accept-Language — это web-аналог языка телефона. Всё
  /// остальное — русский.
  static String pickLocale({String? param, String? acceptLanguage}) {
    if (param != null && locales.contains(param)) return param;

    if (acceptLanguage != null) {
      // «tk-TM,tk;q=0.9,ru;q=0.8» — берём первый понятный нам язык.
      for (final part in acceptLanguage.split(',')) {
        final code = part
            .split(';')
            .first
            .trim()
            .split('-')
            .first
            .toLowerCase();
        if (locales.contains(code)) return code;
      }
    }

    return 'ru';
  }
}
