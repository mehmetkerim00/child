import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';

/// Одно сообщение для показа: кто, что и когда.
///
/// Виджет ничего не знает про сеть и модели — приложение передаёт готовые
/// строки. Телефонов здесь нет по устройству: только имена.
class ChatBubbleData {
  const ChatBubbleData({
    required this.author,
    required this.text,
    required this.time,
    required this.isMine,
    this.isCritical = false,
  });

  final String author;
  final String text;
  final String time;

  /// Моё сообщение — выравниваем вправо.
  final bool isMine;

  /// Критичное сообщение продублировано SMS — помечаем.
  final bool isCritical;
}

/// Лента сообщений с пузырями.
class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.messages, required this.emptyText});

  final List<ChatBubbleData> messages;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return Center(child: Text(emptyText));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(ChildSpacing.m),
      itemCount: messages.length,
      itemBuilder: (context, index) => _Bubble(data: messages[index]),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.data});

  final ChatBubbleData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = data.isMine
        ? ChildColors.primary.withValues(alpha: 0.12)
        : theme.colorScheme.surfaceContainerHighest;

    return Align(
      alignment: data.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        margin: const EdgeInsets.only(bottom: ChildSpacing.s),
        padding: const EdgeInsets.all(ChildSpacing.m),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(ChildRadius.card),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.author,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: ChildColors.primary,
                  ),
                ),
                if (data.isCritical) ...[
                  const SizedBox(width: ChildSpacing.xs),
                  const Icon(Icons.sms, size: 14, color: ChildColors.warning),
                ],
              ],
            ),
            const SizedBox(height: ChildSpacing.xs),
            Text(data.text, style: theme.textTheme.bodyLarge),
            const SizedBox(height: ChildSpacing.xs),
            Text(
              data.time,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ряд кнопок с готовыми фразами.
///
/// Водитель за рулём и родитель на работе не набирают длинный текст —
/// кнопка надёжнее и быстрее.
class QuickPhraseBar extends StatelessWidget {
  const QuickPhraseBar({
    super.key,
    required this.phrases,
    required this.onSelected,
  });

  /// Подписи кнопок в порядке показа.
  final List<String> phrases;
  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: ChildSpacing.m),
        itemCount: phrases.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: ChildSpacing.s),
        itemBuilder: (context, index) => ActionChip(
          label: Text(phrases[index]),
          onPressed: () => onSelected(index),
        ),
      ),
    );
  }
}
