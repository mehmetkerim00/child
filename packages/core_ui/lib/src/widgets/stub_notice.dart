import 'package:flutter/material.dart';

import '../tokens/spacing_tokens.dart';

/// Плашка «экран-заглушка» для ещё не реализованных разделов.
class StubNotice extends StatelessWidget {
  const StubNotice({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(ChildSpacing.m),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(ChildRadius.card),
      ),
      child: Row(
        children: [
          Icon(Icons.construction, color: scheme.onSecondaryContainer),
          const SizedBox(width: ChildSpacing.s),
          Expanded(
            child: Text(text, style: TextStyle(color: scheme.onSecondaryContainer)),
          ),
        ],
      ),
    );
  }
}
