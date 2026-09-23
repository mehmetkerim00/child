import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../auth/phone_auth.dart';
import '../generated/protocol.dart';
import '../services/reports/report_service.dart';
import 'session_subject.dart';

/// Отчёты владельцу.
///
/// Роль отдельная от диспетчера: диспетчер управляет поездками и не видит
/// выручку, владелец видит деньги и не трогает чужой рабочий день.
class OwnerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('owner')};

  /// Сколько живёт ссылка на выгрузку.
  ///
  /// Файл с выручкой и балансами семей открывается в браузере без входа,
  /// поэтому ссылка одноразовая и короткоживущая: успеть открыть на
  /// ноутбуке — да, оставить в переписке навсегда — нет.
  static const exportLinkLifetime = Duration(minutes: 15);

  /// Отчёт за период.
  Future<OwnerReport> report(
    Session session, {
    required DateTime fromDate,
    required DateTime toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
  }) async {
    await session.requireOwner();
    return _service(
      smsPriceTenge: smsPriceTenge,
      blockPayTenge: blockPayTenge,
      perRideTenge: perRideTenge,
    ).report(session, fromDate: fromDate, toDate: toDate);
  }

  /// Отчёт за сегодня — то, что владелец открывает чаще всего.
  Future<OwnerReport> today(Session session) async {
    await session.requireOwner();
    final today = AshgabatTime.today();
    return ReportService().report(session, fromDate: today, toDate: today);
  }

  /// Одноразовая ссылка на выгрузку в таблицу.
  ///
  /// Возвращает путь вида `/hasabat.csv?t=...`: его открывают на ноутбуке,
  /// где такие файлы и смотрят. Токен живёт 15 минут и сгорает после
  /// первого скачивания.
  Future<String> exportLink(
    Session session, {
    required DateTime fromDate,
    required DateTime toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
  }) async {
    final owner = await session.requireOwner();
    final token = PhoneAuth.generateToken();

    await ReportExport.db.insertRow(
      session,
      ReportExport(
        tokenHash: PhoneAuth.hash(token),
        ownerId: owner.id!,
        fromDate: AshgabatTime.dateOf(fromDate),
        toDate: AshgabatTime.dateOf(toDate),
        smsPriceTenge: smsPriceTenge ?? ReportService.defaultSmsPriceTenge,
        blockPayTenge: blockPayTenge ?? ReportService.defaultBlockPayTenge,
        perRideTenge: perRideTenge ?? ReportService.defaultPerRideTenge,
        createdAt: DateTime.now().toUtc(),
        expiresAt: DateTime.now().toUtc().add(exportLinkLifetime),
      ),
    );

    return '/hasabat.csv?t=$token';
  }

  /// Балансы всех семей: кто в минусе и на сколько.
  ///
  /// Минус — это уже сделанные поездки, за которые не заплатили. Владелец
  /// должен видеть этот список раньше, чем он станет большим.
  Future<List<FamilyBalanceRow>> familyBalances(Session session) async {
    await session.requireOwner();
    final families = await Family.db.find(session, orderBy: (f) => f.name);
    final entries = await LedgerEntry.db.find(session);

    final balances = <int, int>{};
    for (final entry in entries) {
      balances[entry.familyId] =
          (balances[entry.familyId] ?? 0) + entry.amountTenge;
    }

    final rows = [
      for (final family in families)
        FamilyBalanceRow(
          familyId: family.id!,
          familyName: family.name,
          balanceTenge: balances[family.id] ?? 0,
          inDebt: (balances[family.id] ?? 0) < 0,
        ),
    ];
    // Должники — сверху.
    rows.sort((a, b) => a.balanceTenge.compareTo(b.balanceTenge));
    return rows;
  }

  ReportService _service({
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
  }) {
    return ReportService(
      smsPriceTenge: smsPriceTenge ?? ReportService.defaultSmsPriceTenge,
      blockPayTenge: blockPayTenge ?? ReportService.defaultBlockPayTenge,
      perRideTenge: perRideTenge ?? ReportService.defaultPerRideTenge,
    );
  }
}
