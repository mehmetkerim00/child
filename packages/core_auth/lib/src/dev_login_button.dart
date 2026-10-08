import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Вход одним нажатием — только вне боевой сборки.
///
/// Ручная проверка упирается в одноразовый код: он печатается в логе
/// сервера, и за каждым входом приходится лезть в соседнее окно. На
/// двух устройствах сразу это превращается в основную работу.
///
/// В боевой сборке кнопки нет, а сервер отказывает в выдаче сессии вне
/// режима development. Второе важнее первого: эндпоинт открытый, и
/// любой, кто знает номер, получил бы сессию семьи — а там имена детей,
/// адреса и время, когда их забирают. Оба запрета закреплены тестами.
class DevLoginButton extends ConsumerStatefulWidget {
  const DevLoginButton({super.key});

  @override
  ConsumerState<DevLoginButton> createState() => _DevLoginButtonState();
}

class _DevLoginButtonState extends ConsumerState<DevLoginButton> {
  String? _error;
  String? _busyPhone;

  Future<void> _signIn(DevAccount account) async {
    setState(() {
      _busyPhone = account.phone;
      _error = null;
    });
    try {
      final session = await ref
          .read(apiClientProvider)
          .dev
          .devLogin(account.phone);
      await ref.read(authControllerProvider.notifier).signInAs(session);
    } catch (_) {
      if (mounted) setState(() => _error = context.l10n.devLoginFail);
    } finally {
      if (mounted) setState(() => _busyPhone = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final accounts = ref.watch(devAccountsProvider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.devLoginTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: ChildSpacing.xs),
            Text(
              l10n.devLoginWhy,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            const SizedBox(height: ChildSpacing.s),
            accounts.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(ChildSpacing.s),
                child: Center(
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              // Сервер не в режиме разработки — это не поломка, а
              // ровно то, чего мы и добиваемся в бою.
              error: (_, _) => Text(
                l10n.devLoginFail,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              data: (list) => list.isEmpty
                  ? Text(l10n.devLoginEmpty, style: theme.textTheme.bodySmall)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final account in list)
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: ChildSpacing.xs,
                            ),
                            child: OutlinedButton(
                              onPressed: _busyPhone != null
                                  ? null
                                  : () => _signIn(account),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_busyPhone == account.phone) ...[
                                    const SizedBox(
                                      height: 14,
                                      width: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    const SizedBox(width: ChildSpacing.s),
                                  ],
                                  Flexible(
                                    child: Text(
                                      '${account.name} · '
                                      '${_roleLabel(l10n, account.role)}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
            if (_error != null) ...[
              const SizedBox(height: ChildSpacing.s),
              Text(
                _error!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _roleLabel(AppLocalizations l10n, AccountRole role) => switch (role) {
    AccountRole.parent => l10n.roleParent,
    AccountRole.driver => l10n.roleDriver,
    AccountRole.dispatcher => l10n.roleDispatcher,
    AccountRole.owner => l10n.roleOwner,
  };
}
