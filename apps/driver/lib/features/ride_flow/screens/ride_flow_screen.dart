import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/pending_events_section.dart';
import '../widgets/ride_flow_texts.dart';

/// Рабочий экран поездки: одна большая кнопка текущего этапа.
///
/// Работает без сети: нажатие ложится в офлайн-очередь и уходит на сервер,
/// когда связь появится (MVP_PLAN §7).
class RideFlowScreen extends ConsumerStatefulWidget {
  const RideFlowScreen({super.key, required this.view});

  final RideView view;

  @override
  ConsumerState<RideFlowScreen> createState() => _RideFlowScreenState();
}

class _RideFlowScreenState extends ConsumerState<RideFlowScreen> {
  late RideStatus _status = widget.view.ride.domainStatus;
  final _codeWord = TextEditingController();
  final _institutionCode = TextEditingController();
  final _signatureKey = GlobalKey<SignaturePadState>();
  bool _hasSignature = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _codeWord.dispose();
    _institutionCode.dispose();
    super.dispose();
  }

  RideEventType? _eventTypeFor(RideAction action) => switch (action) {
    RideAction.depart => RideEventType.enRoute,
    RideAction.pickUp => RideEventType.pickedUp,
    RideAction.startTransit => RideEventType.inTransit,
    RideAction.arrive => RideEventType.arrived,
    RideAction.handOver => RideEventType.handedOver,
    RideAction.delay => RideEventType.delayed,
    RideAction.cancelNoDriver => RideEventType.cancelledNoDriver,
  };

  /// Проверяем шаг теми же правилами, что и сервер: в офлайне сервера
  /// рядом нет, а ошибку водителю надо показать сразу.
  Future<void> _submit(RideAction action, {String? note}) async {
    final step = RideStep(
      action: action,
      codeWordMatches: _codeWord.text.trim().isNotEmpty,
      institutionCodeMatches: _institutionCode.text.trim().isNotEmpty,
      hasSignature: _hasSignature,
      reason: note,
    );

    final local = RideStateMachine.apply(_status, step);
    if (local is RideTransitionDenied) {
      setState(() => _error = rideFlowErrorText(context.l10n, local.error));
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    try {
      await ref
          .read(rideEventQueueProvider)
          .submit(
            rideId: widget.view.ride.id!,
            type: _eventTypeFor(action)!,
            note: note,
            codeWord: action == RideAction.pickUp
                ? _codeWord.text.trim()
                : null,
            institutionCode: action == RideAction.handOver
                ? _institutionCode.text.trim()
                : null,
            hasSignature: _hasSignature,
          );
      if (!mounted) return;
      setState(() {
        _status = (local as RideTransitionAllowed).status;
        _codeWord.clear();
        _institutionCode.clear();
        _hasSignature = false;
      });
      ref.invalidate(driverTodayRidesProvider);
    } on RideFlowException catch (error) {
      if (mounted) {
        setState(() => _error = rideFlowServerErrorText(context.l10n, error));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final view = widget.view;
    final action = RideStateMachine.nextAction(_status);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.rideFlowTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            const PendingEventsSection(),
            const SizedBox(height: ChildSpacing.m),
            Card(
              child: ListTile(
                title: Text(
                  '${view.ride.plannedTime} · ${view.childName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text('${view.fromAddress} → ${view.toName}'),
                trailing: Text(l10n.rideStatus(_status)),
              ),
            ),
            const SizedBox(height: ChildSpacing.l),

            // Кодовое слово нужно только на посадке.
            if (action == RideAction.pickUp) ...[
              Text(l10n.codeWordPrompt),
              const SizedBox(height: ChildSpacing.s),
              TextField(
                controller: _codeWord,
                decoration: InputDecoration(
                  labelText: l10n.codeWordField,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: ChildSpacing.l),
            ],

            // Передача: код учреждения или подпись принимающего.
            if (action == RideAction.handOver) ...[
              Text(l10n.handoverPrompt),
              const SizedBox(height: ChildSpacing.s),
              TextField(
                controller: _institutionCode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l10n.institutionCodeField,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: ChildSpacing.m),
              Text(
                _hasSignature ? l10n.signatureDone : l10n.signatureButton,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: ChildSpacing.s),
              SignaturePad(
                key: _signatureKey,
                onChanged: (value) => setState(() => _hasSignature = value),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _signatureKey.currentState?.clear(),
                  child: Text(l10n.signatureClear),
                ),
              ),
              const SizedBox(height: ChildSpacing.m),
            ],

            if (_error != null) ...[
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: ChildSpacing.m),
            ],

            if (action == null)
              Center(
                child: Text(
                  l10n.rideFinished,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            else ...[
              BigActionButton(
                label: rideActionLabel(l10n, action),
                icon: rideActionIcon(action),
                onPressed: _busy ? null : () => _submit(action),
              ),
              const SizedBox(height: ChildSpacing.m),
              OutlinedButton.icon(
                icon: const Icon(Icons.access_time),
                label: Text(l10n.actionDelay),
                onPressed: _busy ? null : _askDelayReason,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Задержка без причины не принимается: диспетчеру нужно знать, что сказать
  /// родителю.
  Future<void> _askDelayReason() async {
    final l10n = context.l10n;
    final controller = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.actionDelay),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: l10n.delayReasonField,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    if (reason == null || reason.isEmpty) return;
    await _submit(RideAction.delay, note: reason);
  }
}
