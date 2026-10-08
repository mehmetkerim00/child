import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';

/// Адрес сервера, которым пользуется приложение прямо сейчас.
///
/// Обычно это адрес из сборки. В домашнем тесте его можно поменять в
/// приложении: роутер выдаёт ноутбуку новый адрес после каждой
/// перезагрузки, и пересобирать из-за этого APK на двух телефонах —
/// абсурд.
///
/// Сохранённый адрес применяется, только если сборка это разрешает.
/// Иначе боевое приложение, которому однажды подсунули чужой адрес,
/// так на нём и осталось бы.
class ServerUrlController extends StateNotifier<String> {
  ServerUrlController(this.config, {SharedPreferences? prefs})
    : _prefs = prefs,
      super(config.serverUrl) {
    if (config.canOverrideServer) _restore();
  }

  static const _key = 'child.server.url';

  final AppConfig config;
  SharedPreferences? _prefs;

  /// Адрес из сборки — к нему возвращает «сбросить».
  String get builtIn => config.serverUrl;

  /// Задан ли адрес вручную.
  bool get isOverridden => state != config.serverUrl;

  Future<SharedPreferences> get _store async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<void> _restore() async {
    try {
      final saved = (await _store).getString(_key);
      if (saved != null && AppConfig.looksValid(saved) && mounted) {
        state = AppConfig.normalize(saved);
      }
    } catch (_) {
      // Настройки не прочитались — работаем с адресом из сборки.
    }
  }

  /// Запоминает новый адрес. Возвращает false, если сборка этого не
  /// разрешает или адрес не похож на адрес.
  Future<bool> save(String url) async {
    if (!config.canOverrideServer || !AppConfig.looksValid(url)) return false;

    final normalized = AppConfig.normalize(url);
    state = normalized;
    try {
      await (await _store).setString(_key, normalized);
    } catch (_) {
      // Не сохранилось — адрес всё равно действует до перезапуска.
    }
    return true;
  }

  /// Возвращает адрес из сборки.
  Future<void> reset() async {
    state = config.serverUrl;
    try {
      await (await _store).remove(_key);
    } catch (_) {
      // Ничего страшного: адрес уже сброшен в памяти.
    }
  }
}
