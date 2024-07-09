import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pomodoro/main.dart';

import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Test tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));
    await loadAppFonts();

    // Check on tests
    expect(find.text('pomodoro'), findsExactly(2));
    expect(find.text('santa'), findsNothing);
  });
}
