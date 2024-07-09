import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Golden test - Home screen', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
      ])
      ..addScenario(
        widget: const ProviderScope(
          child: MyApp(),
        ),
        name: 'home page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'screen-home_color-red_font-sans');
  });
}
