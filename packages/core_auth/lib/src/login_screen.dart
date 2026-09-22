import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_error_text.dart';

/// Вход по номеру телефона: сначала номер, затем код из SMS.
///
/// Аккаунты создаёт диспетчер, поэтому незнакомый номер получает отказ,
/// а не регистрацию.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, required this.title});

  /// Название приложения в шапке.
  final String title;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
    } catch (error) {
      if (mounted) setState(() => _error = authErrorText(context.l10n, error));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _requestCode(AuthController controller) {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;
    _run(() => controller.requestCode(phone));
  }

  void _verify(AuthController controller, String phone) {
    final code = _codeController.text.trim();
    if (code.isEmpty) return;
    _run(() => controller.verifyCode(phone, code));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [LanguageMenu()],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ChildSpacing.l),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.loginTitle, style: theme.textTheme.headlineMedium),
                const SizedBox(height: ChildSpacing.l),
                if (state is AuthCodeSent)
                  ..._codeStep(l10n, controller, state.phone)
                else
                  ..._phoneStep(l10n, controller),
                if (_error != null) ...[
                  const SizedBox(height: ChildSpacing.m),
                  Text(
                    _error!,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ],
                const SizedBox(height: ChildSpacing.l),
                Text(
                  l10n.loginHint,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                if (ref.watch(appConfigProvider).flavor == Flavor.dev) ...[
                  const SizedBox(height: ChildSpacing.l),
                  const _DevSeedButton(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _phoneStep(AppLocalizations l10n, AuthController controller) => [
    TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      autofocus: true,
      decoration: InputDecoration(
        labelText: l10n.loginPhoneLabel,
        hintText: l10n.loginPhoneHint,
        prefixText: '+993 ',
        border: const OutlineInputBorder(),
      ),
      onSubmitted: (_) => _requestCode(controller),
    ),
    const SizedBox(height: ChildSpacing.m),
    FilledButton(
      onPressed: _busy ? null : () => _requestCode(controller),
      child: Text(l10n.loginRequestCode),
    ),
  ];

  List<Widget> _codeStep(
    AppLocalizations l10n,
    AuthController controller,
    String phone,
  ) => [
    Text(l10n.loginCodeSentTo(phone)),
    const SizedBox(height: ChildSpacing.m),
    TextField(
      controller: _codeController,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        labelText: l10n.loginCodeLabel,
        border: const OutlineInputBorder(),
      ),
      onSubmitted: (_) => _verify(controller, phone),
    ),
    const SizedBox(height: ChildSpacing.m),
    FilledButton(
      onPressed: _busy ? null : () => _verify(controller, phone),
      child: Text(l10n.loginVerify),
    ),
    TextButton(
      onPressed: _busy ? null : controller.changePhone,
      child: Text(l10n.loginChangePhone),
    ),
  ];
}

/// Кнопка заполнения тестовыми данными — только в dev-сборке.
class _DevSeedButton extends ConsumerStatefulWidget {
  const _DevSeedButton();

  @override
  ConsumerState<_DevSeedButton> createState() => _DevSeedButtonState();
}

class _DevSeedButtonState extends ConsumerState<_DevSeedButton> {
  bool _busy = false;

  Future<void> _seed() async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    try {
      await ref.read(apiClientProvider).dev.seed();
      messenger.showSnackBar(SnackBar(content: Text(l10n.loginDevSeedDone)));
    } catch (error) {
      messenger.showSnackBar(
        SnackBar(content: Text(authErrorText(l10n, error))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.dataset),
      label: Text(context.l10n.loginDevSeed),
      onPressed: _busy ? null : _seed,
    );
  }
}
