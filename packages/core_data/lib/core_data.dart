/// Доступ к данным: клиент Serverpod, репозитории, офлайн-очередь (drift, S3).
///
/// Сеть и БД — только здесь; бизнес-правила — в core_domain.
library;

export 'package:child_client/child_client.dart' show Client, ServerHealth;

export 'src/api/providers.dart';
export 'src/config/app_config.dart';
