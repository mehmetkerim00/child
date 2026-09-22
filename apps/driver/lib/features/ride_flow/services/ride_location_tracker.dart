import 'dart:async';

import 'package:core_data/core_data.dart';
import 'package:geolocator/geolocator.dart';

/// Передача положения машины родителю во время поездки.
///
/// Жёсткие правила (иначе это слежка за водителем):
/// - геолокация включается только на активной поездке и выключается
///   сразу после «Передал», отмены или выхода из аккаунта;
/// - работает как foreground service с видимым уведомлением — водитель
///   всегда знает, что координаты передаются;
/// - точки копятся и уходят пачкой, чтобы не жечь батарею и трафик.
class RideLocationTracker {
  RideLocationTracker(this._client);

  final Client _client;

  /// Как часто устройство отдаёт координаты.
  static const interval = Duration(seconds: 7);

  /// Как часто пачка уходит на сервер.
  static const flushInterval = Duration(seconds: 30);

  /// Сколько точек отправляем, не дожидаясь таймера.
  static const flushSize = 5;

  StreamSubscription<Position>? _positions;
  Timer? _flushTimer;
  final _buffer = <RideLocationPoint>[];
  int? _rideId;

  /// Идёт ли сейчас передача координат.
  bool get isTracking => _rideId != null;

  /// Включает передачу координат для поездки.
  ///
  /// Возвращает false, если пользователь не дал разрешение — поездку
  /// это не ломает, водитель просто отмечает этапы кнопками.
  Future<bool> start(int rideId) async {
    if (_rideId == rideId) return true;
    await stop();

    if (!await _ensurePermission()) return false;

    _rideId = rideId;
    _positions =
        Geolocator.getPositionStream(
          locationSettings: AndroidSettings(
            accuracy: LocationAccuracy.high,
            intervalDuration: interval,
            // Уведомление обязательно: и по правилам Android, и по-честному
            // по отношению к водителю.
            foregroundNotificationConfig: const ForegroundNotificationConfig(
              notificationTitle: 'Child: идёт поездка',
              notificationText:
                  'Родитель видит, где машина. Передача выключится '
                  'после «Передал».',
              enableWakeLock: true,
            ),
          ),
        ).listen(
          _onPosition,
          onError: (_) {
            // Потеря сигнала не должна ронять экран поездки.
          },
        );

    _flushTimer = Timer.periodic(flushInterval, (_) => _flush());
    return true;
  }

  /// Выключает передачу координат и убирает уведомление.
  Future<void> stop() async {
    _flushTimer?.cancel();
    _flushTimer = null;
    await _positions?.cancel();
    _positions = null;
    if (_buffer.isNotEmpty) await _flush();
    _buffer.clear();
    _rideId = null;
  }

  void _onPosition(Position position) {
    _buffer.add(
      RideLocationPoint(
        at: position.timestamp.toUtc(),
        lat: position.latitude,
        lng: position.longitude,
        speedKmh: position.speed * 3.6,
        accuracyM: position.accuracy,
      ),
    );
    if (_buffer.length >= flushSize) _flush();
  }

  Future<void> _flush() async {
    final rideId = _rideId;
    if (rideId == null || _buffer.isEmpty) return;

    final batch = List<RideLocationPoint>.from(_buffer);
    _buffer.clear();
    try {
      final state = await _client.rides.pushLocations(rideId, batch);
      // Сервер — последняя инстанция: сказал «поездка закончилась» —
      // выключаемся, даже если приложение думает иначе.
      if (!state.trackingAllowed) await stop();
    } catch (_) {
      // Нет связи: вернём точки в начало очереди и попробуем позже.
      _buffer.insertAll(0, batch);
    }
  }

  Future<bool> _ensurePermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) return false;
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
}
