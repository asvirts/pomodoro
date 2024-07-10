import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pomodoro/screens/settings.dart';

void main() {
  testGoldens('Golden test - Home screen', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
      ])
      ..addScenario(
        widget: const ProviderScope(
          child: MyApp(),
        ),
        name: 'Home page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'screen-home_color-red_font-sans');
  });

  testGoldens('Golden test - Settings screen', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
      ])
      ..addScenario(
        widget: const ProviderScope(
          child: SettingsDialog(),
        ),
        name: 'Settings page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'screen-settings');
  });
}
