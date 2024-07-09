import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pomodoro/widgets/progress_indicator.dart';

void main() {
  testWidgets('Countdown initial state is not started',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));
    await loadAppFonts();

    expect(find.text('START'), findsExactly(1));
    expect(find.text('PAUSE'), findsNothing);

    expect(find.byWidget(const ProgressIndicatorWidget()), ref.watch());
  });
}
