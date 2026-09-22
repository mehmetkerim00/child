import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Тестовые данные для разработки и ручной проверки.
///
/// Работает только в режиме development — в проде эндпоинт отвечает отказом.
class DevEndpoint extends Endpoint {
  /// Заполняет базу демо-данными: диспетчер, две семьи с детьми,
  /// два водителя, два учреждения. Повторный вызов ничего не дублирует.
  Future<String> seed(Session session) async {
    if (session.serverpod.runMode != 'development') {
      throw Exception('Сиды доступны только в режиме development');
    }

    await _dispatcher(
      session,
      phone: '+99365000001',
      name: 'Диспетчер Мерджен',
    );

    final aman = await _driver(
      session,
      phone: '+99365100001',
      name: 'Аман Гурбанов',
      car: 'Toyota Corolla',
      plate: 'AG 1234 AH',
      isFemale: false,
    );
    final maya = await _driver(
      session,
      phone: '+99365100002',
      name: 'Майя Аннаева',
      car: 'Hyundai Elantra',
      plate: 'MA 5678 AH',
      isFemale: true,
    );

    final school = await _institution(
      session,
      type: InstitutionType.school,
      name: 'Школа №20',
      address: 'Ашхабад, ул. Героглы 45',
      code: '2024',
    );
    await _institution(
      session,
      type: InstitutionType.kindergarten,
      name: 'Детский сад «Bagtyýar»',
      address: 'Ашхабад, ул. Огузхана 12',
      code: '1717',
    );

    await _family(
      session,
      name: 'Семья Ниязовых',
      phone: '+99365200001',
      parentName: 'Огулджан Ниязова',
      children: [
        (name: 'Мерет', year: 2017, code: 'ýyldyz'),
        (name: 'Айна', year: 2019, code: 'gülälek'),
      ],
      primaryDriverId: aman.id!,
      backupDriverId: maya.id!,
    );
    await _family(
      session,
      name: 'Семья Атаевых',
      phone: '+99365200002',
      parentName: 'Бегенч Атаев',
      children: [(name: 'Сельби', year: 2016, code: 'deňiz')],
      primaryDriverId: maya.id!,
      backupDriverId: aman.id!,
    );

    return 'Данные готовы. Диспетчер: +993 65 00-00-01, '
        'родитель: +993 65 20-00-01, водитель: +993 65 10-00-01. '
        'Учреждение для передачи: ${school.name}, код ${school.handoverCode}.';
  }

  Future<DispatcherAccount> _dispatcher(
    Session session, {
    required String phone,
    required String name,
  }) async {
    final existing = await DispatcherAccount.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone),
    );
    if (existing != null) return existing;
    return DispatcherAccount.db.insertRow(
      session,
      DispatcherAccount(phone: phone, name: name),
    );
  }

  Future<Driver> _driver(
    Session session, {
    required String phone,
    required String name,
    required String car,
    required String plate,
    required bool isFemale,
  }) async {
    final existing = await Driver.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone),
    );
    if (existing != null) return existing;
    return Driver.db.insertRow(
      session,
      Driver(
        phone: phone,
        name: name,
        carModel: car,
        carPlate: plate,
        vettingStatus: VettingStatus.verified,
        isFemale: isFemale,
        experienceNote: 'Стаж 8 лет, возит детей 3 года',
      ),
    );
  }

  Future<Institution> _institution(
    Session session, {
    required InstitutionType type,
    required String name,
    required String address,
    required String code,
  }) async {
    final existing = await Institution.db.findFirstRow(
      session,
      where: (i) => i.name.equals(name),
    );
    if (existing != null) return existing;
    return Institution.db.insertRow(
      session,
      Institution(
        type: type,
        name: name,
        address: address,
        handoverCode: code,
        contactPhone: '+99312000000',
      ),
    );
  }

  Future<Family> _family(
    Session session, {
    required String name,
    required String phone,
    required String parentName,
    required List<({String name, int year, String code})> children,
    required int primaryDriverId,
    required int backupDriverId,
  }) async {
    final existing = await Family.db.findFirstRow(
      session,
      where: (f) => f.ownerPhone.equals(phone),
    );
    if (existing != null) return existing;

    final family = await Family.db.insertRow(
      session,
      Family(name: name, ownerPhone: phone),
    );
    await Parent.db.insertRow(
      session,
      Parent(
        familyId: family.id!,
        phone: phone,
        name: parentName,
        role: ParentRole.owner,
      ),
    );
    for (final child in children) {
      await Child.db.insertRow(
        session,
        Child(
          familyId: family.id!,
          name: child.name,
          birthYear: child.year,
          codeWord: child.code,
        ),
      );
    }
    await FamilyCircle.db.insertRow(
      session,
      FamilyCircle(
        familyId: family.id!,
        driverId: primaryDriverId,
        rank: CircleRank.primary,
      ),
    );
    await FamilyCircle.db.insertRow(
      session,
      FamilyCircle(
        familyId: family.id!,
        driverId: backupDriverId,
        rank: CircleRank.backup1,
      ),
    );
    return family;
  }
}
