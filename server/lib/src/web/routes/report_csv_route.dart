import 'package:serverpod/serverpod.dart';

import '../../auth/phone_auth.dart';
import '../../generated/protocol.dart';
import '../../services/reports/report_service.dart';

/// Выгрузка отчёта таблицей: `/hasabat.csv?t=...`.
///
/// Владелец смотрит цифры в приложении, но месячную таблицу открывают на
/// ноутбуке. Поэтому выгрузка — обычная ссылка: перешёл, скачался файл,
/// открылся в Excel. Ставить ничего не нужно.
///
/// Ссылка одноразовая и живёт минуты: в файле выручка и балансы всех
/// семей, и он отдаётся без входа.
class ReportCsvRoute extends Route {
  @override
  Future<Result> handleCall(Session session, Request request) async {
    final token = request.url.queryParameters['t'] ?? '';
    final export = await ReportExport.db.findFirstRow(
      session,
      where: (row) => row.tokenHash.equals(PhoneAuth.hash(token)),
    );

    final now = DateTime.now().toUtc();
    if (export == null ||
        export.usedAt != null ||
        export.expiresAt.isBefore(now)) {
      return Response.notFound(
        body: Body.fromString(
          'Ссылка недействительна. Запросите новую в приложении.',
          mimeType: MimeType.plainText,
        ),
      );
    }

    // Сгорает при первом скачивании: ссылку нельзя переслать дальше.
    await ReportExport.db.updateRow(session, export.copyWith(usedAt: now));

    final service = ReportService(
      smsPriceTenge: export.smsPriceTenge,
      blockPayTenge: export.blockPayTenge,
      perRideTenge: export.perRideTenge,
    );
    final report = await service.report(
      session,
      fromDate: export.fromDate,
      toDate: export.toDate,
    );

    final name = 'child-${_date(export.fromDate)}-${_date(export.toDate)}.csv';

    return Response.ok(
      body: Body.fromString(service.toCsv(report), mimeType: MimeType.csv),
      headers: Headers.build(
        (mh) => mh
          ..cacheControl = CacheControlHeader(
            noStore: true,
            privateCache: true,
          )
          ..contentDisposition = ContentDispositionHeader(
            type: 'attachment',
            parameters: [
              ContentDispositionParameter(name: 'filename', value: name),
            ],
          ),
      ),
    );
  }

  String _date(DateTime value) =>
      '${value.year}${value.month.toString().padLeft(2, '0')}'
      '${value.day.toString().padLeft(2, '0')}';
}
