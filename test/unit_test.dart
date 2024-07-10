import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:riverpod_test/riverpod_test.dart';

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
  });

  testProvider(
    'Default color can be found',
    provider: colorsNotifierProvider,
    expect: () => [
      {PomodoroColors.red}
    ],
  );

  testProvider('Pomodoro timer returns initial value of 25',
      provider: pomodoroTimerNotifierProvider,
      expect: () => [
            {25}
          ]);

  testNotifier('Short break timer increments',
      provider: shortBreakTimerNotifierProvider,
      act: (notifier) => notifier.incrementTimer(),
      expect: () => [
            {6}
          ]);

  testNotifier('Long break timer can be updated with an integer value',
      provider: longBreakTimerNotifierProvider,
      act: (notifier) => notifier.updateTimerDuration(15),
      expect: () => [
            {15}
          ]);

  testNotifier(
    'Mode can be updated',
    provider: modeNotifierProvider,
    act: (notifier) => notifier.updateMode(Modes.longBreak),
    expect: () => [
      {Modes.longBreak}
    ],
  );

  testNotifier(
    'Font theme can be changed',
    provider: fontNotifierProvider,
    act: (notifier) => notifier.updateFonts(0),
    expect: () => [
      {Fonts.sans}
    ],
  );
}
