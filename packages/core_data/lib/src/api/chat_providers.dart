import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Переписка родителя, водителя и диспетчера.
///
/// Телефонов в этих данных нет: приложение показывает только имена.

/// Разговор по поездке (создаётся при первом обращении).
final rideThreadProvider = FutureProvider.autoDispose.family<ChatThread, int>((
  ref,
  rideId,
) {
  return ref.watch(apiClientProvider).chat.threadForRide(rideId);
});

/// Сообщения разговора.
final chatMessagesProvider = FutureProvider.autoDispose
    .family<List<ChatMessage>, int>((ref, threadId) {
      return ref.watch(apiClientProvider).chat.messages(threadId);
    });

/// Номер диспетчера для кнопки экстренной связи — единственный номер,
/// который приложение вообще показывает.
final dispatcherPhoneProvider = FutureProvider.autoDispose<String?>(
  (ref) => ref.watch(apiClientProvider).chat.dispatcherPhone(),
);
