import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Вопрос теста: формулировка, варианты и номер верного ответа.
typedef TrainingQuestion = ({
  String question,
  List<String> options,
  int correct,
});

/// Вопросы про то, что действительно опасно перепутать.
///
/// Это не экзамен на знание приложения, а проверка протокола: кому можно
/// отдать ребёнка, что делать без связи, зачем кодовое слово. Тексты
/// лежат в локализации: водитель-туркмен читает их на родном языке —
/// иначе тест проверяет знание русского, а не протокола.
List<TrainingQuestion> trainingQuestions(AppLocalizations l10n) => [
  (
    question: l10n.trainingQ1,
    options: [l10n.trainingQ1a, l10n.trainingQ1b, l10n.trainingQ1c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ2,
    options: [l10n.trainingQ2a, l10n.trainingQ2b, l10n.trainingQ2c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ3,
    options: [l10n.trainingQ3a, l10n.trainingQ3b, l10n.trainingQ3c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ4,
    options: [l10n.trainingQ4a, l10n.trainingQ4b, l10n.trainingQ4c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ5,
    options: [l10n.trainingQ5a, l10n.trainingQ5b, l10n.trainingQ5c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ6,
    options: [l10n.trainingQ6a, l10n.trainingQ6b, l10n.trainingQ6c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ7,
    options: [l10n.trainingQ7a, l10n.trainingQ7b, l10n.trainingQ7c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ8,
    options: [l10n.trainingQ8a, l10n.trainingQ8b, l10n.trainingQ8c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ9,
    options: [l10n.trainingQ9a, l10n.trainingQ9b, l10n.trainingQ9c],
    correct: 1,
  ),
  (
    question: l10n.trainingQ10,
    options: [l10n.trainingQ10a, l10n.trainingQ10b, l10n.trainingQ10c],
    correct: 1,
  ),
];

/// Обучение водителя: правила и тест по протоколу передачи.
///
/// Пока тест не сдан, диспетчер не может назначить маршрут — это
/// проверяет сервер, а не только этот экран.
class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  /// Индекс текущего вопроса, null — тест не начат.
  int? _index;
  final _answers = <int>[];
  bool _sending = false;

  void _answer(List<TrainingQuestion> questions, int option) {
    final index = _index!;
    _answers.add(option);
    if (index + 1 < questions.length) {
      setState(() => _index = index + 1);
    } else {
      _finish(questions);
    }
  }

  Future<void> _finish(List<TrainingQuestion> questions) async {
    setState(() => _sending = true);
    var correct = 0;
    for (var i = 0; i < questions.length; i++) {
      if (_answers[i] == questions[i].correct) correct++;
    }

    try {
      await ref
          .read(apiClientProvider)
          .training
          .submitTest(correct: correct, total: questions.length);
      ref.invalidate(myTrainingPassedProvider);
      ref.invalidate(myTrainingResultsProvider);
    } finally {
      if (mounted) {
        setState(() {
          _sending = false;
          _index = null;
          _answers.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_sending) {
      return const Center(child: CircularProgressIndicator());
    }
    return _index == null
        ? _intro(l10n)
        : _question(l10n, trainingQuestions(l10n));
  }

  /// Экран до теста: статус, кнопка и история попыток.
  Widget _intro(AppLocalizations l10n) {
    final passed = ref.watch(myTrainingPassedProvider).valueOrNull ?? false;
    final results =
        ref.watch(myTrainingResultsProvider).valueOrNull ?? const [];

    return ListView(
      padding: const EdgeInsets.all(ChildSpacing.m),
      children: [
        if (passed)
          PendingEventsBadge(isPending: false, text: l10n.trainingPassed)
        else
          StubNotice(text: l10n.trainingIntro),
        const SizedBox(height: ChildSpacing.l),
        BigActionButton(
          label: l10n.trainingStart,
          icon: Icons.school,
          onPressed: () => setState(() => _index = 0),
        ),
        const SizedBox(height: ChildSpacing.l),
        // Сервер отдаёт попытки от свежей к старой.
        for (final result in results)
          ListTile(
            leading: Icon(
              result.passed ? Icons.check_circle : Icons.cancel,
              color: result.passed ? ChildColors.success : ChildColors.danger,
            ),
            title: Text(
              result.passed
                  ? l10n.trainingResult(result.correct, result.total)
                  : l10n.trainingFailed(result.correct, result.total),
            ),
            subtitle: Text('#${result.attempt}'),
          ),
      ],
    );
  }

  /// Один вопрос: крупные кнопки, назад вернуться нельзя — это тест.
  Widget _question(AppLocalizations l10n, List<TrainingQuestion> questions) {
    final index = _index!;
    final question = questions[index];
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(ChildSpacing.m),
      children: [
        Text(
          l10n.trainingQuestion(index + 1, questions.length),
          style: theme.textTheme.labelMedium,
        ),
        const SizedBox(height: ChildSpacing.s),
        Text(question.question, style: theme.textTheme.titleLarge),
        const SizedBox(height: ChildSpacing.l),
        for (var option = 0; option < question.options.length; option++)
          Padding(
            padding: const EdgeInsets.only(bottom: ChildSpacing.s),
            child: OutlinedButton(
              onPressed: () => _answer(questions, option),
              child: Padding(
                padding: const EdgeInsets.all(ChildSpacing.s),
                child: Text(
                  question.options[option],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
