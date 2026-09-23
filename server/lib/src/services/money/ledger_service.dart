import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';
import '../rides/ride_pool.dart';

/// Книга операций семьи.
///
/// Три правила, которые здесь соблюдаются буквально:
/// 1. Все суммы — целые числа в тенге (1 манат = 100 тенге). Никакой
///    дробной арифметики: деньги нельзя округлять «как получится».
/// 2. Книга только дописывается. В этом классе нет ни одного обновления
///    и удаления записей: ошибку исправляют новой записью с причиной.
/// 3. Списание за поездку идемпотентно: одна поездка — максимум одно
///    списание, сколько бы раз ни пришло событие «передал».
class LedgerService {
  LedgerService({this.clock = const Clock()});

  final Clock clock;

  /// Порог предупреждения: меньше трёх поездок на балансе — пора пополнять.
  static const lowBalanceRides = 3;

  /// Баланс семьи: сумма всех записей книги.
  Future<int> balance(Session session, int familyId) async {
    final entries = await LedgerEntry.db.find(
      session,
      where: (row) => row.familyId.equals(familyId),
    );
    return entries.fold<int>(0, (sum, row) => sum + row.amountTenge);
  }

  /// Наличные, принятые водителем, но ещё не подтверждённые диспетчером.
  Future<int> pendingTopUp(Session session, int familyId) async {
    final requests = await CashTopUp.db.find(
      session,
      where: (row) =>
          row.familyId.equals(familyId) &
          row.confirmedAt.equals(null) &
          row.rejectedAt.equals(null),
    );
    return requests.fold<int>(0, (sum, row) => sum + row.amountTenge);
  }

  /// Списание за состоявшуюся поездку.
  ///
  /// В пуле каждая семья платит только за своё место. Ключ идемпотентности
  /// на место, а не на поездку: одно место — одно списание, сколько бы раз
  /// ни пришло «передал».
  Future<List<LedgerEntry>> chargeRide(Session session, Ride ride) async {
    final seats = await RidePool.activeSeats(session, ride.id!);
    final charged = <LedgerEntry>[];

    for (final seat in seats) {
      // Списываем только за фактически доставленных детей.
      if (seat.handedOverAt == null) continue;
      if (seat.seatPriceTenge <= 0) continue;

      final child = await Child.db.findById(session, seat.childId);
      if (child == null) continue;

      final entry = await _append(
        session,
        familyId: child.familyId,
        type: LedgerEntryType.rideCharge,
        amountTenge: -seat.seatPriceTenge,
        dedupeKey: 'ride-charge:seat:${seat.id}',
        rideId: ride.id,
        driverId: ride.driverId,
        note: 'Поездка ${ride.plannedTime}, ${child.name}',
      );
      if (entry != null) charged.add(entry);
    }
    return charged;
  }

  /// Водитель принял наличные: это заявка, а не зачисление.
  Future<CashTopUp> recordCashTopUp(
    Session session, {
    required int familyId,
    required int driverId,
    required int amountTenge,
    bool hasSignature = false,
    String? note,
  }) async {
    if (amountTenge <= 0) {
      throw Exception('Сумма пополнения должна быть больше нуля');
    }
    return CashTopUp.db.insertRow(
      session,
      CashTopUp(
        familyId: familyId,
        driverId: driverId,
        amountTenge: amountTenge,
        hasSignature: hasSignature,
        note: note,
        createdAt: clock.now(),
      ),
    );
  }

  /// Диспетчер подтвердил приём наличных — только теперь деньги попадают
  /// в книгу операций.
  Future<LedgerEntry?> confirmCashTopUp(
    Session session, {
    required int topUpId,
    int? dispatcherId,
  }) async {
    final request = await CashTopUp.db.findById(session, topUpId);
    if (request == null) throw Exception('Пополнение не найдено');
    if (request.rejectedAt != null) {
      throw Exception('Пополнение уже отклонено');
    }

    final now = clock.now();
    if (request.confirmedAt == null) {
      await CashTopUp.db.updateRow(
        session,
        request.copyWith(confirmedAt: now, confirmedBy: dispatcherId),
      );
    }

    // Ключ идемпотентности: повторное подтверждение денег не удвоит.
    return _append(
      session,
      familyId: request.familyId,
      type: LedgerEntryType.cashTopup,
      amountTenge: request.amountTenge,
      dedupeKey: 'cash-topup:${request.id}',
      driverId: request.driverId,
      note: request.note ?? 'Наличные водителю',
    );
  }

  /// Диспетчер отклонил заявку: денег не было или сумма неверна.
  Future<CashTopUp> rejectCashTopUp(
    Session session, {
    required int topUpId,
    required String reason,
  }) async {
    if (reason.trim().isEmpty) {
      throw Exception('Нужно указать причину отказа');
    }
    final request = await CashTopUp.db.findById(session, topUpId);
    if (request == null) throw Exception('Пополнение не найдено');
    if (request.confirmedAt != null) {
      throw Exception('Пополнение уже подтверждено, нужна корректировка');
    }
    return CashTopUp.db.updateRow(
      session,
      request.copyWith(rejectedAt: clock.now(), rejectReason: reason.trim()),
    );
  }

  /// Корректировка — единственный способ исправить ошибку в книге.
  ///
  /// Причина обязательна: через месяц никто не вспомнит, почему у семьи
  /// вдруг изменился баланс.
  Future<LedgerEntry?> adjust(
    Session session, {
    required int familyId,
    required int amountTenge,
    required String reason,
  }) async {
    if (reason.trim().isEmpty) {
      throw Exception('Корректировка без причины недопустима');
    }
    if (amountTenge == 0) {
      throw Exception('Нулевая корректировка бессмысленна');
    }
    final now = clock.now();
    return _append(
      session,
      familyId: familyId,
      type: LedgerEntryType.adjust,
      amountTenge: amountTenge,
      dedupeKey: 'adjust:$familyId:${now.microsecondsSinceEpoch}',
      note: reason.trim(),
    );
  }

  /// Баланс и история для экрана родителя.
  Future<BalanceView> balanceView(Session session, int familyId) async {
    final entries = await LedgerEntry.db.find(
      session,
      where: (row) => row.familyId.equals(familyId),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
      limit: 100,
    );
    final balanceTenge = await balance(session, familyId);
    final pending = await pendingTopUp(session, familyId);
    final price = await _ridePrice(session, familyId);

    return BalanceView(
      balanceTenge: balanceTenge,
      pendingTopUpTenge: pending,
      ridePriceTenge: price,
      lowBalance: price > 0 && balanceTenge < price * lowBalanceRides,
      entries: entries,
    );
  }

  /// Цена поездки по активным маршрутам семьи: берём максимальную,
  /// чтобы предупреждение о низком балансе не запаздывало.
  Future<int> _ridePrice(Session session, int familyId) async {
    final children = await Child.db.find(
      session,
      where: (row) => row.familyId.equals(familyId),
    );
    final ids = children.map((child) => child.id!).toSet();
    if (ids.isEmpty) return 0;

    final templates = await RouteTemplate.db.find(
      session,
      where: (row) => row.childId.inSet(ids) & row.active.equals(true),
    );
    return templates.fold<int>(
      0,
      (max, row) => row.pricePerRideTenge > max ? row.pricePerRideTenge : max,
    );
  }

  /// Единственный способ попасть в книгу операций — дописать запись.
  Future<LedgerEntry?> _append(
    Session session, {
    required int familyId,
    required LedgerEntryType type,
    required int amountTenge,
    required String dedupeKey,
    int? rideId,
    int? driverId,
    String? note,
  }) async {
    final existing = await LedgerEntry.db.findFirstRow(
      session,
      where: (row) => row.dedupeKey.equals(dedupeKey),
    );
    if (existing != null) return null;

    return LedgerEntry.db.insertRow(
      session,
      LedgerEntry(
        familyId: familyId,
        type: type,
        amountTenge: amountTenge,
        rideId: rideId,
        driverId: driverId,
        note: note,
        dedupeKey: dedupeKey,
        createdAt: clock.now(),
      ),
    );
  }
}
