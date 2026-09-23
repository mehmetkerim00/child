// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_database.dart';

// ignore_for_file: type=lint
class $PendingEventsTable extends PendingEvents
    with TableInfo<$PendingEventsTable, PendingEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientEventIdMeta = const VerificationMeta(
    'clientEventId',
  );
  @override
  late final GeneratedColumn<String> clientEventId = GeneratedColumn<String>(
    'client_event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _rideIdMeta = const VerificationMeta('rideId');
  @override
  late final GeneratedColumn<int> rideId = GeneratedColumn<int>(
    'ride_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
    'child_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
    'at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeWordMeta = const VerificationMeta(
    'codeWord',
  );
  @override
  late final GeneratedColumn<String> codeWord = GeneratedColumn<String>(
    'code_word',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _institutionCodeMeta = const VerificationMeta(
    'institutionCode',
  );
  @override
  late final GeneratedColumn<String> institutionCode = GeneratedColumn<String>(
    'institution_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasSignatureMeta = const VerificationMeta(
    'hasSignature',
  );
  @override
  late final GeneratedColumn<bool> hasSignature = GeneratedColumn<bool>(
    'has_signature',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_signature" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientEventId,
    rideId,
    childId,
    type,
    at,
    lat,
    lng,
    note,
    codeWord,
    institutionCode,
    hasSignature,
    attempts,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_event_id')) {
      context.handle(
        _clientEventIdMeta,
        clientEventId.isAcceptableOrUnknown(
          data['client_event_id']!,
          _clientEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientEventIdMeta);
    }
    if (data.containsKey('ride_id')) {
      context.handle(
        _rideIdMeta,
        rideId.isAcceptableOrUnknown(data['ride_id']!, _rideIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rideIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('code_word')) {
      context.handle(
        _codeWordMeta,
        codeWord.isAcceptableOrUnknown(data['code_word']!, _codeWordMeta),
      );
    }
    if (data.containsKey('institution_code')) {
      context.handle(
        _institutionCodeMeta,
        institutionCode.isAcceptableOrUnknown(
          data['institution_code']!,
          _institutionCodeMeta,
        ),
      );
    }
    if (data.containsKey('has_signature')) {
      context.handle(
        _hasSignatureMeta,
        hasSignature.isAcceptableOrUnknown(
          data['has_signature']!,
          _hasSignatureMeta,
        ),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_event_id'],
      )!,
      rideId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ride_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_id'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      at: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}at'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      codeWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_word'],
      ),
      institutionCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_code'],
      ),
      hasSignature: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_signature'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $PendingEventsTable createAlias(String alias) {
    return $PendingEventsTable(attachedDatabase, alias);
  }
}

class PendingEvent extends DataClass implements Insertable<PendingEvent> {
  final int id;

  /// Идентификатор события: с ним сервер не запишет одно и то же дважды.
  final String clientEventId;
  final int rideId;

  /// В пуле этап относится к конкретному ребёнку.
  final int? childId;

  /// Имя значения RideEventType.
  final String type;

  /// Когда водитель нажал кнопку (UTC).
  final DateTime at;
  final double? lat;
  final double? lng;
  final String? note;
  final String? codeWord;
  final String? institutionCode;
  final bool hasSignature;

  /// Сколько раз пытались отправить и чем закончилась последняя попытка.
  final int attempts;
  final String? lastError;
  const PendingEvent({
    required this.id,
    required this.clientEventId,
    required this.rideId,
    this.childId,
    required this.type,
    required this.at,
    this.lat,
    this.lng,
    this.note,
    this.codeWord,
    this.institutionCode,
    required this.hasSignature,
    required this.attempts,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_event_id'] = Variable<String>(clientEventId);
    map['ride_id'] = Variable<int>(rideId);
    if (!nullToAbsent || childId != null) {
      map['child_id'] = Variable<int>(childId);
    }
    map['type'] = Variable<String>(type);
    map['at'] = Variable<DateTime>(at);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || codeWord != null) {
      map['code_word'] = Variable<String>(codeWord);
    }
    if (!nullToAbsent || institutionCode != null) {
      map['institution_code'] = Variable<String>(institutionCode);
    }
    map['has_signature'] = Variable<bool>(hasSignature);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  PendingEventsCompanion toCompanion(bool nullToAbsent) {
    return PendingEventsCompanion(
      id: Value(id),
      clientEventId: Value(clientEventId),
      rideId: Value(rideId),
      childId: childId == null && nullToAbsent
          ? const Value.absent()
          : Value(childId),
      type: Value(type),
      at: Value(at),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      codeWord: codeWord == null && nullToAbsent
          ? const Value.absent()
          : Value(codeWord),
      institutionCode: institutionCode == null && nullToAbsent
          ? const Value.absent()
          : Value(institutionCode),
      hasSignature: Value(hasSignature),
      attempts: Value(attempts),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory PendingEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingEvent(
      id: serializer.fromJson<int>(json['id']),
      clientEventId: serializer.fromJson<String>(json['clientEventId']),
      rideId: serializer.fromJson<int>(json['rideId']),
      childId: serializer.fromJson<int?>(json['childId']),
      type: serializer.fromJson<String>(json['type']),
      at: serializer.fromJson<DateTime>(json['at']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      note: serializer.fromJson<String?>(json['note']),
      codeWord: serializer.fromJson<String?>(json['codeWord']),
      institutionCode: serializer.fromJson<String?>(json['institutionCode']),
      hasSignature: serializer.fromJson<bool>(json['hasSignature']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientEventId': serializer.toJson<String>(clientEventId),
      'rideId': serializer.toJson<int>(rideId),
      'childId': serializer.toJson<int?>(childId),
      'type': serializer.toJson<String>(type),
      'at': serializer.toJson<DateTime>(at),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'note': serializer.toJson<String?>(note),
      'codeWord': serializer.toJson<String?>(codeWord),
      'institutionCode': serializer.toJson<String?>(institutionCode),
      'hasSignature': serializer.toJson<bool>(hasSignature),
      'attempts': serializer.toJson<int>(attempts),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  PendingEvent copyWith({
    int? id,
    String? clientEventId,
    int? rideId,
    Value<int?> childId = const Value.absent(),
    String? type,
    DateTime? at,
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> codeWord = const Value.absent(),
    Value<String?> institutionCode = const Value.absent(),
    bool? hasSignature,
    int? attempts,
    Value<String?> lastError = const Value.absent(),
  }) => PendingEvent(
    id: id ?? this.id,
    clientEventId: clientEventId ?? this.clientEventId,
    rideId: rideId ?? this.rideId,
    childId: childId.present ? childId.value : this.childId,
    type: type ?? this.type,
    at: at ?? this.at,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    note: note.present ? note.value : this.note,
    codeWord: codeWord.present ? codeWord.value : this.codeWord,
    institutionCode: institutionCode.present
        ? institutionCode.value
        : this.institutionCode,
    hasSignature: hasSignature ?? this.hasSignature,
    attempts: attempts ?? this.attempts,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  PendingEvent copyWithCompanion(PendingEventsCompanion data) {
    return PendingEvent(
      id: data.id.present ? data.id.value : this.id,
      clientEventId: data.clientEventId.present
          ? data.clientEventId.value
          : this.clientEventId,
      rideId: data.rideId.present ? data.rideId.value : this.rideId,
      childId: data.childId.present ? data.childId.value : this.childId,
      type: data.type.present ? data.type.value : this.type,
      at: data.at.present ? data.at.value : this.at,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      note: data.note.present ? data.note.value : this.note,
      codeWord: data.codeWord.present ? data.codeWord.value : this.codeWord,
      institutionCode: data.institutionCode.present
          ? data.institutionCode.value
          : this.institutionCode,
      hasSignature: data.hasSignature.present
          ? data.hasSignature.value
          : this.hasSignature,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingEvent(')
          ..write('id: $id, ')
          ..write('clientEventId: $clientEventId, ')
          ..write('rideId: $rideId, ')
          ..write('childId: $childId, ')
          ..write('type: $type, ')
          ..write('at: $at, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('note: $note, ')
          ..write('codeWord: $codeWord, ')
          ..write('institutionCode: $institutionCode, ')
          ..write('hasSignature: $hasSignature, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientEventId,
    rideId,
    childId,
    type,
    at,
    lat,
    lng,
    note,
    codeWord,
    institutionCode,
    hasSignature,
    attempts,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingEvent &&
          other.id == this.id &&
          other.clientEventId == this.clientEventId &&
          other.rideId == this.rideId &&
          other.childId == this.childId &&
          other.type == this.type &&
          other.at == this.at &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.note == this.note &&
          other.codeWord == this.codeWord &&
          other.institutionCode == this.institutionCode &&
          other.hasSignature == this.hasSignature &&
          other.attempts == this.attempts &&
          other.lastError == this.lastError);
}

class PendingEventsCompanion extends UpdateCompanion<PendingEvent> {
  final Value<int> id;
  final Value<String> clientEventId;
  final Value<int> rideId;
  final Value<int?> childId;
  final Value<String> type;
  final Value<DateTime> at;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<String?> note;
  final Value<String?> codeWord;
  final Value<String?> institutionCode;
  final Value<bool> hasSignature;
  final Value<int> attempts;
  final Value<String?> lastError;
  const PendingEventsCompanion({
    this.id = const Value.absent(),
    this.clientEventId = const Value.absent(),
    this.rideId = const Value.absent(),
    this.childId = const Value.absent(),
    this.type = const Value.absent(),
    this.at = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.note = const Value.absent(),
    this.codeWord = const Value.absent(),
    this.institutionCode = const Value.absent(),
    this.hasSignature = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  PendingEventsCompanion.insert({
    this.id = const Value.absent(),
    required String clientEventId,
    required int rideId,
    this.childId = const Value.absent(),
    required String type,
    required DateTime at,
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.note = const Value.absent(),
    this.codeWord = const Value.absent(),
    this.institutionCode = const Value.absent(),
    this.hasSignature = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastError = const Value.absent(),
  }) : clientEventId = Value(clientEventId),
       rideId = Value(rideId),
       type = Value(type),
       at = Value(at);
  static Insertable<PendingEvent> custom({
    Expression<int>? id,
    Expression<String>? clientEventId,
    Expression<int>? rideId,
    Expression<int>? childId,
    Expression<String>? type,
    Expression<DateTime>? at,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? note,
    Expression<String>? codeWord,
    Expression<String>? institutionCode,
    Expression<bool>? hasSignature,
    Expression<int>? attempts,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientEventId != null) 'client_event_id': clientEventId,
      if (rideId != null) 'ride_id': rideId,
      if (childId != null) 'child_id': childId,
      if (type != null) 'type': type,
      if (at != null) 'at': at,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (note != null) 'note': note,
      if (codeWord != null) 'code_word': codeWord,
      if (institutionCode != null) 'institution_code': institutionCode,
      if (hasSignature != null) 'has_signature': hasSignature,
      if (attempts != null) 'attempts': attempts,
      if (lastError != null) 'last_error': lastError,
    });
  }

  PendingEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? clientEventId,
    Value<int>? rideId,
    Value<int?>? childId,
    Value<String>? type,
    Value<DateTime>? at,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<String?>? note,
    Value<String?>? codeWord,
    Value<String?>? institutionCode,
    Value<bool>? hasSignature,
    Value<int>? attempts,
    Value<String?>? lastError,
  }) {
    return PendingEventsCompanion(
      id: id ?? this.id,
      clientEventId: clientEventId ?? this.clientEventId,
      rideId: rideId ?? this.rideId,
      childId: childId ?? this.childId,
      type: type ?? this.type,
      at: at ?? this.at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      note: note ?? this.note,
      codeWord: codeWord ?? this.codeWord,
      institutionCode: institutionCode ?? this.institutionCode,
      hasSignature: hasSignature ?? this.hasSignature,
      attempts: attempts ?? this.attempts,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientEventId.present) {
      map['client_event_id'] = Variable<String>(clientEventId.value);
    }
    if (rideId.present) {
      map['ride_id'] = Variable<int>(rideId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (codeWord.present) {
      map['code_word'] = Variable<String>(codeWord.value);
    }
    if (institutionCode.present) {
      map['institution_code'] = Variable<String>(institutionCode.value);
    }
    if (hasSignature.present) {
      map['has_signature'] = Variable<bool>(hasSignature.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingEventsCompanion(')
          ..write('id: $id, ')
          ..write('clientEventId: $clientEventId, ')
          ..write('rideId: $rideId, ')
          ..write('childId: $childId, ')
          ..write('type: $type, ')
          ..write('at: $at, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('note: $note, ')
          ..write('codeWord: $codeWord, ')
          ..write('institutionCode: $institutionCode, ')
          ..write('hasSignature: $hasSignature, ')
          ..write('attempts: $attempts, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

abstract class _$QueueDatabase extends GeneratedDatabase {
  _$QueueDatabase(QueryExecutor e) : super(e);
  $QueueDatabaseManager get managers => $QueueDatabaseManager(this);
  late final $PendingEventsTable pendingEvents = $PendingEventsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pendingEvents];
}

typedef $$PendingEventsTableCreateCompanionBuilder =
    PendingEventsCompanion Function({
      Value<int> id,
      required String clientEventId,
      required int rideId,
      Value<int?> childId,
      required String type,
      required DateTime at,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> note,
      Value<String?> codeWord,
      Value<String?> institutionCode,
      Value<bool> hasSignature,
      Value<int> attempts,
      Value<String?> lastError,
    });
typedef $$PendingEventsTableUpdateCompanionBuilder =
    PendingEventsCompanion Function({
      Value<int> id,
      Value<String> clientEventId,
      Value<int> rideId,
      Value<int?> childId,
      Value<String> type,
      Value<DateTime> at,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> note,
      Value<String?> codeWord,
      Value<String?> institutionCode,
      Value<bool> hasSignature,
      Value<int> attempts,
      Value<String?> lastError,
    });

class $$PendingEventsTableFilterComposer
    extends Composer<_$QueueDatabase, $PendingEventsTable> {
  $$PendingEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientEventId => $composableBuilder(
    column: $table.clientEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rideId => $composableBuilder(
    column: $table.rideId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codeWord => $composableBuilder(
    column: $table.codeWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institutionCode => $composableBuilder(
    column: $table.institutionCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasSignature => $composableBuilder(
    column: $table.hasSignature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingEventsTableOrderingComposer
    extends Composer<_$QueueDatabase, $PendingEventsTable> {
  $$PendingEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientEventId => $composableBuilder(
    column: $table.clientEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rideId => $composableBuilder(
    column: $table.rideId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codeWord => $composableBuilder(
    column: $table.codeWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institutionCode => $composableBuilder(
    column: $table.institutionCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasSignature => $composableBuilder(
    column: $table.hasSignature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingEventsTableAnnotationComposer
    extends Composer<_$QueueDatabase, $PendingEventsTable> {
  $$PendingEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientEventId => $composableBuilder(
    column: $table.clientEventId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rideId =>
      $composableBuilder(column: $table.rideId, builder: (column) => column);

  GeneratedColumn<int> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get codeWord =>
      $composableBuilder(column: $table.codeWord, builder: (column) => column);

  GeneratedColumn<String> get institutionCode => $composableBuilder(
    column: $table.institutionCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasSignature => $composableBuilder(
    column: $table.hasSignature,
    builder: (column) => column,
  );

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$PendingEventsTableTableManager
    extends
        RootTableManager<
          _$QueueDatabase,
          $PendingEventsTable,
          PendingEvent,
          $$PendingEventsTableFilterComposer,
          $$PendingEventsTableOrderingComposer,
          $$PendingEventsTableAnnotationComposer,
          $$PendingEventsTableCreateCompanionBuilder,
          $$PendingEventsTableUpdateCompanionBuilder,
          (
            PendingEvent,
            BaseReferences<_$QueueDatabase, $PendingEventsTable, PendingEvent>,
          ),
          PendingEvent,
          PrefetchHooks Function()
        > {
  $$PendingEventsTableTableManager(
    _$QueueDatabase db,
    $PendingEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> clientEventId = const Value.absent(),
                Value<int> rideId = const Value.absent(),
                Value<int?> childId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> at = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> codeWord = const Value.absent(),
                Value<String?> institutionCode = const Value.absent(),
                Value<bool> hasSignature = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => PendingEventsCompanion(
                id: id,
                clientEventId: clientEventId,
                rideId: rideId,
                childId: childId,
                type: type,
                at: at,
                lat: lat,
                lng: lng,
                note: note,
                codeWord: codeWord,
                institutionCode: institutionCode,
                hasSignature: hasSignature,
                attempts: attempts,
                lastError: lastError,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String clientEventId,
                required int rideId,
                Value<int?> childId = const Value.absent(),
                required String type,
                required DateTime at,
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> codeWord = const Value.absent(),
                Value<String?> institutionCode = const Value.absent(),
                Value<bool> hasSignature = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => PendingEventsCompanion.insert(
                id: id,
                clientEventId: clientEventId,
                rideId: rideId,
                childId: childId,
                type: type,
                at: at,
                lat: lat,
                lng: lng,
                note: note,
                codeWord: codeWord,
                institutionCode: institutionCode,
                hasSignature: hasSignature,
                attempts: attempts,
                lastError: lastError,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$QueueDatabase,
      $PendingEventsTable,
      PendingEvent,
      $$PendingEventsTableFilterComposer,
      $$PendingEventsTableOrderingComposer,
      $$PendingEventsTableAnnotationComposer,
      $$PendingEventsTableCreateCompanionBuilder,
      $$PendingEventsTableUpdateCompanionBuilder,
      (
        PendingEvent,
        BaseReferences<_$QueueDatabase, $PendingEventsTable, PendingEvent>,
      ),
      PendingEvent,
      PrefetchHooks Function()
    >;

class $QueueDatabaseManager {
  final _$QueueDatabase _db;
  $QueueDatabaseManager(this._db);
  $$PendingEventsTableTableManager get pendingEvents =>
      $$PendingEventsTableTableManager(_db, _db.pendingEvents);
}
