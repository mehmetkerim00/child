import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ввод адреса сервера на экране входа — только в домашней сборке.
///
/// Дома роутер выдаёт ноутбуку новый адрес после каждой перезагрузки.
/// Без этого поля смена адреса означала бы пересборку APK и переустановку
/// на каждом телефоне — ради одной цифры.
///
/// В боевой сборке этого поля нет: подменив адрес, приложение семьи
/// можно увести на чужой сервер, а там имена детей, адреса и время,
/// когда их забирают. Отсутствие поля закреплено тестом.
class ServerAddressField extends ConsumerStatefulWidget {
  const ServerAddressField({super.key});

  @override
  ConsumerState<ServerAddressField> createState() => _ServerAddressFieldState();
}

class _ServerAddressFieldState extends ConsumerState<ServerAddressField> {
  late final TextEditingController _controller = TextEditingController(
    text: ref.read(serverUrlProvider),
  );
  bool _busy = false;
  String? _message;
  bool _ok = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Проверяет связь по введённому адресу и сохраняет его, если дошли.
  ///
  /// Сохраняем только после удачной проверки: иначе одна опечатка
  /// оставила бы приложение без сервера до следующей правки.
  Future<void> _check() async {
    final l10n = context.l10n;
    final typed = _controller.text.trim();

    if (!AppConfig.looksValid(typed)) {
      setState(() {
        _ok = false;
        _message = l10n.serverAddressInvalid;
      });
      return;
    }

    setState(() {
      _busy = true;
      _message = null;
    });

    // Отдельный клиент: основной трогаем только после удачной проверки.
    final probe = Client(AppConfig.normalize(typed));
    try {
      final health = await probe.health.ping();
      await ref.read(serverUrlProvider.notifier).save(typed);
      if (mounted) {
        setState(() {
          _ok = true;
          _message =
              '${l10n.serverAddressOk(health.serverVersion)} · '
              '${l10n.serverAddressSaved}';
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _ok = false;
          _message = l10n.serverAddressFail;
        });
      }
    } finally {
      probe.close();
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _reset() async {
    await ref.read(serverUrlProvider.notifier).reset();
    if (!mounted) return;
    _controller.text = ref.read(serverUrlProvider);
    setState(() {
      _ok = false;
      _message = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final current = ref.watch(serverUrlProvider);
    final controller = ref.read(serverUrlProvider.notifier);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.serverAddressTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: ChildSpacing.xs),
            Text(
              l10n.serverAddressWhy,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            const SizedBox(height: ChildSpacing.m),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.url,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: l10n.serverAddressHint,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              onSubmitted: (_) => _busy ? null : _check(),
            ),
            const SizedBox(height: ChildSpacing.s),
            // Что действует прямо сейчас: после смены Wi-Fi это первое,
            // что хочется увидеть.
            Text(
              l10n.serverAddressCurrent(current),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            if (_message != null) ...[
              const SizedBox(height: ChildSpacing.s),
              Text(
                _message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _ok ? ChildColors.success : theme.colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: ChildSpacing.s),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: _busy ? null : _check,
                    child: _busy
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.serverAddressCheck),
                  ),
                ),
                if (controller.isOverridden) ...[
                  const SizedBox(width: ChildSpacing.s),
                  TextButton(
                    onPressed: _busy ? null : _reset,
                    child: Text(l10n.serverAddressReset),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
