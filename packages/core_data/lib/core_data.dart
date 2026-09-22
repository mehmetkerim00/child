/// Доступ к данным: клиент Serverpod, сессия, репозитории,
/// офлайн-очередь (drift, S3).
///
/// Сеть и БД — только здесь; бизнес-правила — в core_domain.
library;

export 'package:child_client/child_client.dart'
    show
        AccountRole,
        AuthException,
        AuthFailureReason,
        AuthResult,
        Child,
        CircleRank,
        Client,
        DispatcherAccount,
        Driver,
        Family,
        FamilyCircle,
        Institution,
        InstitutionType,
        Parent,
        ParentRole,
        ServerHealth,
        SmsLevel,
        VettingStatus;

export 'src/api/directory_providers.dart';
export 'src/api/providers.dart';
export 'src/auth/auth_controller.dart';
export 'src/auth/token_storage.dart';
export 'src/config/app_config.dart';
