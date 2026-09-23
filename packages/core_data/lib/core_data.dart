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
        BalanceView,
        CashTopUp,
        ChatMessage,
        ChatThread,
        Child,
        CircleRank,
        Client,
        DispatcherAccount,
        DispatcherTask,
        DispatcherTaskKind,
        Driver,
        Family,
        FamilyCircle,
        Institution,
        LedgerEntry,
        LedgerEntryType,
        InstitutionType,
        NotificationChannel,
        NotificationOutbox,
        NotificationStatus,
        Parent,
        ParentRole,
        QuickPhrase,
        Ride,
        RideEvent,
        RideEventType,
        RideEventSubmission,
        RideLocation,
        RideLocationPoint,
        RideFlowError,
        RideFlowException,
        PoolCandidate,
        PoolCapacity,
        RideSeat,
        RideStatus,
        RideView,
        RouteDirection,
        RouteTemplate,
        TrackingState,
        ServerHealth,
        SmsLevel,
        VettingStatus;

export 'src/api/chat_providers.dart';
export 'src/api/directory_providers.dart';
export 'src/api/money_providers.dart';
export 'src/api/ride_providers.dart';
export 'src/api/providers.dart';
export 'src/auth/auth_controller.dart';
export 'src/auth/token_storage.dart';
export 'src/config/app_config.dart';
export 'src/offline/queue_database.dart' show QueueDatabase;
export 'src/offline/ride_event_queue.dart';
