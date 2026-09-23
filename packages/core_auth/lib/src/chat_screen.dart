import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Переписка по поездке — общий экран для родителя и водителя.
///
/// Ни одна сторона не видит номер другой: только имя. Срочные вопросы —
/// кнопкой «Позвонить диспетчеру».
class RideChatScreen extends ConsumerStatefulWidget {
  const RideChatScreen({super.key, required this.rideId, required this.myRole});

  final int rideId;
  final AccountRole myRole;

  @override
  ConsumerState<RideChatScreen> createState() => _RideChatScreenState();
}

class _RideChatScreenState extends ConsumerState<RideChatScreen> {
  final _input = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  /// Порядок фраз совпадает с QuickPhrase.values — так кнопки и сервер
  /// говорят об одном и том же.
  List<String> _phraseLabels(AppLocalizations l10n) => [
    l10n.phraseComingOut,
    l10n.phraseDelayFive,
    l10n.phraseChildSick,
    l10n.phraseWaitingEntrance,
    l10n.phraseArrivedCallChild,
    l10n.phraseAllGood,
  ];

  Future<void> _send(int threadId, {String? body, QuickPhrase? phrase}) async {
    setState(() => _busy = true);
    try {
      await ref
          .read(apiClientProvider)
          .chat
          .send(
            threadId: threadId,
            clientMessageId: DateTime.now().microsecondsSinceEpoch.toString(),
            body: body,
            phrase: phrase,
          );
      _input.clear();
      ref.invalidate(chatMessagesProvider(threadId));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final thread = ref.watch(rideThreadProvider(widget.rideId));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chatTitle),
        actions: const [EmergencyCallButton()],
      ),
      body: switch (thread) {
        AsyncData(value: final data) => _ChatBody(
          threadId: data.id!,
          myRole: widget.myRole,
          input: _input,
          busy: _busy,
          phraseLabels: _phraseLabels(l10n),
          onSendText: (text) => _send(data.id!, body: text),
          onSendPhrase: (index) =>
              _send(data.id!, phrase: QuickPhrase.values[index]),
        ),
        AsyncError() => Center(child: Text(l10n.errorNetwork)),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _ChatBody extends ConsumerWidget {
  const _ChatBody({
    required this.threadId,
    required this.myRole,
    required this.input,
    required this.busy,
    required this.phraseLabels,
    required this.onSendText,
    required this.onSendPhrase,
  });

  final int threadId;
  final AccountRole myRole;
  final TextEditingController input;
  final bool busy;
  final List<String> phraseLabels;
  final ValueChanged<String> onSendText;
  final ValueChanged<int> onSendPhrase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final messages = ref.watch(chatMessagesProvider(threadId));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ChildSpacing.m),
          child: Text(
            l10n.chatHint,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        Expanded(
          child: switch (messages) {
            AsyncData(value: final list) => ChatView(
              emptyText: l10n.chatEmpty,
              messages: [
                for (final message in list)
                  ChatBubbleData(
                    author: message.senderName,
                    text: message.body,
                    time: _time(message.createdAt),
                    isMine: message.senderRole == myRole,
                    isCritical: message.critical,
                  ),
              ],
            ),
            AsyncError() => Center(child: Text(l10n.errorNetwork)),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
        QuickPhraseBar(phrases: phraseLabels, onSelected: onSendPhrase),
        Padding(
          padding: const EdgeInsets.all(ChildSpacing.m),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: input,
                  decoration: InputDecoration(
                    labelText: l10n.chatPlaceholder,
                    border: const OutlineInputBorder(),
                  ),
                  onSubmitted: busy ? null : onSendText,
                ),
              ),
              const SizedBox(width: ChildSpacing.s),
              FilledButton(
                onPressed: busy ? null : () => onSendText(input.text.trim()),
                child: Text(l10n.chatSend),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _time(DateTime utc) {
    final local = AshgabatTime.toLocal(utc);
    return '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
  }
}

/// Кнопка экстренной связи: всегда ведёт к диспетчеру.
///
/// Родитель не звонит водителю напрямую — водитель за рулём, и его номер
/// вообще не раскрывается.
class EmergencyCallButton extends ConsumerWidget {
  const EmergencyCallButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final phone = ref.watch(dispatcherPhoneProvider).valueOrNull;

    return IconButton(
      tooltip: l10n.emergencyCall,
      icon: const Icon(Icons.phone_in_talk, color: ChildColors.danger),
      onPressed: phone == null
          ? null
          : () => showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.emergencyCall),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      phone,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: ChildSpacing.s),
                    Text(l10n.emergencyHint),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.cancel),
                  ),
                ],
              ),
            ),
    );
  }
}
