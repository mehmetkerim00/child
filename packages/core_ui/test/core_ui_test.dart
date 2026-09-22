import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BigActionButton не ниже 64dp и реагирует на нажатие', (
    tester,
  ) async {
    var pressed = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: ChildTheme.light(),
        home: Scaffold(
          body: BigActionButton(label: 'Go', onPressed: () => pressed++),
        ),
      ),
    );
    final size = tester.getSize(find.byType(BigActionButton));
    expect(size.height, greaterThanOrEqualTo(ChildSizes.driverActionMinHeight));

    await tester.tap(find.text('Go'));
    expect(pressed, 1);
  });

  test('обе темы собираются из токенов', () {
    expect(ChildTheme.light().colorScheme.primary, ChildColors.primary);
    expect(ChildTheme.dark().brightness, Brightness.dark);
  });
}
