import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../auth/phone_auth.dart';
import '../../generated/protocol.dart';
import '../clock.dart';

/// Сиды для нагрузочного прогона.
///
/// Нагрузку надо мерить на том пути, который ломается в проде: водитель
/// жмёт «Забрал» — сервер пишет событие, двигает статус, списывает
/// деньги и ставит уведомления в очередь. Проверка живости (`/health`)
/// про это не знает ничего.
///
/// Всё созданное помечено служебным префиксом и убирается `cleanup`:
/// мусор от нагрузки не должен оседать в базе разработки.
class LoadFixtureService {
  LoadFixtureService({this.clock = const Clock()});

  final Clock clock;

  /// Префикс в именах: по нему находим и удаляем засеянное.
  static const marker = 'LOAD-';

  /// Служебный диапазон номеров, которого нет у настоящих людей.
  static const phonePrefix = '+99399';

  static const institutionCode = '9999';

  /// Засевает водителей с поездками на сегодня.
  ///
  /// Поездки сразу в статусе «подтверждена»: нагрузку меряем на самих
  /// этапах, а не на подготовке к ним.
  Future<LoadFixture> seed(
    Session session, {
    required int drivers,
    required int ridesPerDriver,
  }) async {
    if (drivers < 1 || ridesPerDriver < 1) {
      throw Exception('Нужен хотя бы один водитель и одна поездка');
    }

    final now = clock.now();
    final today = AshgabatTime.dateOf(now);

    final institution = await Institution.db.insertRow(
      session,
      Institution(
        type: InstitutionType.school,
        name: '$markerШкола нагрузки',
        address: 'Ашхабад, нагрузочный прогон',
        handoverCode: institutionCode,
      ),
    );

    final seeded = <LoadDriver>[];
    var rides = 0;

    for (var d = 0; d < drivers; d++) {
      final driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '$phonePrefix${d.toString().padLeft(4, '0')}',
          name: '$markerВодитель $d',
          carModel: 'Toyota Corolla',
          carPlate: 'LD ${d.toString().padLeft(4, '0')} AH',
          vettingStatus: VettingStatus.verified,
          childSeats: ridesPerDriver,
          createdAt: now,
        ),
      );

      // Обучение сдано: без него маршруты не назначаются.
      await TrainingResult.db.insertRow(
        session,
        TrainingResult(
          driverId: driver.id!,
          correct: 10,
          total: 10,
          passed: true,
          createdAt: now,
        ),
      );

      final token = PhoneAuth.generateToken();
      await AuthToken.db.insertRow(
        session,
        AuthToken(
          tokenHash: PhoneAuth.hash(token),
          role: AccountRole.driver,
          subjectId: driver.id!,
          phone: driver.phone,
          expiresAt: now.add(const Duration(hours: 2)),
        ),
      );

      final rideIds = <int>[];
      for (var r = 0; r < ridesPerDriver; r++) {
        final family = await Family.db.insertRow(
          session,
          Family(
            name: '$markerСемья $d-$r',
            ownerPhone: '$phonePrefix$d$r',
            createdAt: now,
          ),
        );
        // Родитель нужен по-настоящему: на него уходит каскад уведомлений,
        // а это половина работы, которую мы и меряем.
        await Parent.db.insertRow(
          session,
          Parent(
            familyId: family.id!,
            phone: '$phonePrefix$d$r',
            name: '$markerРодитель $d-$r',
            role: ParentRole.owner,
          ),
        );
        final child = await Child.db.insertRow(
          session,
          Child(
            familyId: family.id!,
            name: '$markerРебёнок $d-$r',
            codeWord: _codeWord,
          ),
        );

        final template = await RouteTemplate.db.insertRow(
          session,
          RouteTemplate(
            childId: child.id!,
            weekdays: const [1, 2, 3, 4, 5, 6, 7],
            pickupTime: '07:${(r % 60).toString().padLeft(2, '0')}',
            fromAddress: 'Ашхабад, дом $d-$r',
            toInstitutionId: institution.id,
            direction: RouteDirection.toInstitution,
            driverId: driver.id,
            pricePerRideTenge: 3500,
            active: true,
          ),
        );

        final ride = await Ride.db.insertRow(
          session,
          Ride(
            templateId: template.id,
            childId: child.id!,
            driverId: driver.id,
            date: today,
            plannedTime: template.pickupTime,
            status: RideStatus.confirmed,
            confirmedAt: now,
            createdAt: now,
          ),
        );
        await RideSeat.db.insertRow(
          session,
          RideSeat(
            rideId: ride.id!,
            childId: child.id!,
            templateId: template.id,
            seatPriceTenge: 3500,
          ),
        );

        // Деньги на балансе: иначе списание за поездку уйдёт в минус и
        // мы будем мерить не тот путь, что в проде.
        await LedgerEntry.db.insertRow(
          session,
          LedgerEntry(
            familyId: family.id!,
            type: LedgerEntryType.cashTopup,
            amountTenge: 3500 * ridesPerDriver,
            note: '$markerпополнение',
            dedupeKey: 'load-topup:${family.id}',
            createdAt: now,
          ),
        );

        rideIds.add(ride.id!);
        rides++;
      }

      seeded.add(
        LoadDriver(
          token: token,
          driverId: driver.id!,
          codeWord: _codeWord,
          rideIds: rideIds,
        ),
      );
    }

    return LoadFixture(
      drivers: seeded,
      institutionCode: institutionCode,
      rides: rides,
    );
  }

  /// Сколько засеянных поездок реально доведено до конца.
  ///
  /// Нагрузочный прогон, который «прошёл», не довезя ни одного ребёнка,
  /// измеряет скорость отказов, а не работу сервиса.
  Future<int> handedOver(Session session) async {
    final families = await Family.db.find(
      session,
      where: (row) => row.name.like('$marker%'),
    );
    if (families.isEmpty) return 0;

    final children = await Child.db.find(
      session,
      where: (row) => row.familyId.inSet(families.map((f) => f.id!).toSet()),
    );
    if (children.isEmpty) return 0;

    return Ride.db.count(
      session,
      where: (row) =>
          row.childId.inSet(children.map((c) => c.id!).toSet()) &
          row.status.equals(RideStatus.handedOver),
    );
  }

  /// Убирает всё засеянное нагрузкой.
  ///
  /// Возвращает число удалённых семей — по нему видно, что уборка
  /// действительно сработала.
  Future<int> cleanup(Session session) async {
    // Порядок важен: сначала то, что не удаляется каскадом.
    final drivers = await Driver.db.find(
      session,
      where: (row) => row.phone.like('$phonePrefix%'),
    );
    final driverIds = drivers.map((driver) => driver.id!).toList();

    if (driverIds.isNotEmpty) {
      await AuthToken.db.deleteWhere(
        session,
        where: (row) =>
            row.subjectId.inSet(driverIds.toSet()) &
            row.role.equals(AccountRole.driver),
      );
    }

    // Семьи уносят с собой детей, поездки, места и книгу операций.
    final families = await Family.db.deleteWhere(
      session,
      where: (row) => row.name.like('$marker%'),
    );

    await NotificationOutbox.db.deleteWhere(
      session,
      where: (row) => row.recipientPhone.like('$phonePrefix%'),
    );
    await Driver.db.deleteWhere(
      session,
      where: (row) => row.phone.like('$phonePrefix%'),
    );
    await Institution.db.deleteWhere(
      session,
      where: (row) => row.name.like('$marker%'),
    );

    return families.length;
  }

  /// Одно кодовое слово на весь прогон: скрипту не нужно помнить разные,
  /// а проверку кода это не ослабляет — сервер всё равно сверяет его.
  static const _codeWord = 'load';
}
