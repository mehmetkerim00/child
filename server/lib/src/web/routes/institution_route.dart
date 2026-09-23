import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../services/institutions/institution_service.dart';
import '../web_texts.dart';

/// Страница учреждения: открывается по ссылке с токеном.
///
/// Никакой установки и аккаунтов: воспитатель открывает ссылку на любом
/// телефоне и видит, кого сегодня привезут. Кнопка «Принял(а)» даёт
/// независимое подтверждение передачи ребёнка.
///
/// Язык страницы — из `?lang=`, иначе язык браузера, иначе русский.
/// Переключатель есть прямо на странице: воспитателю негде задать язык
/// заранее, аккаунта у него нет.
class InstitutionRoute extends WidgetRoute {
  @override
  Future<WebWidget> build(Session session, Request request) async {
    final token = request.url.queryParameters['t'] ?? '';
    final locale = WebTexts.pickLocale(
      param: request.url.queryParameters['lang'],
      acceptLanguage: request.headers['accept-language']?.first,
    );
    final service = InstitutionService();
    final institution = await service.institutionForToken(session, token);

    if (institution == null) {
      final title = WebTexts.t('linkInvalid', locale);
      return _page(
        locale: locale,
        title: title,
        content:
            '<h1>${_escape(title)}</h1>'
            '<p class="empty">'
            '${_escape(WebTexts.t('linkInvalidHint', locale))}</p>',
      );
    }

    // Подтверждение приёма приходит тем же запросом: форма без JavaScript
    // работает на любом старом телефоне.
    final confirmRide = request.url.queryParameters['confirm_ride'];
    final confirmChild = request.url.queryParameters['confirm_child'];
    final confirmedBy = request.url.queryParameters['by'] ?? '';
    if (confirmRide != null && confirmChild != null) {
      await service.confirmArrival(
        session,
        rideId: int.parse(confirmRide),
        childId: int.parse(confirmChild),
        confirmedBy: confirmedBy,
      );
    }

    final day = await service.dayView(session, institution: institution);
    final local = AshgabatTime.toLocal(day.date);
    final dateText =
        '${local.day}.${local.month.toString().padLeft(2, '0')}.${local.year}';

    final buffer = StringBuffer()
      ..writeln(_languageSwitch(token, locale))
      ..writeln('<h1>${_escape(day.institutionName)}</h1>')
      ..writeln('<p class="date">$dateText</p>')
      ..writeln('<h2>${_escape(WebTexts.t('arrivals', locale))}</h2>')
      ..writeln(_rows(day.arrivals, token, locale, canConfirm: true))
      ..writeln('<h2>${_escape(WebTexts.t('departures', locale))}</h2>')
      ..writeln(_rows(day.departures, token, locale, canConfirm: false));

    return _page(
      locale: locale,
      title: day.institutionName,
      content: buffer.toString(),
    );
  }

  /// Переключатель языка: три ссылки на ту же страницу.
  ///
  /// Ссылками, а не выпадающим списком: страница без JavaScript должна
  /// работать на любом старом телефоне.
  String _languageSwitch(String token, String current) {
    final buffer = StringBuffer('<nav class="lang">');
    for (final locale in WebTexts.locales) {
      final name = _escape(WebTexts.localeNames[locale]!);
      if (locale == current) {
        buffer.write('<span class="current">$name</span>');
      } else {
        buffer.write(
          '<a href="?t=${_escape(token)}&lang=$locale">$name</a>',
        );
      }
    }
    buffer.write('</nav>');
    return buffer.toString();
  }

  String _rows(
    List<dynamic> rows,
    String token,
    String locale, {
    required bool canConfirm,
  }) {
    if (rows.isEmpty) {
      return '<p class="empty">${_escape(WebTexts.t('nobody', locale))}</p>';
    }

    final buffer = StringBuffer('<ul class="children">');
    for (final row in rows) {
      final absent = row.absenceReason != null;
      final confirmed = row.confirmedByInstitutionAt != null;
      final delivered = row.handedOverAt != null;

      buffer.write('<li class="${absent ? 'absent' : ''}">');
      buffer.write('<div class="row">');
      buffer.write('<span class="time">${_escape(row.plannedTime)}</span>');
      buffer.write('<span class="name">${_escape(row.childName)}</span>');
      buffer.write('</div>');

      if (row.driverName != null) {
        buffer.write(
          '<div class="driver">${_escape(WebTexts.t('driver', locale))}: '
          '${_escape(row.driverName as String)}</div>',
        );
      }

      if (absent) {
        buffer.write(
          '<div class="status absent-text">'
          '${_escape(WebTexts.t('notRidingToday', locale))}: '
          '${_escape(row.absenceReason as String)}</div>',
        );
      } else if (confirmed) {
        buffer.write(
          '<div class="status ok">'
          '${_escape(WebTexts.t('accepted', locale))} ✓</div>',
        );
      } else if (canConfirm) {
        final hint = delivered
            ? WebTexts.t('handedOverConfirm', locale)
            : WebTexts.t('notArrivedYet', locale);
        buffer.write('<div class="status">${_escape(hint)}</div>');
        buffer.write(
          '<form method="get" class="confirm">'
          '<input type="hidden" name="t" value="${_escape(token)}">'
          '<input type="hidden" name="lang" value="$locale">'
          '<input type="hidden" name="confirm_ride" value="${row.rideId}">'
          '<input type="hidden" name="confirm_child" value="${row.childId}">'
          '<input type="text" name="by" '
          'placeholder="${_escape(WebTexts.t('yourName', locale))}" required>'
          '<button type="submit">'
          '${_escape(WebTexts.t('accept', locale))}</button>'
          '</form>',
        );
      }
      buffer.write('</li>');
    }
    buffer.write('</ul>');
    return buffer.toString();
  }

  /// Страница рассчитана на старый телефон: крупный шрифт, без скриптов —
  /// форма подтверждения работает обычным GET-запросом.
  TemplateWidget _page({
    required String locale,
    required String title,
    required String content,
  }) {
    return TemplateWidget(
      name: 'institution',
      values: {
        'title': title,
        'content': content,
        'locale': locale,
        'footer': WebTexts.t('footer', locale),
      },
    );
  }

  String _escape(String value) => value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;');
}
