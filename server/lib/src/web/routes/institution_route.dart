import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../services/institutions/institution_service.dart';

/// Страница учреждения: открывается по ссылке с токеном.
///
/// Никакой установки и аккаунтов: воспитатель открывает ссылку на любом
/// телефоне и видит, кого сегодня привезут. Кнопка «Принял(а)» даёт
/// независимое подтверждение передачи ребёнка.
class InstitutionRoute extends WidgetRoute {
  @override
  Future<WebWidget> build(Session session, Request request) async {
    final token = request.url.queryParameters['t'] ?? '';
    final service = InstitutionService();
    final institution = await service.institutionForToken(session, token);

    if (institution == null) {
      return _page(
        title: 'Ссылка недействительна',
        content:
            '<h1>Ссылка недействительна</h1>'
            '<p class="empty">Эта ссылка больше не работает. '
            'Попросите диспетчера прислать новую.</p>',
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
      ..writeln('<h1>${_escape(day.institutionName)}</h1>')
      ..writeln('<p class="date">$dateText</p>')
      ..writeln('<h2>Привезут</h2>')
      ..writeln(_rows(day.arrivals, token, canConfirm: true))
      ..writeln('<h2>Заберут</h2>')
      ..writeln(_rows(day.departures, token, canConfirm: false));

    return _page(title: day.institutionName, content: buffer.toString());
  }

  String _rows(
    List<dynamic> rows,
    String token, {
    required bool canConfirm,
  }) {
    if (rows.isEmpty) return '<p class="empty">Сегодня никого</p>';

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
          '<div class="driver">Водитель: '
          '${_escape(row.driverName as String)}</div>',
        );
      }

      if (absent) {
        buffer.write(
          '<div class="status absent-text">Сегодня не едет: '
          '${_escape(row.absenceReason as String)}</div>',
        );
      } else if (confirmed) {
        buffer.write('<div class="status ok">Приняли ✓</div>');
      } else if (canConfirm) {
        final hint = delivered
            ? 'Водитель передал — подтвердите приём'
            : 'Ещё не привезли';
        buffer.write('<div class="status">$hint</div>');
        buffer.write(
          '<form method="get" class="confirm">'
          '<input type="hidden" name="t" value="${_escape(token)}">'
          '<input type="hidden" name="confirm_ride" value="${row.rideId}">'
          '<input type="hidden" name="confirm_child" value="${row.childId}">'
          '<input type="text" name="by" placeholder="Ваше имя" required>'
          '<button type="submit">Принял(а)</button>'
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
  TemplateWidget _page({required String title, required String content}) {
    return TemplateWidget(
      name: 'institution',
      values: {'title': title, 'content': content},
    );
  }

  String _escape(String value) => value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;');
}
